import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexteons_study_project/utils/color_theme.dart';

class GlTextStyles {
  static interStyl({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.inter(
      fontSize: size ?? 20,
      fontWeight: weight ?? FontWeight.w400,
      color: color ?? ColorTheme.black,
    );
  }

  static robotoStyl({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.roboto(
      fontSize: size ?? 20,
      fontWeight: weight ?? FontWeight.w400,
      color: color ?? ColorTheme.black,
    );
  }
}
