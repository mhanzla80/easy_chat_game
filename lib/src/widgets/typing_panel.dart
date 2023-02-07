import 'package:easy_chat_game/src/widgets/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';

class TypingPanel extends StatelessWidget {
  const TypingPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final senderName =
        context.select((ChatProvider provider) => provider.level.botName);
    return Selector<ChatProvider, bool>(
      selector: (context, model) => model.isTyping,
      builder: (BuildContext context, isTyping, Widget? child) {
        return Visibility(
          visible: isTyping,
          child: PlayAnimation(
            duration: const Duration(milliseconds: 200),
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (_, animChild, double value) {
              return Opacity(
                opacity: value,
                child: animChild,
              );
            },
            child: child,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Text("$senderName is typing "),
            SpinKitThreeBounce(
              color: Theme.of(context).colorScheme.secondary,
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
