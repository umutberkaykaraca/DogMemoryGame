import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color/color_constants.dart';

class TextStyleConstants {
  //Gerekmediği sürece sınıfın oluşturulamamasını sağlıyoruz
  static TextStyleConstants? _instance;
  static TextStyleConstants get instance {
    _instance ??= TextStyleConstants._init();

    return _instance!;
  }

  TextStyleConstants._init();

  TextStyle headline =
      GoogleFonts.inter(fontSize: 40, fontWeight: FontWeight.bold, color: ColorConstants.instance.black);
  TextStyle headline2 =
      GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold, color: ColorConstants.instance.black);
  TextStyle normal =
      GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.normal, color: ColorConstants.instance.grey);
  TextStyle subText =
      GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.normal, color: ColorConstants.instance.lightGrey);
}
