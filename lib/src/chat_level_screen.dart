import 'package:easy_chat_game/src/chat_screen.dart';
import 'package:easy_chat_game/src/easy_chat_game_controller.dart';
import 'package:easy_chat_game/src/models/chat_level.dart';
import 'package:easy_chat_game/src/models/enums.dart';
import 'package:easy_chat_game/src/utilities/my_audio_player.dart';
import 'package:easy_chat_game/src/utilities/prefs.dart';
import 'package:easy_chat_game/src/widgets/maybe_close_button.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class ChatLevelScreen extends StatefulWidget {
  static const String routeName = "/chatLevelScreen";

  const ChatLevelScreen({super.key});

  @override
  State<ChatLevelScreen> createState() => _ChatLevelScreenState();
}

class _ChatLevelScreenState extends State<ChatLevelScreen> {
  @override
  Widget build(BuildContext context) {
    final levels = EasyChatGameController.of(context).levels;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      MaybeCloseButton(
                          EasyChatGameController.of(context).parentContext),
                      Text(
                        'Chat Stories',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                _buildLevels(levels),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLevels(List<ChatLevel> levels) {
    List<Widget> widgets = [];
    List<Widget> widgetLines = [];

    const double colPadding = 50, cols = 3, w = 70, h = 70;
    const double rowPadding = 40;

    const stackWidth = cols * (w + rowPadding) - rowPadding;
    final stackHeight = (levels.length / cols) * (h + colPadding);
    widgets.add(SizedBox(height: stackHeight, width: stackWidth));

    bool isReverse = true;
    double left = rowPadding + w;
    double top = colPadding + h;
    for (int i = 0; i < levels.length; i++) {
      if (i % cols == 0) isReverse = !isReverse;

      if (i < levels.length - 1) {
        final widgetLine = _getLineWidget(
            isReverse, i, cols, left, top, w, h, rowPadding, colPadding);
        widgetLines.add(widgetLine);
      }

      final widget = Positioned(
        left: _getLeftIndex(isReverse, i, cols) * left,
        top: i ~/ cols * top,
        width: w,
        height: h,
        child: _buildLevel(i, levels),
      );
      widgets.add(widget);
    }

    widgetLines.addAll(widgets);

    return SizedBox(
      width: double.infinity,
      child: Align(
        alignment: Alignment.center,
        child: Stack(children: widgetLines),
      ),
    );
  }

  Widget _buildLevel(int i, List<ChatLevel> levels) {
    final completedLevelCount = Prefs.instance.getCompletedLevelCount();

    Widget innerWidget;
    if (i < completedLevelCount) {
      innerWidget = const Icon(Icons.check);
    } else if (i == completedLevelCount) {
      innerWidget = MirrorAnimationBuilder(
        builder: (context, value, animChild) {
          return Transform.scale(scale: value, child: animChild);
        },
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        tween: Tween(begin: 0.9, end: 1.1),
        child: GestureDetector(
          onTap: () => _onTapLevel(levels),
          child: const Center(
            child: Text(
              '😍',
              style: TextStyle(fontSize: 50, color: Colors.red),
            ),
          ),
        ),
      );
    } else {
      innerWidget = const Icon(Icons.lock);
    }

    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: i <= completedLevelCount
              ? Colors.green.withOpacity(1)
              : Colors.grey.withOpacity(1),
        ),
        child: innerWidget);
  }

  static double _getLeftIndex(bool isReverse, int i, double cols) {
    cols *= 2;
    if (isReverse) {
      return (cols - 1) - i % cols;
    } else {
      return i % cols;
    }
  }

  _getLineWidget(bool isReverse, int i, double cols, double left, double top,
      double w, double h, double rowPadding, double colPadding) {
    final index = i % (cols * 2);
    final selectedColor = i < Prefs.instance.getCompletedLevelCount()
        ? Colors.green
        : Theme.of(context).disabledColor;
    if (index < 2) {
      return Positioned(
          left: _getLeftIndex(isReverse, i, cols) * left + w / 1.5,
          top: i ~/ cols * top + h / 3,
          width: w,
          height: h / 3,
          child: Container(color: selectedColor));
    } else if (index == 2 || index == 5) {
      return Positioned(
        left: _getLeftIndex(isReverse, i, cols) * left + w / 3,
        top: i ~/ cols * top + h / 3,
        width: w / 3,
        height: colPadding + h,
        child: Container(color: selectedColor),
      );
    } else {
      return Positioned(
        right: (i % cols) * left + w / 1.5,
        top: i ~/ cols * top + h / 3,
        width: w,
        height: h / 3,
        child: Container(color: selectedColor),
      );
    }
  }

  void _onTapLevel(List<ChatLevel> levels) async {
    final controller = EasyChatGameController.of(context);
    if (controller.onTapEvent != null) {
      controller.onTapEvent!.call(context, ChatGameEventAction.levelTap);
    }

    final completedLevelCount = Prefs.instance.getCompletedLevelCount();

    if (completedLevelCount >= levels.length) return;

    MyAudioPlayer.instance.playButtonTap();

    final level = levels[completedLevelCount];
    if (context.mounted) {
      final isLevelCompleted = await Navigator.pushNamed(
          context, ChatScreen.routeName,
          arguments: level);
      final isLevelCompleted2 = isLevelCompleted as bool?;
      if (isLevelCompleted2 == null) return;

      if (isLevelCompleted2) {
        setState(() {});
      }
    }

    Future.delayed(
        const Duration(milliseconds: 200), () => _onTapLevel(levels));
  }
}
