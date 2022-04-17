import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memory_game/core/base/state/base_state.dart';

import '../../core/constants/color/color_constants.dart';

class GameEndButton extends StatefulWidget {
  final VoidCallback onTap;

  const GameEndButton({Key? key, required this.onTap}) : super(key: key);

  @override
  State<GameEndButton> createState() => _GameEndButtonState();
}

class _GameEndButtonState extends BaseState<GameEndButton> {
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
          'Ana Sayfaya Don',
          style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.normal, color: ColorConstants.instance.primary),
        ),
      ),
      onTap: widget.onTap,
    );
  }
}
