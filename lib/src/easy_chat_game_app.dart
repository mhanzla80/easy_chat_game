import 'package:easy_chat_game/src/chat_level_screen.dart';
import 'package:easy_chat_game/src/chat_screen.dart';
import 'package:easy_chat_game/src/easy_chat_game_controller.dart';
import 'package:easy_chat_game/src/models/chat_level.dart';
import 'package:easy_chat_game/src/utilities/my_audio_player.dart';
import 'package:easy_chat_game/src/utilities/prefs.dart';
import 'package:easy_chat_game/src/utilities/size_config.dart';
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

  const EasyChatGameApp({
    Key? key,
    required this.title,
    required this.levels,
    this.onTapEvent,
    this.placementBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final child = EasyChatGameController(
      title: title,
      placementBuilder: placementBuilder,
      onTapEvent: onTapEvent,
      context: context,
      levels: levels,

      /// Package has its own navigation
      child: Navigator(
        initialRoute: ChatLevelScreen.routeName,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case ChatLevelScreen.routeName:
              return _generatePage(const ChatLevelScreen());
            case ChatScreen.routeName:
              return _generatePage(
                  ChatScreen(level: settings.arguments as ChatLevel));
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

  Route _generatePage(child) => MaterialPageRoute(builder: (_) => child);

  static void launchApp(
    BuildContext context, {
    /// This is the main title text
    required final String title,

    /// Add All levels here
    required final List<ChatLevel> levels,

    /// [placementBuilder] is used to build your custom widget at specific places
    final PlacementBuilder? placementBuilder,

    /// [onTapEvent] will be call on every event preformed by the user
    final EventActionCallback? onTapEvent,
  }) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => Scaffold(
            body: EasyChatGameApp(
              title: title,
              placementBuilder: placementBuilder,
              onTapEvent: onTapEvent,
              levels: levels,
            ),
          ),
        ),
      );
}
