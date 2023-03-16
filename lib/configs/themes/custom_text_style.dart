import 'dart:ui';

import 'package:app_study/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'ui_parameters.dart';

TextStyle cardTitles(context) => TextStyle(
    color: UIParameters.isDarkMode()
        ? Theme.of(context).textTheme.bodyText1!.color
        : Theme.of(context).primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.bold
);

const detailText = TextStyle(fontSize: 12);
const headerText = TextStyle(fontSize: 22, fontWeight: FontWeight.w700,
      color: onSurfaceTextColor
);
