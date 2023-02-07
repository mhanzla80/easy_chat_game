import 'package:easy_chat_game/src/easy_chat_game_controller.dart';
import 'package:easy_chat_game/src/models/chat_level.dart';
import 'package:easy_chat_game/src/models/enums.dart';
import 'package:easy_chat_game/src/widgets/chat_app_bar.dart';
import 'package:easy_chat_game/src/widgets/chat_list_widget.dart';
import 'package:easy_chat_game/src/widgets/chat_options_panel.dart';
import 'package:easy_chat_game/src/widgets/chat_provider.dart';
import 'package:easy_chat_game/src/widgets/level_title_panel.dart';
import 'package:easy_chat_game/src/widgets/typing_panel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = "/chatScreen";
  final ChatLevel level;

  const ChatScreen({super.key, required this.level});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: ChatHeaderWidget(level.botName, level.botImg),
      body: ListenableProvider(
        create: (context) => ChatProvider(level),
        builder: (context, Widget? child) => _buildBody(context, level),
      ),
    );
  }

  Widget _buildBody(BuildContext context, ChatLevel level) {
    final controller = EasyChatGameController.of(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            Expanded(child: ChatListWidget(level)),
            const TypingPanel(),
            const ChatOptionsPanel(),
          ],
        ),
        if (controller.placementBuilder != null)
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: controller.placementBuilder!
                  .call(context, ChatGamePlacement.optionPanel),
            ),
          ),
        const ControlLevelTitlePanel(),
      ],
    );
  }
}
