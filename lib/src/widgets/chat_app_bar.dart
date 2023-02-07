import 'package:easy_chat_game/src/utilities/my_audio_player.dart';
import 'package:easy_chat_game/src/utilities/size_config.dart';
import 'package:easy_chat_game/src/widgets/chat_avatar.dart';
import 'package:flutter/material.dart';

class ChatHeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  final String imgSrc;

  const ChatHeaderWidget(
    this.title,
    this.imgSrc, {
    Key? key,
  })  : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      leading: BackButton(onPressed: () => _onBackPressed(context)),
      title: Row(
        children: [
          ChatAvatar(imgSrc),
          const HorizontalSpacing(of: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.appBarTheme.titleTextStyle),
              const VerticalSpacing(of: 3),
              Text('Active Now',
                  style:
                      theme.textTheme.bodySmall!.copyWith(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }

  void _onBackPressed(BuildContext context) {
    MyAudioPlayer.instance.playButtonTap();

    Navigator.maybePop(context);
  }
}
