import 'package:flutter/material.dart';

class MaybeCloseButton extends StatelessWidget {
  final BuildContext context;
  const MaybeCloseButton(this.context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parentRoute = ModalRoute.of(this.context);
    final canPop = parentRoute?.canPop ?? false;
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;
    return canPop
        ? useCloseButton
            ? CloseButton(onPressed: onDismiss)
            : BackButton(onPressed: onDismiss)
        : const SizedBox();
  }

  void onDismiss() => Navigator.of(context).pop();
}
