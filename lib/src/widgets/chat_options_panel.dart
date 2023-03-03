import 'package:easy_chat_game/src/easy_chat_game_controller.dart';
import 'package:easy_chat_game/src/models/chat_level.dart';
import 'package:easy_chat_game/src/models/enums.dart';
import 'package:easy_chat_game/src/widgets/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ChatOptionsPanel extends StatelessWidget {
  const ChatOptionsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Container(
      color: Theme.of(context).secondaryHeaderColor,
      constraints: const BoxConstraints(
          minHeight: 120, maxHeight: 400, minWidth: double.infinity),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 8),
        child: _buildOptions(context, isDarkMode),
      ),
    );
  }

  Widget _buildOptions(BuildContext context, bool isDarkMode) {
    return Consumer<ChatProvider>(
      builder: (BuildContext context, model, Widget? child) {
        final options = model.getNextOptions() ?? [];
        if (options.isEmpty) return const SizedBox();

        final List<Widget> optionButtonList = [];
        for (int i = 0; i < options.length; i++) {
          final option = _buildOptionButton(context, options[i], isDarkMode);
          optionButtonList.add(option);
          optionButtonList.add(const SizedBox(height: 8));
        }

        return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: optionButtonList);
      },
    );
  }

  ElevatedButton _buildOptionButton(
      BuildContext context, String text, bool isDarkMode) {
    Color color;
    if (ChatLevel.isLie(text)) {
      color = Colors.red;
    } else if (ChatLevel.isTruth(text)) {
      color = Colors.green;
    } else {
      color = Theme.of(context).colorScheme.secondary;
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.all(4),
      ),
      onPressed: () => _onClickOption(context, text),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.black : Colors.white),
      ),
    );
  }

  void _onClickOption(BuildContext context, String text) {
    final controller = EasyChatGameController.of(context);
    if (controller.onTapEvent != null) {
      controller.onTapEvent!.call(context, ChatGameEventAction.optionTap);
    }
    HapticFeedback.mediumImpact();
    context.read<ChatProvider>().onOptionSelected(context, text);
  }
}
