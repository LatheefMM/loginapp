import 'package:flutter/material.dart';

import '../../../../../utils/color_theme.dart';
import '../../../../../utils/text_styles.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({
    super.key,
    required this.firstname,
    required this.lastname,
    required this.mail,
    required this.id,
    required this.district,
    required this.phone,
    required this.pincode,
    required this.country,
    required this.titleFontSize,
    required this.subFontsize,
  });

  final String firstname;
  final String lastname;
  final String mail;
  final String id;
  final String district;
  final String phone;
  final int pincode;
  final String country;
  final double titleFontSize;
  final double subFontsize;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(width: .5)),
      color: ColorTheme.grey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$firstname $lastname",
              style: GlTextStyles.interStyl(
                  size: titleFontSize, weight: FontWeight.w400),
            ),
            Text(
              mail,
              style: GlTextStyles.interStyl(
                  size: subFontsize, weight: FontWeight.w400),
            ),
            Text(
              id,
              style: GlTextStyles.interStyl(
                  size: subFontsize, weight: FontWeight.w400),
            ),
            Text(
              district,
              style: GlTextStyles.interStyl(
                  size: subFontsize, weight: FontWeight.w400),
            ),
            Text(
              phone,
              style: GlTextStyles.interStyl(
                  size: subFontsize, weight: FontWeight.w400),
            ),
            Text(
              "$pincode",
              style: GlTextStyles.interStyl(
                  size: subFontsize, weight: FontWeight.w400),
            ),
            Text(
              country,
              style: GlTextStyles.interStyl(
                  size: subFontsize, weight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
