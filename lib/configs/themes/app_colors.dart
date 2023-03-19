import 'package:app_study/configs/themes/app_dark_theme.dart';
import 'package:app_study/configs/themes/app_light_theme.dart';
import 'package:app_study/configs/themes/ui_parameters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color onSurfaceTextColor = Colors.white;
const Color correctAnswerColor = Color(0xFF3AC3CB);
const Color wrongAnswerColor = Color(0xFFF85187);
const Color notAnsweredColor = Color(0xFF2A3C65);

const mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryLightColorLight,
      primaryColorLight,
    ]);
const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryDarkColorDark,
      primaryColorDark,
    ]);
LinearGradient mainGradient() =>
    UIParameters.isDarkMode() ? mainGradientDark : mainGradientLight;

Color customScaffoldColor(BuildContext context) =>
    UIParameters.isDarkMode()?const Color(0xFF2E3C62)
        : const Color.fromARGB(255, 240, 237, 255);

Color answerSelectedColor() => UIParameters.isDarkMode() ? Theme.of(Get
    .context!).cardColor.withOpacity(0.5): Theme.of(Get.context!).primaryColor;

Color answerBorderColor () => UIParameters.isDarkMode()
    ? const Color.fromARGB(255, 20, 46, 158)
    : const Color.fromARGB(255, 221, 221, 221);
