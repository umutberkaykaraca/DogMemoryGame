import 'package:flutter/material.dart';
import 'package:memory_game/components/buttons/game_difficulty_button.dart';
import 'package:memory_game/core/base/state/base_state.dart';
import 'package:memory_game/core/constants/color/color_constants.dart';

class GameDifficultyCard extends StatefulWidget {
  final VoidCallback onPressedEasy;
  final VoidCallback onPressedHard;

  const GameDifficultyCard({Key? key, required this.onPressedEasy, required this.onPressedHard}) : super(key: key);

  @override
  State<GameDifficultyCard> createState() => _GameDifficultyCardState();
}

class _GameDifficultyCardState extends BaseState<GameDifficultyCard> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GameDifficultyButton(
              text: 'Kolay',
              onPressed: widget.onPressedEasy,
            ),
            Divider(
              color: ColorConstants.instance.grey,
            ),
            GameDifficultyButton(
              text: 'Zor',
              onPressed: widget.onPressedHard,
            ),
          ],
        ),
      ),
    );
  }
}
