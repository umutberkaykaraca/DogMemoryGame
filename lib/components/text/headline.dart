import 'package:flutter/material.dart';
import 'package:memory_game/core/constants/text_styles/text_styles_constants.dart';

class Headline extends StatelessWidget {
  final String text;

  const Headline({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyleConstants.instance.headline,
    );
  }
}
