import 'package:flutter/material.dart';

class AppAsset {

  static final AppAsset _instance = AppAsset._internal();

  AppAsset._internal();

  factory AppAsset() {
    return _instance;
  }

 static String ImgDashMan = 'assets/images/img_man.png';
 static String ImgFlutter = 'assets/images/img_flutter.png';

}

