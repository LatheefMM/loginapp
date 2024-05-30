import 'package:flutter/material.dart';

import '../../utils/color_theme.dart';
import '../../utils/text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.fontsize,
    required this.onpress,
    required this.text,
    required this.height,
  });
  final double fontsize;
  final VoidCallback onpress;
  final String text;
  final double height;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      color: ColorTheme.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      onPressed: onpress,
      child: Center(
        child: Text(
          text,
          style: GlTextStyles.interStyl(
              size: fontsize,
              weight: FontWeight.w500,
              color: ColorTheme.lightBlue),
        ),
      ),
    );
  }
}
