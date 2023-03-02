import 'package:flutter/material.dart';

class ChatAvatar extends StatelessWidget {
  final String imgSrc;
  const ChatAvatar(
    this.imgSrc, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        image:
            DecorationImage(fit: BoxFit.cover, image: ExactAssetImage(imgSrc)),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
    );
  }
}
