import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:easy_chat_game/src/utilities/size_config.dart';
import 'package:easy_chat_game/src/widgets/my_elevated_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:simple_animations/simple_animations.dart';

class LevelEndDialog extends StatefulWidget {
  final bool isSuccessful;

  const LevelEndDialog(this.isSuccessful, {super.key});

  @override
  State<LevelEndDialog> createState() => _LevelEndDialogState();

  static Future<void> show(BuildContext context, bool isSuccessful) {
    if (isSuccessful) {
      // MyAudioPlayer.instance.playApplause();
    } else {
      HapticFeedback.vibrate();
      // MyAudioPlayer.instance.playLevelFailed();
    }

    Dialog dialog = Dialog(
      shape: null,
      child: LevelEndDialog(isSuccessful),
    );
    return showDialog(
      context: context,
      builder: (BuildContext context) => dialog,
      barrierDismissible: false,
    );
  }
}

class _LevelEndDialogState extends State<LevelEndDialog> {
  final confettiController =
      ConfettiController(duration: const Duration(seconds: 2));

  @override
  void initState() {
    super.initState();
    if (widget.isSuccessful && !kDebugMode) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        confettiController.play();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(color: theme.colorScheme.secondary),
            height: getProportionateScreenHeight(230),
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                LoopAnimation<double>(
                  duration: const Duration(seconds: 3),
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (_, animChild, value) {
                    return Transform.rotate(
                      angle: value * 2 * pi,
                      child: animChild,
                    );
                  },
                  child: Image.asset(
                    'assets/chat/level_burst.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.asset(
                    'assets/chat/level_${widget.isSuccessful ? 'completed' : 'failed'}.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
          _buildConfetti(confettiController),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Text(
              'You ${widget.isSuccessful ? 'WIN' : 'LOSE'}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          _buildBottomButton(),
        ],
      ),
    );
  }

  Future _showBottomButton() async {
    await Future.delayed(const Duration(seconds: 1));

    // if (AdManager.instance.showInterstitial()) {
    //   await Future.delayed(const Duration(seconds: 1));
    // } else {
    //   EasyAds.instance.loadAd();
    // }

    return;
  }

  Widget _buildBottomButton() {
    return FutureBuilder(
      future: _showBottomButton(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }

        return MyRaisedButton(
          buttonTitle: widget.isSuccessful ? 'Next Level' : 'Try Again',
          onTap: () {
            // MyAudioPlayer.instance.playButtonTap();
            Navigator.pop(context);
          },
          color: widget.isSuccessful ? Colors.green : Colors.redAccent,
        );
      },
    );
  }

  Widget _buildConfetti(ConfettiController confettiController) {
    if (!widget.isSuccessful) return const SizedBox();

    return Align(
      alignment: Alignment.center,
      child: ConfettiWidget(
        confettiController: confettiController,
        blastDirection: pi / 2,
        numberOfParticles: 40,
        maxBlastForce: 70,
        blastDirectionality: BlastDirectionality.explosive,
        minBlastForce: 40,
        gravity: 0.3,
        shouldLoop: false, // start again as soon as the animation is finished
        colors: const [
          Colors.green,
          Colors.blue,
          Colors.pink,
          Colors.orange,
          Colors.purple
        ], // manually specify the colors to be used
      ),
    );
  }
}
