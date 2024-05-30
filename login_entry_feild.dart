import 'package:flutter/material.dart';

import '../../../../../utils/color_theme.dart';
import '../../../../../utils/text_styles.dart';

class LoginEntryField extends StatelessWidget {
  const LoginEntryField({
    super.key,
    required this.title,
    this.controller,
    this.validator,
    required this.fontsize,
  });
  final String title;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              GlTextStyles.robotoStyl(size: fontsize, weight: FontWeight.w400),
        ),
        TextFormField(
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            fillColor: ColorTheme.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: .5, color: ColorTheme.darkgrey.withOpacity(.5)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
