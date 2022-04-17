import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/core/init/network/game_data_table_model.dart';
import 'package:mobx/mobx.dart';

import '../../../components/card/game_successful_card.dart';
import '../../../core/base/view_model/base_view_model.dart';
import '../../../core/init/network/create_database.dart';

part 'easy_game_view_model.g.dart';

class EasyGameViewModel = _EasyGameViewModelBase with _$EasyGameViewModel;

abstract class _EasyGameViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}

  @observable
  Timer? timer;
  @observable
  int minute = 0;
  @observable
  int second = 0;
  @observable
  List<String> kopke = [
    'assets/images/easy/alaskan-malamute.png',
    'assets/images/easy/basset-hound.png',
    'assets/images/easy/beagle.png',
    'assets/images/easy/bergamasco.png',
    'assets/images/easy/bichon-frise.png',
    'assets/images/easy/boxer.png',
    'assets/images/easy/briard.png',
    'assets/images/easy/bull-terrier.png',
    'assets/images/easy/alaskan-malamute.png',
    'assets/images/easy/basset-hound.png',
    'assets/images/easy/beagle.png',
    'assets/images/easy/bergamasco.png',
    'assets/images/easy/bichon-frise.png',
    'assets/images/easy/boxer.png',
    'assets/images/easy/briard.png',
    'assets/images/easy/bull-terrier.png'
  ];
  @observable
  List<GlobalKey<FlipCardState>> cardStateKeys = [];
  @observable
  String kopke1 = '';
  @observable
  String kopke2 = '';
  @observable
  int kopke1index = -1;
  @observable
  int kopke2index = -1;
  @observable
  int numberOfMove = 0;
  @observable
  int numberOfMatches = 0;
  @observable
  int score = 0;

  @action
  void backOnPressed() {
    Navigator.pushNamed(context!, 'main_screen');
  }

  @action
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (second < 59) {
          second++;
        } else {
          second = 0;
          minute++;
        }
      },
    );
  }

  @action
  void queue() {
    kopke.shuffle();
  }

  @action
  void cardKeys() {
    for (var i = 0; i < 16; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  }

  @action
  void onTap(index) {
    if (cardStateKeys[index].currentState?.isFront == true) {
      cardStateKeys[index].currentState?.toggleCard();
      numberOfMove++;
    }
  }

  @action
  void onFlip(String kopke, int index) {
    if (cardStateKeys[index].currentState?.isFront == true) {
      if (kopke1 == '' && kopke1index == -1) {
        kopke1 = kopke;
        kopke1index = index;
      } else if (kopke2 == '' && kopke2index == -1) {
        kopke2 = kopke;
        kopke2index = index;

        if (kopke1 != kopke2) {
          Future.delayed(const Duration(milliseconds: 1500), () {
            cardStateKeys[kopke1index].currentState?.toggleCard();
            cardStateKeys[kopke2index].currentState?.toggleCard();

            if (score > 1) {
              score -= 2;
            }

            kopke1 = '';
            kopke1index = -1;
            kopke2 = '';
            kopke2index = -1;
          });
        } else {
          kopke1 = '';
          kopke1index = -1;
          kopke2 = '';
          kopke2index = -1;
          numberOfMatches++;
          score += 10;

          if (numberOfMatches == 8) {
            showDialog(
              context: context!,
              builder: (BuildContext ctxt) {
                return GameSuccessfulCard(
                  numberOfMove: numberOfMove.toString(),
                  time: time,
                  score: score.toString(),
                  onTap: backOnPressed,
                );
              },
            );

            addGameData();
          }
        }
      }
    }
  }

  @action
  Future<int> addGameData() async {
    GameData gameData = GameData(score: score, move: numberOfMove, time: time, mode: 'Kolay');

    return await DatabaseHandler().insertGameData(gameData);
  }

  @computed
  String get time => '$minute:$second';
}
