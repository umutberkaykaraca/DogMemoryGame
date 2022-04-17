import 'package:flutter/material.dart';
import 'package:memory_game/core/constants/text_styles/text_styles_constants.dart';

class SplasScreenHeadline extends StatelessWidget {
  final String text;

  const SplasScreenHeadline({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyleConstants.instance.headline,
    );
  }
}
