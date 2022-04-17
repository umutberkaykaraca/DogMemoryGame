import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/core/constants/color/color_constants.dart';

class GameCard extends StatefulWidget {
  final String dog;
  final Function() onFlip;
  final GlobalKey<FlipCardState> cardKey;
  final VoidCallback onTapCard;

  const GameCard({Key? key, required this.dog, required this.onFlip, required this.cardKey, required this.onTapCard})
      : super(key: key);

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FlipCard(
        key: widget.cardKey,
        onFlip: widget.onFlip,
        fill: Fill.fillBack,
        flipOnTouch: false,
        direction: FlipDirection.HORIZONTAL,
        front: Container(
          alignment: Alignment.center,
          width: 125,
          height: 125,
          decoration: BoxDecoration(
            color: ColorConstants.instance.background,
            border: Border.all(color: ColorConstants.instance.black),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(
            'assets/images/dog-food.png',
            scale: 10,
          ),
        ),
        back: Container(
          alignment: Alignment.center,
          width: 125,
          height: 125,
          decoration: BoxDecoration(
            color: ColorConstants.instance.background,
            border: Border.all(color: ColorConstants.instance.black),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Image.asset(
            widget.dog,
            scale: 10,
          ),
        ),
      ),
      onTap: widget.onTapCard,
    );
  }
}
