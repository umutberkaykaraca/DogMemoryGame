import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:memory_game/components/card/game_card.dart';
import 'package:memory_game/components/card/game_topbar_card.dart';
import 'package:memory_game/components/card/information_card.dart';
import 'package:memory_game/components/card/topbar_card.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/init/network/create_database.dart';
import '../../../core/init/network/game_data_table_model.dart';
import '../view_model/easy_game_view_model.dart';

class EasyGameView extends StatefulWidget {
  const EasyGameView({Key? key}) : super(key: key);

  @override
  _EasyGameViewState createState() => _EasyGameViewState();
}

class _EasyGameViewState extends BaseState<EasyGameView> {
  EasyGameViewModel? viewmodel;

  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<EasyGameViewModel>(
      viewModel: EasyGameViewModel(),
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
      onPageBuilder: (BuildContext context, EasyGameViewModel viewmodel) {
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
                        gameDiff: 'Kolay',
                        time: viewmodel.time,
                        numberOfMoves: viewmodel.numberOfMove.toString(),
                      );
                    }),
                  ),
                  Observer(builder: (_) {
                    return GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
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
                        eslesme: '${viewmodel.numberOfMatches}/8',
                        puan: viewmodel.score.toString(),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
