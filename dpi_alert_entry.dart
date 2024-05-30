import 'package:flutter/material.dart';

import '../../../../../utils/color_theme.dart';
import '../../../../../utils/text_styles.dart';
import '../../../../widget/data_entry_feild.dart';
import '../../../../widget/save_button.dart';
import '../../diprate_list_controller.dart';

class DpiAlertBoxEntryFeild extends StatelessWidget {
  final DipRateListController controller;
  const DpiAlertBoxEntryFeild({
    super.key,
    required this.controller,
    this.id,
    required this.onpressed,
    this.name,
    this.rate,
  });
  final String? id;
  final String? name;
  final String? rate;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    if (id != null) {
      controller.nameControl = TextEditingController(text: name);
      controller.rateControl = TextEditingController(text: rate);
    }else{
      controller.nameControl = TextEditingController();
      controller.rateControl = TextEditingController();
    }
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      title: Center(
        child: Text(
          "Add Data",
          style: GlTextStyles.robotoStyl(
              size: 18, weight: FontWeight.w500, color: ColorTheme.black),
        ),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          DataEntryField(
            title: "Name",
            fontsize: 14,
            controller: controller.nameControl,
          ),
          const SizedBox(
            height: 15,
          ),
          DataEntryField(
              title: "Rate", fontsize: 14, controller: controller.rateControl)
        ],
      ),
      actions: [
        SaveButton(text: "Save", fontsize: 12, onpress: onpressed),
        const SizedBox(
          height: 15,
        ),
        SaveButton(
            text: "Cancel",
            fontsize: 12,
            onpress: () {
              controller.nameControl.clear();
              controller.rateControl.clear();
              Navigator.of(context).pop();
            })
      ],
    );
  }
}
