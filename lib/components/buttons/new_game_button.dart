import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memory_game/components/card/game_difficulty_card.dart';
import 'package:memory_game/core/base/state/base_state.dart';
import 'package:memory_game/core/constants/color/color_constants.dart';

class NewGameButton extends StatefulWidget {
  final VoidCallback onPressedEasy;
  final VoidCallback onPressedHard;

  const NewGameButton({Key? key, required this.onPressedEasy, required this.onPressedHard}) : super(key: key);

  @override
  State<NewGameButton> createState() => _NewGameButtonState();
}

class _NewGameButtonState extends BaseState<NewGameButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: dynamicWidth(250),
        height: dynamicHeight(45),
        decoration: BoxDecoration(
          color: ColorConstants.instance.background,
          boxShadow: [
            BoxShadow(
              color: ColorConstants.instance.primary.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          'Yeni Oyun',
          style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.normal, color: ColorConstants.instance.primary),
        ),
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext ctxt) {
              return GameDifficultyCard(
                onPressedEasy: widget.onPressedEasy,
                onPressedHard: widget.onPressedHard,
              );
            });
      },
    );
  }
}
