import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_study_project/main.dart';
import 'package:nexteons_study_project/model/studentsdata/student_data_model.dart';
import 'package:nexteons_study_project/utils/constant/app_const.dart';
import 'package:nexteons_study_project/utils/router_names.dart';

import '../../../utils/color_theme.dart';
import '../../../utils/text_styles.dart';

class CreateStudentController extends GetxController {
  final firstnameControl = TextEditingController();
  final mailControl = TextEditingController();
  final lastnameControl = TextEditingController();
  final uidControl = TextEditingController();
  final distControl = TextEditingController();
  final pinControl = TextEditingController();
  final phoneControl = TextEditingController();
  final countryControl = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void resetAll() {
    firstnameControl.clear();
    mailControl.clear();
    lastnameControl.clear();
    uidControl.clear();
    distControl.clear();
    pinControl.clear();
    phoneControl.clear();
    countryControl.clear();
  }

  void createStudent() {
    if (formkey.currentState!.validate()) {
      //succsess
      students.add(Student(
          firstname: firstnameControl.text,
          lastname: lastnameControl.text,
          email: mailControl.text,
          id: uidControl.text,
          district: distControl.text,
          phoneNumber: phoneControl.text,
          pincode: int.parse(pinControl.text),
          country: countryControl.text));
      // print("done");

      //navigation to details page
      navigatorKey.currentContext!.goNamed(Routernames.showDatas);
      // navigatorKey.currentContext!.goNamed(Routernames.showDatas);
      resetAll();
    } else {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: Text("Failed To Add Data",
              style: GlTextStyles.interStyl(color: ColorTheme.white, size: 12)),
          duration: const Duration(seconds: 1),
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        ),
      );
    }
  }
}
