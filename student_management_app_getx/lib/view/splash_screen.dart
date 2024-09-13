import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../core/colors.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolors.white, 
      body: Center(
        child:GetBuilder<LoginController>(builder: (loginController){
          return  SizedBox(child: Image.asset('assets/logo_prev_ui.png'));
        },)
      ),


    );
  }
}