import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/color_theme.dart';
import '../../utils/text_styles.dart';

class DataEntryField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxlength;
  final double? fontsize;

  const DataEntryField({
    super.key,
    required this.title,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.maxlength,
    this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GlTextStyles.interStyl(size: fontsize),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: validator,
            controller: controller,
            keyboardType: keyboardType,
            maxLength: maxlength,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              fillColor: ColorTheme.grey,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
