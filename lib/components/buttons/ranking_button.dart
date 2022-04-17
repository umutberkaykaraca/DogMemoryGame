import 'package:flutter/material.dart';
import 'package:memory_game/core/base/state/base_state.dart';
import 'package:memory_game/core/constants/color/color_constants.dart';

class RankingButton extends StatefulWidget {
  final VoidCallback onPressed;

  const RankingButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<RankingButton> createState() => _RankingButtonState();
}

class _RankingButtonState extends BaseState<RankingButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.emoji_events_outlined,
        color: ColorConstants.instance.primary,
        size: 30,
      ),
      onTap: widget.onPressed,
    );
  }
}
