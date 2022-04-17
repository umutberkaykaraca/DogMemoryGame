import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memory_game/core/base/state/base_state.dart';
import 'package:memory_game/core/constants/color/color_constants.dart';

class GameDifficultyButton extends StatefulWidget {
  final String text;

  final VoidCallback onPressed;

  const GameDifficultyButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  State<GameDifficultyButton> createState() => _GameDifficultyButtonState();
}

class _GameDifficultyButtonState extends BaseState<GameDifficultyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: dynamicWidth(300),
        height: dynamicHeight(40),
        alignment: Alignment.center,
        color: Colors.transparent,
        child: Text(
          widget.text,
          style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.normal, color: ColorConstants.instance.primary),
        ),
      ),
      onTap: widget.onPressed,
    );
  }
}
