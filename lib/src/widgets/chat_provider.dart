import 'dart:async';

import 'package:collection/collection.dart';
import 'package:easy_chat_game/src/models/chat_level.dart';
import 'package:easy_chat_game/src/utilities/prefs.dart';
import 'package:easy_chat_game/src/widgets/level_complete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum IntroPopupState { shouldDisplay, shouldHide, displayed }

class ChatProvider extends ChangeNotifier {
  List<String> messages = [];

  final ChatLevel level;
  bool isTyping = false;
  IntroPopupState introPopupState = IntroPopupState.shouldDisplay;

  ChatProvider(this.level) {
    if (level.willSenderInitiateChat) {
      final message = level.getSenderMessage;
      if (message != null) {
        // MyAudioPlayer.instance.playMessageReceived();
        messages.add(message);
      }
    }
  }

  String? get _getLastMessage =>
      messages.isNotEmpty ? messages[messages.length - 1] : null;

  addMessage(String message) {
    messages.add(message);

    notifyListeners();
  }

  void onOptionSelected(BuildContext context, String selectedOption) {
    // MyAudioPlayer.instance.playMessageSent();

    // add selected option into message panel
    messages.add(selectedOption);

    if (introPopupState == IntroPopupState.shouldDisplay) {
      introPopupState = IntroPopupState.shouldHide;
    } else if (introPopupState == IntroPopupState.shouldHide) {
      introPopupState = IntroPopupState.displayed;
    }

    bool isGameEnded = _checkForEndCase(context, selectedOption);
    if (!isGameEnded) isTyping = true;

    notifyListeners();

    HapticFeedback.heavyImpact();

    if (isTyping) {
      Timer(const Duration(seconds: 2), () {
        isTyping = false;

        // get next teacher message
        final senderOption = getNextOptions()?.firstOrNull;
        if (senderOption == null) return;

        messages.add(senderOption);

        _checkForEndCase(context, senderOption);

        notifyListeners();

        HapticFeedback.heavyImpact();
        // MyAudioPlayer.instance.playMessageReceived();
      });
    }
  }

  bool _checkForEndCase(BuildContext context, String message) {
    if (level.isSuccessMessage(message)) {
      Prefs.instance.incrementCompletedLevelCount();
      _showEndDialog(context, true);
      return true;
    } else if (level.isErrorMessage(message)) {
      _showEndDialog(context, false);
      return true;
    }

    return false;
  }

  List<String>? getNextOptions() {
    if (isTyping) return null;

    return level.chatList[_getLastMessage ?? ChatLevel.userKey];
  }

  _showEndDialog(BuildContext context, bool isSuccess) async {
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) await LevelEndDialog.show(context, isSuccess);
    if (context.mounted) Navigator.of(context).pop(isSuccess);
  }
}
