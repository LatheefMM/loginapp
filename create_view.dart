import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_study_project/screen/widget/responsive_layout.dart';
import 'package:nexteons_study_project/screen/students/create/controller.dart';
import 'package:nexteons_study_project/screen/students/create/responsive/desktop_create_screen.dart';
import 'package:nexteons_study_project/screen/students/create/responsive/mobile_create_screen.dart';
import 'package:nexteons_study_project/screen/students/create/responsive/tablet_create_screen.dart';


class StudentsCreate extends StatefulWidget {
  const StudentsCreate({super.key});

  @override
  State<StudentsCreate> createState() => _StudentsCreateState();
}

class _StudentsCreateState extends State<StudentsCreate> {
  late CreateStudentController controller;
  final String tag = DateTime.now().toString();
  @override
  void initState() {
    controller = Get.put(CreateStudentController(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<CreateStudentController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileBody: CreateStudentMobileScreen(controller: controller),
        tabletBody: CreateStudentTabletScreen(controller: controller),
        desktopBody: CreateStudentDesktopScreen(controller: controller));
  }
}
//st->child
///mobile:Sc{
/// appbar: app
/// body :child
///}
///tab:sc{
///
///}
/// scffold{
/// body:Row(
/// [
/// if(desktop)
/// desktop,
/// if(mtab)
/// tabside
/// Expanded(child)
/// ]),
/// app:if(mobile)appbar:null
///
/// }

/*
 ResponsiveLayout(
        mobileBody: CreateStudentMobileScreen(
          controller: controller,
        ),
        tabletBody: CreateStudentTabletScreen(controller: controller,),
        desktopBody: CreateStudentDesktopScreen(controller: controller,));
*/
