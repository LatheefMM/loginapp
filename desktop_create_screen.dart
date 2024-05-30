import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controller.dart';
import '../../../../utils/text_styles.dart';
import '../../../widget/data_entry_feild.dart';
import '../../../widget/save_button.dart';

class CreateStudentDesktopScreen extends StatelessWidget {
  final CreateStudentController controller;
  const CreateStudentDesktopScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: controller.formkey,
        child: Padding(
          padding: const EdgeInsets.only(left: 120, top: 72),
          child: SizedBox(
            height: size.width * .75,
            width: size.width * .65,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BASIC DETAILS",
                    style: GlTextStyles.interStyl(
                        size: 35, weight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: GridView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 16,
                              mainAxisExtent: 120,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 80),
                      children: [
                        //validate min 3 lettoers needed
                        DataEntryField(
                          title: "First Name",
                          controller: controller.firstnameControl,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 3) {
                              return 'First name Should atleast Contains 3 Letters ';
                            }
                            return null;
                          },
                        ),
                        DataEntryField(
                            title: "Last Name",
                            controller: controller.lastnameControl),
                        //if entered it has to be validated
                        DataEntryField(
                          title: "Email Address",
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
                            controller: controller.distControl),
                        DataEntryField(
                          title: "Phone No.",
                          controller: controller.phoneControl,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                        DataEntryField(
                          title: "Pincode",
                          controller: controller.pinControl,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                        DataEntryField(
                            title: "Country",
                            controller: controller.countryControl),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .1,
                  ),
                  SizedBox(
                    width: size.width * .65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: controller.resetAll,
                            child: Text(
                              "Reset All",
                              style: GlTextStyles.interStyl(
                                  size: 24, weight: FontWeight.w600),
                            )),
                        SaveButton(
                          text: "Save & Proceed",
                          fontsize: 20,
                          minwidth: size.width * .12,
                          shight: size.width * .025,
                          swidth: size.width * .12,
                          onpress: () {
                            controller.createStudent();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
