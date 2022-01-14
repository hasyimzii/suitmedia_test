import 'package:flutter/material.dart';

Color whiteColor = const Color(0xFFFFFFFF);
Color blackColor = const Color(0xFF04021D);
Color blueColor = const Color(0xFF554AF0);
Color greenColor = const Color(0xFF2B637B);

FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;

TextStyle titleText(double font) => TextStyle(
  color: blackColor,
  fontWeight: semibold,
  fontSize: font,
);

TextStyle titleListText(double font) => TextStyle(
  color: blackColor,
  fontWeight: medium,
  fontSize: font,
);

TextStyle subtitleListText(double font) => TextStyle(
  color: blackColor.withOpacity(0.6),
  fontWeight: medium,
  fontSize: font,
);

TextStyle labelText = TextStyle(
  color: blackColor.withOpacity(0.36),
  fontWeight: medium,
  fontSize: 16,
);

TextStyle buttonText = TextStyle(
  color: whiteColor,
  fontWeight: medium,
  fontSize: 14,
);