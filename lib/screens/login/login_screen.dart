import 'package:app_study/configs/themes/app_colors.dart';
import 'package:app_study/controllers/auth_controller.dart';
import 'package:app_study/widgets/common/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);


  static  const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient()
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/app_splash_logo.png",width: 200,
              height: 200),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 60),
              child: const Text(
                "This is a study app. You can use as you want. You have the "
                    "full access to all the materials in this course",
                style: TextStyle(
                  color: onSurfaceTextColor, fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
            ),
            MainButton(
              onTap: (){
                controller.signWithGoogle();
              },
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,

                      child: SvgPicture.asset("assets/icons/google.svg")
                  ),
                  Center(
                    child: Text(
                        "Sign in with Google",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              ) ,
            )
          ],
        ),
      ),
    );
  }
}
