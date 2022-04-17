import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/components/buttons/game_end_button.dart';
import 'package:memory_game/components/card/game_successful_card.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/view_model/base_view_model.dart';
import '../../../core/init/network/create_database.dart';
import '../../../core/init/network/game_data_table_model.dart';

part 'hard_game_view_model.g.dart';

class HardGameViewModel = _HardGameViewModelBase with _$HardGameViewModel;

abstract class _HardGameViewModelBase with Store, BaseViewModel {
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
    'assets/images/hard/chihuahua.png',
    'assets/images/hard/chow-chow.png',
    'assets/images/hard/cocker-spaniel.png',
    'assets/images/hard/collie.png',
    'assets/images/hard/dalmatian.png',
    'assets/images/hard/doberman.png',
    'assets/images/hard/great-dane.png',
    'assets/images/hard/greyhound.png',
    'assets/images/hard/japanese-chin.png',
    'assets/images/hard/papillon.png',
    'assets/images/hard/pharaoh-hound.png',
    'assets/images/hard/pitbull.png',
    'assets/images/hard/pomeranian.png',
    'assets/images/hard/pug.png',
    'assets/images/hard/rottweiler.png',
    'assets/images/hard/schnauzer.png',
    'assets/images/hard/shar-pei.png',
    'assets/images/hard/tibetan-mastiff.png',
    'assets/images/hard/chihuahua.png',
    'assets/images/hard/chow-chow.png',
    'assets/images/hard/cocker-spaniel.png',
    'assets/images/hard/collie.png',
    'assets/images/hard/dalmatian.png',
    'assets/images/hard/doberman.png',
    'assets/images/hard/great-dane.png',
    'assets/images/hard/greyhound.png',
    'assets/images/hard/japanese-chin.png',
    'assets/images/hard/papillon.png',
    'assets/images/hard/pharaoh-hound.png',
    'assets/images/hard/pitbull.png',
    'assets/images/hard/pomeranian.png',
    'assets/images/hard/pug.png',
    'assets/images/hard/rottweiler.png',
    'assets/images/hard/schnauzer.png',
    'assets/images/hard/shar-pei.png',
    'assets/images/hard/tibetan-mastiff.png',
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
    for (var i = 0; i < 36; i++) {
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

          if (numberOfMatches == 18) {
            showDialog(
              context: context!,
              builder: (BuildContext ctxt) {
                return GameSuccessfulCard(
                    numberOfMove: numberOfMove.toString(), time: time, score: score.toString(), onTap: backOnPressed);
              },
            );
          }
        }
      }
    }
  }

  @action
  Future<int> addGameData() async {
    GameData gameData = GameData(score: score, move: numberOfMove, time: time, mode: 'Zor');

    return await DatabaseHandler().insertGameData(gameData);
  }

  @computed
  String get time => '$minute:$second';
}
