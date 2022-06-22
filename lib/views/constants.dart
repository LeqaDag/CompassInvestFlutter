import 'package:flutter/material.dart';

const mainColor = Color(0xff17255A);

const kTextColor = Color(0xFF707070);
const kTextLightColor = Color(0xFF555555);
const blackColor = Colors.black;

// new colors
const secondColor = Color(0xff011836);
const greenColor = Color(0xff57A773);
const whiteColor = Color(0xffC9CAD9);
const goldColor = Color(0xffF3A712);
const credColor = Color(0xffA30015);

const kDefaultPadding = 20.0;

const mainFontType = 'Cairo';

final kDefaultShadow = BoxShadow(
  offset: const Offset(0, 50),
  blurRadius: 50,
  color: const Color(0xFF0700B1).withOpacity(0.15),
);

final kDefaultCardShadow = BoxShadow(
  offset: const Offset(0, 20),
  blurRadius: 50,
  color: Colors.black.withOpacity(0.1),
);

// TextField dedign
const kDefaultInputDecorationTheme = InputDecorationTheme(
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder,
);

const kDefaultOutlineInputBorder = OutlineInputBorder(
  // Maybe flutter team need to fix it on web
  // borderRadius: BorderRadius.circular(50),
  borderSide: BorderSide(
    color: Color(0xFFCEE4FD),
  ),
);
