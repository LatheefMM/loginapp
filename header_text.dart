import 'package:flutter/material.dart';

import '../../../../../utils/color_theme.dart';
import '../../../../../utils/text_styles.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    super.key,
    required this.text,
    required this.fontsize,
  });
  final String text;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorTheme.lightBlue.withOpacity(.5),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.center,
      child: Text(
        text,
        style: GlTextStyles.interStyl(
          size: fontsize,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
