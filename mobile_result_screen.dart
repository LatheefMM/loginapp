import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_study_project/utils/color_theme.dart';
import 'package:nexteons_study_project/utils/router_names.dart';
import 'package:nexteons_study_project/utils/text_styles.dart';

import '../../../../main.dart';
import '../../../../utils/constant/app_const.dart';
import 'widget/student_card.dart';

class MobileResultScreen extends StatelessWidget {
  const MobileResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 15),
          child: ListView.builder(
            itemBuilder: (context, index) => index == students.length
                ? GestureDetector(
                    onTap: () {
                      GoRouter.of(navigatorKey.currentContext!)
                          .goNamed(Routernames.addDatas);
                    },
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(width: .5)),
                      color: ColorTheme.grey,
                      child: ListTile(
                        leading: const Icon(
                          Icons.add_circle_outline_outlined,
                        ),
                        title: Text(
                          "Add New Student",
                          style: GlTextStyles.interStyl(),
                        ),
                      ),
                    ),
                  )
                : StudentCard(
                    firstname: students[index].firstname,
                    lastname: students[index].lastname,
                    mail: students[index].email,
                    id: students[index].id,
                    district: students[index].district,
                    phone: students[index].phoneNumber,
                    pincode: students[index].pincode,
                    country: students[index].country,
                    titleFontSize: 16,
                    subFontsize: 12,
                  ),
            itemCount: students.length + 1,
          )),
    );
  }
}
