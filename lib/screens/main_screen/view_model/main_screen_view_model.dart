import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/view_model/base_view_model.dart';

part 'main_screen_view_model.g.dart';

class MainScreenViewModel = _MainScreenViewModelBase with _$MainScreenViewModel;

abstract class _MainScreenViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}

  @action
  void onPressedEasy() {
    Navigator.pushNamed(context!, 'easy_game_screen');
  }

  @action
  void onPressedHard() {
    Navigator.pushNamed(context!, 'hard_game_screen');
  }
}
