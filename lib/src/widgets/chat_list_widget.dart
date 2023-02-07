import 'package:easy_chat_game/src/models/chat_level.dart';
import 'package:easy_chat_game/src/widgets/chat_provider.dart';
import 'package:easy_chat_game/src/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class ChatListWidget extends StatelessWidget {
  final ChatLevel level;
  final bool willSenderInitiateChat;

  ChatListWidget(this.level, {super.key})
      : willSenderInitiateChat = level.willSenderInitiateChat;

  bool _isSender(int index) {
    if (willSenderInitiateChat) {
      return index % 2 == 0;
    } else {
      return index % 2 == 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (BuildContext context, model, Widget? child) {
        final scrollController = ScrollController();
        if (model.messages.isNotEmpty) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 100),
              curve: Curves.ease,
            );
          });
        }

        return ListView.builder(
          controller: scrollController,
          itemCount: model.messages.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final brightness = Theme.of(context).brightness;
            bool isDarkMode = brightness == Brightness.dark;
            return MessageWidget(
                _isSender(index), level, model.messages[index], isDarkMode);
          },
        );
      },
    );
  }
}
