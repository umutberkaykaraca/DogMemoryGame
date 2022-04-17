import 'package:flutter/material.dart';
import 'package:memory_game/core/base/state/base_state.dart';
import 'package:memory_game/core/constants/color/color_constants.dart';
import 'package:memory_game/core/constants/text_styles/text_styles_constants.dart';

class TopbarCard extends StatefulWidget {
  final VoidCallback backOnPressed;

  const TopbarCard({Key? key, required this.backOnPressed}) : super(key: key);

  @override
  State<TopbarCard> createState() => _TopbarCardState();
}

class _TopbarCardState extends BaseState<TopbarCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: dynamicWidth(375),
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: Container(
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9999),
                  color: ColorConstants.instance.background,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: ColorConstants.instance.black,
                ),
              ),
              onTap: widget.backOnPressed,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Dog Memory',
                style: TextStyleConstants.instance.headline2,
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Visibility(
              child: Text(''),
              visible: false,
            ),
          )
        ],
      ),
    );
  }
}
