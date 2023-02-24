import 'package:easy_chat_game/src/utilities/size_config.dart';
import 'package:easy_chat_game/src/widgets/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';

class ControlLevelTitlePanel extends StatelessWidget {
  const ControlLevelTitlePanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ChatProvider, IntroPopupState>(
      selector: (context, model) => model.introPopupState,
      builder: (BuildContext context, introPopupState, Widget? child) {
        if (introPopupState == IntroPopupState.shouldDisplay) {
          return const LevelTitlePanel();
        } else if (introPopupState == IntroPopupState.shouldHide) {
          return const LevelTitlePanel(control: Control.playReverse);
        }
        return const SizedBox();
      },
      child: const SizedBox(),
    );
  }
}

class LevelTitlePanel extends StatelessWidget {
  final Control control;

  const LevelTitlePanel({super.key, this.control = Control.play});

  @override
  Widget build(BuildContext context) {
    final levelName =
        context.select((ChatProvider provider) => provider.level.levelName);
    const delay = Duration(milliseconds: 100);
    const duration = Duration(milliseconds: 300);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildContainerLine(context, delay, duration, true),
        CustomAnimationBuilder<double>(
          control: control,
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: child,
            );
          },
          delay: delay,
          duration: duration,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              levelName,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        _buildContainerLine(context, delay, duration, false),
      ],
    );
  }

  SizedBox _buildContainerLine(
      BuildContext context, Duration delay, Duration duration, bool isUpper) {
    final multiplier = isUpper ? -1 : 1;
    return SizedBox(
      height: 20,
      child: Stack(
        children: [
          CustomAnimationBuilder<double>(
            control: control,
            tween: Tween(begin: 1.0, end: 0.0),
            builder: (context, value, child) {
              return Positioned(
                right: multiplier * SizeConfig.screenWidth * value,
                child: child!,
              );
            },
            delay: delay,
            duration: duration,
            child: Container(
              color: Theme.of(context).colorScheme.secondary,
              width: SizeConfig.screenWidth,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
