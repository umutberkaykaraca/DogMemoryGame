// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hard_game_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HardGameViewModel on _HardGameViewModelBase, Store {
  Computed<String>? _$timeComputed;

  @override
  String get time => (_$timeComputed ??= Computed<String>(() => super.time,
          name: '_HardGameViewModelBase.time'))
      .value;

  final _$timerAtom = Atom(name: '_HardGameViewModelBase.timer');

  @override
  Timer? get timer {
    _$timerAtom.reportRead();
    return super.timer;
  }

  @override
  set timer(Timer? value) {
    _$timerAtom.reportWrite(value, super.timer, () {
      super.timer = value;
    });
  }

  final _$minuteAtom = Atom(name: '_HardGameViewModelBase.minute');

  @override
  int get minute {
    _$minuteAtom.reportRead();
    return super.minute;
  }

  @override
  set minute(int value) {
    _$minuteAtom.reportWrite(value, super.minute, () {
      super.minute = value;
    });
  }

  final _$secondAtom = Atom(name: '_HardGameViewModelBase.second');

  @override
  int get second {
    _$secondAtom.reportRead();
    return super.second;
  }

  @override
  set second(int value) {
    _$secondAtom.reportWrite(value, super.second, () {
      super.second = value;
    });
  }

  final _$kopkeAtom = Atom(name: '_HardGameViewModelBase.kopke');

  @override
  List<String> get kopke {
    _$kopkeAtom.reportRead();
    return super.kopke;
  }

  @override
  set kopke(List<String> value) {
    _$kopkeAtom.reportWrite(value, super.kopke, () {
      super.kopke = value;
    });
  }

  final _$cardStateKeysAtom =
      Atom(name: '_HardGameViewModelBase.cardStateKeys');

  @override
  List<GlobalKey<FlipCardState>> get cardStateKeys {
    _$cardStateKeysAtom.reportRead();
    return super.cardStateKeys;
  }

  @override
  set cardStateKeys(List<GlobalKey<FlipCardState>> value) {
    _$cardStateKeysAtom.reportWrite(value, super.cardStateKeys, () {
      super.cardStateKeys = value;
    });
  }

  final _$kopke1Atom = Atom(name: '_HardGameViewModelBase.kopke1');

  @override
  String get kopke1 {
    _$kopke1Atom.reportRead();
    return super.kopke1;
  }

  @override
  set kopke1(String value) {
    _$kopke1Atom.reportWrite(value, super.kopke1, () {
      super.kopke1 = value;
    });
  }

  final _$kopke2Atom = Atom(name: '_HardGameViewModelBase.kopke2');

  @override
  String get kopke2 {
    _$kopke2Atom.reportRead();
    return super.kopke2;
  }

  @override
  set kopke2(String value) {
    _$kopke2Atom.reportWrite(value, super.kopke2, () {
      super.kopke2 = value;
    });
  }

  final _$kopke1indexAtom = Atom(name: '_HardGameViewModelBase.kopke1index');

  @override
  int get kopke1index {
    _$kopke1indexAtom.reportRead();
    return super.kopke1index;
  }

  @override
  set kopke1index(int value) {
    _$kopke1indexAtom.reportWrite(value, super.kopke1index, () {
      super.kopke1index = value;
    });
  }

  final _$kopke2indexAtom = Atom(name: '_HardGameViewModelBase.kopke2index');

  @override
  int get kopke2index {
    _$kopke2indexAtom.reportRead();
    return super.kopke2index;
  }

  @override
  set kopke2index(int value) {
    _$kopke2indexAtom.reportWrite(value, super.kopke2index, () {
      super.kopke2index = value;
    });
  }

  final _$numberOfMoveAtom = Atom(name: '_HardGameViewModelBase.numberOfMove');

  @override
  int get numberOfMove {
    _$numberOfMoveAtom.reportRead();
    return super.numberOfMove;
  }

  @override
  set numberOfMove(int value) {
    _$numberOfMoveAtom.reportWrite(value, super.numberOfMove, () {
      super.numberOfMove = value;
    });
  }

  final _$numberOfMatchesAtom =
      Atom(name: '_HardGameViewModelBase.numberOfMatches');

  @override
  int get numberOfMatches {
    _$numberOfMatchesAtom.reportRead();
    return super.numberOfMatches;
  }

  @override
  set numberOfMatches(int value) {
    _$numberOfMatchesAtom.reportWrite(value, super.numberOfMatches, () {
      super.numberOfMatches = value;
    });
  }

  final _$scoreAtom = Atom(name: '_HardGameViewModelBase.score');

  @override
  int get score {
    _$scoreAtom.reportRead();
    return super.score;
  }

  @override
  set score(int value) {
    _$scoreAtom.reportWrite(value, super.score, () {
      super.score = value;
    });
  }

  final _$addGameDataAsyncAction =
      AsyncAction('_HardGameViewModelBase.addGameData');

  @override
  Future<int> addGameData() {
    return _$addGameDataAsyncAction.run(() => super.addGameData());
  }

  final _$_HardGameViewModelBaseActionController =
      ActionController(name: '_HardGameViewModelBase');

  @override
  void backOnPressed() {
    final _$actionInfo = _$_HardGameViewModelBaseActionController.startAction(
        name: '_HardGameViewModelBase.backOnPressed');
    try {
      return super.backOnPressed();
    } finally {
      _$_HardGameViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startTimer() {
    final _$actionInfo = _$_HardGameViewModelBaseActionController.startAction(
        name: '_HardGameViewModelBase.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$_HardGameViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void queue() {
    final _$actionInfo = _$_HardGameViewModelBaseActionController.startAction(
        name: '_HardGameViewModelBase.queue');
    try {
      return super.queue();
    } finally {
      _$_HardGameViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cardKeys() {
    final _$actionInfo = _$_HardGameViewModelBaseActionController.startAction(
        name: '_HardGameViewModelBase.cardKeys');
    try {
      return super.cardKeys();
    } finally {
      _$_HardGameViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTap(dynamic index) {
    final _$actionInfo = _$_HardGameViewModelBaseActionController.startAction(
        name: '_HardGameViewModelBase.onTap');
    try {
      return super.onTap(index);
    } finally {
      _$_HardGameViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onFlip(String kopke, int index) {
    final _$actionInfo = _$_HardGameViewModelBaseActionController.startAction(
        name: '_HardGameViewModelBase.onFlip');
    try {
      return super.onFlip(kopke, index);
    } finally {
      _$_HardGameViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
timer: ${timer},
minute: ${minute},
second: ${second},
kopke: ${kopke},
cardStateKeys: ${cardStateKeys},
kopke1: ${kopke1},
kopke2: ${kopke2},
kopke1index: ${kopke1index},
kopke2index: ${kopke2index},
numberOfMove: ${numberOfMove},
numberOfMatches: ${numberOfMatches},
score: ${score},
time: ${time}
    ''';
  }
}
