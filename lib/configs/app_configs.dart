import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppConfigs {
  late double overRideFontSize;
  AppConfigs(this.overRideFontSize);
  static const apiBaseUrl = 'https://server.hiring.io/';
  // main Colors for the App
  static const primaryColor = Color(0xff3096F3);
  static const accentColor = Color(0xfff2f8fe);
  static const secondaryColor = Color(0xff112138);
  static const overLayColor = Color(0xff0a191f);
  static const strokeColor = Color(0xffe6e6e6);
  static const secondaryTextColor = Color(0xff707a88);
  static const logoColor = Color(0xffff7424);
  static const blueColor = Color(0xff2192DE);
  static const darkBlueColor = Color(0xff2862B8);
  static const lightBlueColor = Color(0xff2174EC);
  static const lightGreenColor = Color(0xff12BBDE);
  static const darkerGreenColor = Color(0xff12CFDE);
  static const darkGreenColor = Color(0xff2AD9CD);
  static const labelTextStyleColor = Color(0xff707A88);
  // main Colors for the App
  static var unSelectedTabsTextStyle = GoogleFonts.poppins(
    fontSize: 15,
    color: overLayColor,
    fontWeight: FontWeight.w500,
  );
  static var selectedTabsTextStyle = GoogleFonts.poppins(
    fontSize: 15,
    color: primaryColor,
    fontWeight: FontWeight.w500,
  );
  static var textFieldLabelStyle = GoogleFonts.poppins(
    fontSize: 14,
    color: labelTextStyleColor,
    fontWeight: FontWeight.w500,
  );
  static var screenTitlesTextStyle = GoogleFonts.poppins(
    fontSize: 17,
    color: overLayColor,
    fontWeight: FontWeight.w500,
  );
  static var appLogoTextStyle = GoogleFonts.poppins(
    fontSize: 25,
    color: overLayColor,
    fontWeight: FontWeight.w500,
  );
  static var subTitlesTextStyle = GoogleFonts.poppins(
    fontSize: 12,
    color: labelTextStyleColor,
    fontWeight: FontWeight.w500,
  );
  static var appBarTitle = GoogleFonts.poppins(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );
  static var secondaryTextStyleForNumberDrawer = GoogleFonts.poppins(
    fontSize: 14,
    color: primaryColor,
    fontWeight: FontWeight.w400,
  );
}
