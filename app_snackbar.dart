import 'package:flutter/material.dart';
import 'package:nexteons_study_project/utils/text_styles.dart';

import '../../utils/color_theme.dart';

class AppSnackbar {
  static oneTimeSnackBar(
    String? message, {
    Color? bgColor,
    Color? txtColor,
    TextStyle? textStyle,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: bgColor ?? Colors.red,
        content: Text(message!,
            style: GlTextStyles.interStyl(
                color: txtColor ?? ColorTheme.white, size: 14)),
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
      ),
    );
  }
}
