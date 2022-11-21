import 'package:flutter/material.dart';
import 'package:imdb/presentation/resources/color_manager.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
  double height,
  bool hasShadow,
) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    height: height,
    shadows: hasShadow
        ? const [
            Shadow(
              color: Colors.black,
              offset: Offset(-1, -1),
              blurRadius: 0,
            ),
            Shadow(
              color: Colors.black,
              offset: Offset(-1, 0),
              blurRadius: 0,
            ),
            Shadow(
              color: Colors.black,
              offset: Offset(0, 1),
              blurRadius: 0,
            ),
            Shadow(
              color: Colors.black,
              offset: Offset(1, 1),
              blurRadius: 0,
            ),
            Shadow(
              color: Colors.black,
              offset: Offset(2, 1),
              blurRadius: 0,
            ),
          ]
        : null,
    fontFamily: FontConstants.fontFamily,
  );
}

// light

TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double height = 1.2, bool hasShadow = false,
})  {
  return _getTextStyle(fontSize, FontWeightManager.light, color, height, hasShadow);
}

// regular

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double height = 1.2, bool hasShadow = false,}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color, height, hasShadow);
}

// medium

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double height = 1.2, bool hasShadow = false,}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color, height, hasShadow);
}

// semi-bold

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double height = 1.2, bool hasShadow = false,}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color, height, hasShadow);
}

// bold

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double height = 1.2, bool hasShadow = false,}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color, height, hasShadow);
}
