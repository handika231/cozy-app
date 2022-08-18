import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color purpleColor = const Color(0xff5843BE);
  static Color orangeColor = const Color(0xffFF9376);
  static Color blackColor = const Color(0xff000000);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color greyColor = const Color(0xff82868E);

  static double edge = 24;

  static TextStyle blackTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    color: blackColor,
  );

  static TextStyle whiteTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    color: whiteColor,
  );

  static TextStyle greyTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    color: greyColor,
  );

  static TextStyle purpleTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    color: purpleColor,
  );

  static TextStyle regularTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    color: blackColor,
  );
}
