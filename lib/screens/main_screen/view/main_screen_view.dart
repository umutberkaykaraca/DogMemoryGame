import 'package:flutter/material.dart';
import 'package:memory_game/components/buttons/new_game_button.dart';
import 'package:memory_game/components/buttons/ranking_button.dart';
import 'package:memory_game/components/text/headline.dart';
import 'package:memory_game/core/constants/text_styles/text_styles_constants.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/init/network/create_database.dart';
import '../view_model/main_screen_view_model.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({Key? key}) : super(key: key);

  @override
  _MainScreenViewState createState() => _MainScreenViewState();
}

class _MainScreenViewState extends BaseState<MainScreenView> {
  MainScreenViewModel? viewmodel;

  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<MainScreenViewModel>(
      viewModel: MainScreenViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewmodel = model;
      },
      onPageBuilder: (BuildContext context, MainScreenViewModel viewmodel) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: dynamicHeight(20), horizontal: dynamicWidth(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: dynamicWidth(375),
                    alignment: Alignment.centerRight,
                    child: RankingButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext ctxt) {
                            return AlertDialog(
                              shape:
                                  const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Skor Tablosu',
                                      style: TextStyleConstants.instance.headline,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: dynamicHeight(75), bottom: dynamicHeight(25)),
                                      child: Container(
                                        width: dynamicWidth(300),
                                        alignment: Alignment.centerRight,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              'Puan',
                                              style: TextStyleConstants.instance.headline2,
                                            ),
                                            Text(
                                              'Hamle',
                                              style: TextStyleConstants.instance.headline2,
                                            ),
                                            Text(
                                              'Sure',
                                              style: TextStyleConstants.instance.headline2,
                                            ),
                                            Text(
                                              'Mod',
                                              style: TextStyleConstants.instance.headline2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    FutureBuilder(
                                      future: handler.retrieveGameDatas(),
                                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                                        if (snapshot.hasData) {
                                          return SizedBox(
                                            width: dynamicWidth(375),
                                            height: dynamicHeight(400),
                                            child: ListView.builder(
                                              itemCount: snapshot.data.length,
                                              itemBuilder: (BuildContext ctxt, int index) {
                                                return Container(
                                                  width: dynamicWidth(375),
                                                  alignment: Alignment.centerRight,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                        snapshot.data[index].score.toString(),
                                                        style: TextStyleConstants.instance.normal,
                                                      ),
                                                      Text(
                                                        snapshot.data[index].move.toString(),
                                                        style: TextStyleConstants.instance.normal,
                                                      ),
                                                      Text(
                                                        snapshot.data[index].time,
                                                        style: TextStyleConstants.instance.normal,
                                                      ),
                                                      Text(
                                                        snapshot.data[index].mode,
                                                        style: TextStyleConstants.instance.normal,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        } else {
                                          return Visibility(
                                            child: Text('data'),
                                            visible: false,
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: dynamicHeight(200)),
                    child: const Headline(text: 'Dog Memory'),
                  ),
                  NewGameButton(
                    onPressedEasy: () => viewmodel.onPressedEasy(),
                    onPressedHard: () => viewmodel.onPressedHard(),
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
