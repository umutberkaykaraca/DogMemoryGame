import 'package:flutter/material.dart';
import 'package:memory_game/core/base/state/base_state.dart';
import 'package:memory_game/core/constants/text_styles/text_styles_constants.dart';

class GameTopbarCard extends StatefulWidget {
  final String gameDiff;
  final String time;
  final String numberOfMoves;

  const GameTopbarCard({Key? key, required this.gameDiff, required this.time, required this.numberOfMoves})
      : super(key: key);

  @override
  State<GameTopbarCard> createState() => _GameTopbarCardState();
}

class _GameTopbarCardState extends BaseState<GameTopbarCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: dynamicWidth(375),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.gameDiff,
              style: TextStyleConstants.instance.subText,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Row(
              children: <Widget>[
                Text(
                  'Hamle Sayisi: ',
                  style: TextStyleConstants.instance.subText,
                ),
                Text(
                  widget.numberOfMoves,
                  style: TextStyleConstants.instance.subText,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              widget.time,
              style: TextStyleConstants.instance.subText,
            ),
          )
        ],
      ),
    );
  }
}
