import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_study_project/routes/app_routes.dart';
import 'package:url_strategy/url_strategy.dart';

import 'model/studentsdata/student_data_model.dart';

RxList<Student> students = [
  Student(
      firstname: "Akarsh",
      lastname: "B R",
      email: "akarsh@gmail.com",
      id: "Ak356456",
      district: "Calicut",
      phoneNumber: "9947956456",
      pincode: 678435,
      country: "India")
].obs;

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Nexteons Study',
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}

/// Login Credential

// developer.fayizalinp@gmail.com
// 0RneWfb0
