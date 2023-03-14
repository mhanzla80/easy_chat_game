import 'package:easy_chat_game/src/chat_level_screen.dart';
import 'package:easy_chat_game/src/chat_screen.dart';
import 'package:easy_chat_game/src/easy_chat_game_controller.dart';
import 'package:easy_chat_game/src/models/chat_level.dart';
import 'package:easy_chat_game/src/utilities/my_audio_player.dart';
import 'package:easy_chat_game/src/utilities/prefs.dart';
import 'package:easy_chat_game/src/utilities/size_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EasyChatGameApp extends StatelessWidget {
  /// This is the main title text
  final String title;

  /// Add All levels here
  final List<ChatLevel> levels;

  /// [placementBuilder] is used to build your custom widget at specific places
  final PlacementBuilder? placementBuilder;

  /// [onTapEvent] will be call on every event preformed by the user
  final EventActionCallback? onTapEvent;

  /// This will analyse your levels in debug mode only and print debug log if there is any issues in keys
  final bool checkLevels;

  const EasyChatGameApp({
    Key? key,
    required this.title,
    required this.levels,
    this.checkLevels = true,
    this.onTapEvent,
    this.placementBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    if (checkLevels && kDebugMode) {
      _logMessage(
          '---------------- LEVEL KEYS ANALYSIS BEGINS ----------------');
      _printUnreachableKeys(levels);
      _logMessage('---------------- LEVEL KEYS ANALYSIS ENDS ----------------');
    }

    final child = EasyChatGameController(
      title: title,
      placementBuilder: placementBuilder,
      onTapEvent: onTapEvent,
      parentContext: context,
      levels: levels,

      /// Package has its own navigation
      child: Navigator(
        initialRoute: levels.length == 1
            ? ChatScreen.routeName
            : ChatLevelScreen.routeName,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case ChatLevelScreen.routeName:
              return _generatePage(const ChatLevelScreen());
            case ChatScreen.routeName:
              return _generatePage(ChatScreen(
                  level: levels.length == 1
                      ? levels.first
                      : settings.arguments as ChatLevel));
          }
          return null;
        },
      ),
    );

    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return child;
        }

        return const Center(child: CircularProgressIndicator.adaptive());
      },
      future: _initialize(),
    );
  }

  Future<void> _initialize() async {
    await MyAudioPlayer.instance.init();
    await Prefs.instance.init();
  }

  static void _printUnreachableKeys(final List<ChatLevel> levels) {
    for (final level in levels) {
      final chatList = level.chatList;
      final allKeys = chatList.keys.toList();

      _printUnReachableKeys(
          level.willSenderInitiateChat ? ChatLevel.botKey : ChatLevel.userKey,
          chatList,
          level,
          allKeys);
    }
  }

  static void _logMessage(String message) {
    if (kDebugMode) print(message);
  }

  static void _printUnReachableKeys(
      String root,
      Map<String, List<String>> chatList,
      ChatLevel level,
      List<String> allKeys) {
    if (level.isSuccessMessage(root)) {
      // print('success message hit: $root');
      return;
    } else if (level.isErrorMessage(root)) {
      // print('error message hit: $root');
      return;
    } else if (!allKeys.contains(root)) {
      _logMessage(
          '---------------- Key does not exist: $root, level name: ${level.levelName} ----------------');
      return;
    }

    final list = chatList[root];
    if (list == null) return;

    for (int i = 0; i < list.length; i++) {
      _printUnReachableKeys(list[i], chatList, level, allKeys);
    }
  }

  Route _generatePage(child) => MaterialPageRoute(builder: (_) => child);
}
