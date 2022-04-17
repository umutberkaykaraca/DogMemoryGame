import 'package:flutter/material.dart';

import '../../constants/text_styles/text_styles_constants.dart';

class AppTextTheme {
  //Gerekmediği sürece sınıfın oluşturulamamasını sağlıyoruz
  static AppTextTheme? _instance;
  static AppTextTheme get instance {
    _instance ??= AppTextTheme._init();

    return _instance!;
  }

  AppTextTheme._init();

  TextTheme appTextTheme = TextTheme(
    headline1: TextStyleConstants.instance.headline,
    headline2: TextStyleConstants.instance.headline2,
    labelMedium: TextStyleConstants.instance.normal,
    caption: TextStyleConstants.instance.subText,
  );
}
