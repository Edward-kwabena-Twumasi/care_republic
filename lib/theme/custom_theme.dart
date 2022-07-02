import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final textTheme = TextTheme(
  headline1: GoogleFonts.lato(
      fontSize: 59.sp, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.lato(
      fontSize: 37.sp, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.lato(fontSize: 29.sp, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.lato(
      fontSize: 22.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.lato(fontSize: 20.sp, fontWeight: FontWeight.w500),
  headline6: GoogleFonts.lato(
      fontSize: 16.sp, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.lato(
      fontSize: 13.sp, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.lato(
      fontSize: 12.sp, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.montserrat(
      fontSize: 11.sp, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.montserrat(
      fontSize: 10.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.montserrat(
      fontSize: 10.sp, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.montserrat(
      fontSize: 10.sp, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.montserrat(
      fontSize: 8.sp, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

final ColorScheme colorScheme=const ColorScheme.light(
primary: Color(0xFF1976D2),
 onPrimary:  Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFBBDEFB),
  secondary: Color(0xFF536DFE),
  onSecondary:  Color(0xFFFFFFFF),
  surface: Color(0xFFDDE1EA),
);
