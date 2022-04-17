import 'package:flutter/material.dart';
import 'package:memory_game/core/init/theme/text_theme.dart';

import '../../constants/color/color_constants.dart';
import 'color_scheme_them.dart';

class AppTheme {
  //Gerekmediği sürece sınıfın oluşturulamamasını sağlıyoruz
  static AppTheme? _instance;
  static AppTheme get instance {
    _instance ??= AppTheme._init();

    return _instance!;
  }

  AppTheme._init();

  ThemeData get theme => ThemeData.light().copyWith(
        colorScheme: ColorSchemeTheme.instance.colorScheme,
        textTheme: AppTextTheme.instance.appTextTheme,
        scaffoldBackgroundColor: ColorConstants.instance.background,
      );
}
