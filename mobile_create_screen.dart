import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/text_styles.dart';
import '../../../widget/data_entry_feild.dart';
import '../../../widget/save_button.dart';
import '../controller.dart';

class CreateStudentMobileScreen extends StatelessWidget {
  final CreateStudentController controller;
  const CreateStudentMobileScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 15),
        child: Form(
          key: controller.formkey,
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: ListView(
              children: [
                Text(
                  "BASIC DETAILS",
                  style:
                      GlTextStyles.interStyl(size: 14, weight: FontWeight.w700),
                ),
                //validate min 3 lettoers needed
                DataEntryField(
                  title: "First Name",
                  fontsize: 12,
                  controller: controller.firstnameControl,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 3) {
                      return 'First name Should atleast Contains 3 Letters ';
                    }
                    return null;
                  },
                ),
                DataEntryField(
                    title: "Last Name",
                    fontsize: 12,
                    controller: controller.lastnameControl),
                //if entered it has to be validated
                DataEntryField(
                  title: "Email Address",
                  fontsize: 12,
                  controller: controller.mailControl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    } else if (!value.contains('@') ||
                        !value.contains('.com')) {
                      return 'Enter a valid Email';
                    }
                    return null;
                  },
                ),
                //is required
                DataEntryField(
                  title: "User ID",
                  fontsize: 12,
                  controller: controller.uidControl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter User Id";
                    }
                    return null;
                  },
                ),
                DataEntryField(
                    title: "District",
                    fontsize: 12,
                    controller: controller.distControl),
                DataEntryField(
                  title: "Phone No.",
                  fontsize: 12,
                  controller: controller.phoneControl,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                DataEntryField(
                  title: "Pincode",
                  fontsize: 12,
                  controller: controller.pinControl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                DataEntryField(
                    title: "Country",
                    fontsize: 12,
                    controller: controller.countryControl),
                SizedBox(height: size.width * .1),
                Center(
                  child: SaveButton(
                    text: "Save",
                    fontsize: 10,
                    shight: 40,
                    swidth: size.width * .3,
                    minwidth: size.width * .3,
                    onpress: controller.createStudent,
                  ),
                ),
                SizedBox(height: size.width * .02),
                Center(
                  child: TextButton(
                      onPressed: controller.resetAll,
                      child: Text(
                        "Reset All",
                        style: GlTextStyles.interStyl(
                            size: 12, weight: FontWeight.w600),
                      )),
                ),
                SizedBox(height: size.width * .03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
