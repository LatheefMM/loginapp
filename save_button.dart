import 'package:flutter/material.dart';

import '../../utils/color_theme.dart';
import '../../utils/text_styles.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.text,
    required this.onpress,
    this.fontsize,
    this.minwidth,
    this.shight,
    this.swidth,
  });
  final String text;
  final VoidCallback onpress;
  final double? fontsize;
  final double? minwidth;
  final double? shight;
  final double? swidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: shight,
      width: swidth,
      child: MaterialButton(
        onPressed: () {
          onpress();
        },
        minWidth: minwidth,
        color: ColorTheme.lightBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Center(
          child: Text(
            text,
            style: GlTextStyles.interStyl(
                size: fontsize,
                weight: FontWeight.w500,
                color: ColorTheme.white),
          ),
        ),
      ),
    );
  }
}
