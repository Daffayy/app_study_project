import 'dart:ui';
import 'package:app_study/configs/themes/sub_theme_data_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const Color primaryLightColorLight = Color(0xFF3AC3CB);
const Color primaryColorLight = Color(0xFFF85187);

class LightTheme with SubThemeData {
  buildLightTheme(){
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme;
  }
}