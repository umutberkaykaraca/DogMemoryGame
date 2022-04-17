import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../components/card/game_card.dart';
import '../../../components/card/game_topbar_card.dart';
import '../../../components/card/information_card.dart';
import '../../../components/card/topbar_card.dart';
import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/init/network/create_database.dart';
import '../view_model/hard_game_view_model.dart';

class HardGameView extends StatefulWidget {
  const HardGameView({Key? key}) : super(key: key);

  @override
  _HardGameViewState createState() => _HardGameViewState();
}

class _HardGameViewState extends BaseState<HardGameView> {
  HardGameViewModel? viewmodel;

  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HardGameViewModel>(
      viewModel: HardGameViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewmodel = model;

        viewmodel?.cardKeys();
        viewmodel?.startTimer();
        viewmodel?.queue();
      },
      onDispose: () {
        viewmodel?.timer?.cancel();
      },
      onPageBuilder: (BuildContext context, HardGameViewModel viewmodel) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: dynamicHeight(20), horizontal: dynamicWidth(20)),
              child: Column(
                children: <Widget>[
                  TopbarCard(backOnPressed: () => viewmodel.backOnPressed()),
                  Padding(
                    padding: EdgeInsets.only(top: dynamicHeight(75), bottom: dynamicWidth(10)),
                    child: Observer(builder: (_) {
                      return GameTopbarCard(
                        gameDiff: 'Zor',
                        time: viewmodel.time,
                        numberOfMoves: viewmodel.numberOfMove.toString(),
                      );
                    }),
                  ),
                  Observer(builder: (_) {
                    return GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 6,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      children: List.generate(
                        viewmodel.kopke.length,
                        (index) {
                          return GameCard(
                            onTapCard: () => viewmodel.onTap(index),
                            cardKey: viewmodel.cardStateKeys[index],
                            dog: viewmodel.kopke[index],
                            onFlip: () {
                              viewmodel.onFlip(viewmodel.kopke[index], index);
                            },
                          );
                        },
                      ),
                    );
                  }),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: dynamicHeight(65)),
                    child: Observer(builder: (_) {
                      return InformationCard(
                        eslesme: '${viewmodel.numberOfMatches}/18',
                        puan: viewmodel.score.toString(),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
