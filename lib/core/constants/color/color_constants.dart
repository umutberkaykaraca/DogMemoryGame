import 'package:flutter/material.dart';

class ColorConstants {
  //Gerekmediği sürece sınıfın oluşturulamamasını sağlıyoruz
  static ColorConstants? _instance;
  static ColorConstants get instance {
    _instance ??= ColorConstants._init();

    return _instance!;
  }

  ColorConstants._init();

  Color background = const Color(0xFFFFFFFF);
  Color primary = const Color(0xFF076BCC);
  Color black = const Color(0xFF344861);
  Color white = const Color(0xFFFFFFFF);
  Color error = const Color(0xFFF01F0E);
  Color success = const Color(0xFF2AA952);
  Color grey = const Color(0xFF6E7C8C);
  Color lightGrey = const Color(0xFF94A3B7);
}
