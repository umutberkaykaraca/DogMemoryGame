import 'package:flutter/material.dart';
import 'package:memory_game/components/text/splash_screen_headline.dart';

import '../../../core/base/state/base_state.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends BaseState<SplashScreenView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushNamed(context, 'main_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/dog-food.png',
                width: 200,
                height: 200,
              ),
              Padding(
                padding: EdgeInsets.only(top: dynamicHeight(50)),
                child: const SplasScreenHeadline(text: 'DOG MEMORY'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
