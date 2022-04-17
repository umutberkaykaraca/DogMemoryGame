import 'package:flutter/material.dart';
import 'package:memory_game/components/buttons/game_end_button.dart';
import 'package:memory_game/components/text/headline.dart';
import 'package:memory_game/core/base/state/base_state.dart';
import 'package:memory_game/core/constants/text_styles/text_styles_constants.dart';

class GameSuccessfulCard extends StatefulWidget {
  final String numberOfMove;
  final String time;
  final String score;
  final VoidCallback onTap;

  const GameSuccessfulCard(
      {Key? key, required this.numberOfMove, required this.time, required this.score, required this.onTap})
      : super(key: key);

  @override
  State<GameSuccessfulCard> createState() => _GameSuccessfulCardState();
}

class _GameSuccessfulCardState extends BaseState<GameSuccessfulCard> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Headline(text: 'Tebrikler!!'),
            Container(
              padding: EdgeInsets.symmetric(vertical: dynamicHeight(75)),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Hamle Sayisi',
                        style: TextStyleConstants.instance.headline2,
                      ),
                      Text(
                        widget.numberOfMove,
                        style: TextStyleConstants.instance.normal,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: dynamicHeight(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sure',
                          style: TextStyleConstants.instance.headline2,
                        ),
                        Text(
                          widget.time,
                          style: TextStyleConstants.instance.normal,
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Puan',
                        style: TextStyleConstants.instance.headline2,
                      ),
                      Text(
                        widget.score,
                        style: TextStyleConstants.instance.normal,
                      )
                    ],
                  ),
                ],
              ),
            ),
            GameEndButton(onTap: widget.onTap),
          ],
        ),
      ),
    );
  }
}
