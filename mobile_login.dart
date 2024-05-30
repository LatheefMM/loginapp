import 'package:flutter/material.dart';
import 'package:nexteons_study_project/screen/students/login/login_controller.dart';

import '../../../../utils/color_theme.dart';
import '../../../../utils/text_styles.dart';
import 'widget/login_entry_feild.dart';

class LoginMobile extends StatelessWidget {
  final LoginController controller;
  const LoginMobile({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.white,
      body: Form(
        key: controller.loginValidatkey,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 70, bottom: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 350,
                      width: 350,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("asset/image/loginbk.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Welcome Back!",
                        style: GlTextStyles.robotoStyl(
                            size: 30, weight: FontWeight.w700),
                        children: [
                          TextSpan(
                              text: "\nLogin your account",
                              style: GlTextStyles.robotoStyl(
                                  size: 16, weight: FontWeight.w400))
                        ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  LoginEntryField(
                    title: "Username or Email",
                    fontsize: 14,
                    controller: controller.nameormailControl,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  LoginEntryField(
                    title: "Password",
                    fontsize: 14,
                    controller: controller.passControl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Password";
                      }
                      return null;
                    },
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: Text(
                  //         "Forgot Password",
                  //         style: GlTextStyles.robotoStyl(
                  //             size: , weight: FontWeight.w400),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: controller.postLogin,
                    height: 50,
                    color: ColorTheme.drkBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "Login",
                        style: GlTextStyles.robotoStyl(
                            size: 16,
                            weight: FontWeight.w600,
                            color: ColorTheme.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
