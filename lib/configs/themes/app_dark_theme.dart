import 'dart:ui';
import 'package:app_study/configs/themes/sub_theme_data_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const Color primaryDarkColorDark = Color(0xFF2E3C62);
const Color primaryColorDark = Color(0xFF99ACE1);
const Color mainTextColorDark = Colors.white;


class DarkTheme with SubThemeData{
  ThemeData buildDarkTheme (){
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      iconTheme: getIconTheme(),
      textTheme: getTextThemes().apply(
        bodyColor: mainTextColorDark ,
        displayColor: mainTextColorDark
      )
    );
  }

}



