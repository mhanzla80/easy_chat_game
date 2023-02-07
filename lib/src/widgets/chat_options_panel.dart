import 'package:easy_chat_game/src/models/chat_level.dart';
import 'package:easy_chat_game/src/utilities/size_config.dart';
import 'package:easy_chat_game/src/widgets/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatOptionsPanel extends StatelessWidget {
  const ChatOptionsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomSafeArea = SizeConfig.safeAreaPaddingBottom / 2;

    return Container(
      color: Theme.of(context).secondaryHeaderColor,
      constraints: const BoxConstraints(
          minHeight: 200, maxHeight: 400, minWidth: double.infinity),
      child: Padding(
        padding: EdgeInsets.only(
            left: 16, right: 16, top: 10, bottom: 50 + 4 + bottomSafeArea),
        child: _buildOptions(context),
      ),
    );
  }

  Widget _buildOptions(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (BuildContext context, model, Widget? child) {
        final options = model.getNextOptions() ?? [];
        if (options.isEmpty) return const SizedBox();

        final List<ElevatedButton> optionButtonList = [];
        for (int i = 0; i < options.length; i++) {
          final option = _buildOptionButton(context, options[i]);
          optionButtonList.add(option);
        }

        return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: optionButtonList);
      },
    );
  }

  ElevatedButton _buildOptionButton(BuildContext context, String text) {
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
        padding: const EdgeInsets.all(8),
      ),
      onPressed: () => _onClickOption(context, text),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  void _onClickOption(BuildContext context, String text) =>
      context.read<ChatProvider>().onOptionSelected(context, text);
}
