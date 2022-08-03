import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parker/src/style/app_colors.dart';

class AppTextStyle {
  static TextStyle header1Light = GoogleFonts.inter(
      fontSize: 32.0,
      fontWeight: FontWeight.w600,
      color: AppColors.textColorLight);

  static TextStyle body2 = GoogleFonts.inter(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: AppColors.textColorDark);
}
