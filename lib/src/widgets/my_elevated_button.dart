import 'package:flutter/material.dart';

class MyRaisedButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;
  final Color color;

  const MyRaisedButton(
      {super.key,
      required this.buttonTitle,
      required this.onTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10),
        backgroundColor: color,
      ),
      onPressed: onTap,
      child: Text(
        buttonTitle,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
