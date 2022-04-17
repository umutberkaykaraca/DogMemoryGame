import 'package:flutter/material.dart';
import 'package:memory_game/core/base/state/base_state.dart';
import 'package:memory_game/core/constants/color/color_constants.dart';
import 'package:memory_game/core/constants/text_styles/text_styles_constants.dart';

class InformationCard extends StatefulWidget {
  final String eslesme;
  final String puan;

  const InformationCard({Key? key, required this.eslesme, required this.puan}) : super(key: key);

  @override
  State<InformationCard> createState() => _InformationCardState();
}

class _InformationCardState extends BaseState<InformationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: dynamicWidth(375),
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Eslesme Sayisi',
                    style: TextStyleConstants.instance.headline2,
                  ),
                  Text(
                    widget.eslesme,
                    style: TextStyleConstants.instance.normal,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: VerticalDivider(
              color: ColorConstants.instance.black,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Toplam Puan',
                    style: TextStyleConstants.instance.headline2,
                  ),
                  Text(
                    widget.puan,
                    style: TextStyleConstants.instance.normal,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
