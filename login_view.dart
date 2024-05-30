import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_study_project/screen/students/login/login_controller.dart';
import 'package:nexteons_study_project/screen/students/login/responsive/desktop_login.dart';
import 'package:nexteons_study_project/screen/students/login/responsive/mobile_login.dart';
import 'package:nexteons_study_project/screen/students/login/responsive/tablet_login.dart';

import '../../widget/responsive_layout.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginController controller;
  final String tag = DateTime.now().toString();
  @override
  void initState() {
    controller = Get.put(LoginController(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<LoginController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileBody: LoginMobile(controller: controller),
        tabletBody: LoginTablet(controller: controller),
        desktopBody: LoginDesktop(controller: controller));
  }
}
