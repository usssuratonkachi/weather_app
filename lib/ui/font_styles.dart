import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/ui/colors.dart';

class UIFontStyles {
  static final H1 = GoogleFonts.ubuntu(
      fontSize: 32, color: UIColors.headerColor, fontWeight: FontWeight.w500);

  static final loadPageMainTextFontStyle = GoogleFonts.inter(
      fontSize: 48, color: UIColors.white, fontWeight: FontWeight.w700);

  static final loadPageSecondTextFontStyle = GoogleFonts.inter(
      fontSize: 24, color: UIColors.white, fontWeight: FontWeight.w300);

  static final B1 = GoogleFonts.roboto(fontSize: 17, color: UIColors.greyText);

  static final B1white = GoogleFonts.roboto(
      fontSize: 17, color: UIColors.white, fontWeight: FontWeight.w400);

  static final B1medium = GoogleFonts.roboto(
      fontSize: 17, color: UIColors.white, fontWeight: FontWeight.w500);

  static final B2 = GoogleFonts.roboto(fontSize: 15, color: UIColors.greyText);

  static final B2white = GoogleFonts.roboto(
      fontSize: 15, color: UIColors.white, fontWeight: FontWeight.w400);

  static final B2medium = GoogleFonts.roboto(
      fontSize: 15, fontWeight: FontWeight.w500, color: UIColors.white);

  static final B2mediumGrey = GoogleFonts.roboto(
      fontSize: 15, fontWeight: FontWeight.w500, color: UIColors.lightGrey);

  static final mainTemperatureFont = GoogleFonts.ubuntu(
      fontSize: 64, color: UIColors.white, fontWeight: FontWeight.w500);
}
