import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyline/layouts/home_layout/home_layout.dart';

import '../styles/themes.dart';

class LoginController extends GetxController{
  bool isPassword = true;
  Color visibleIconColor = Colors.grey;
  void changeShowPassword() {
    if (isPassword) {
      isPassword = false;
      visibleIconColor = defaultColor;
    } else {
      isPassword = true;
      visibleIconColor = Colors.grey;
    }
    update();
  }
  void login(BuildContext context,GlobalKey<FormState> formKey,{String? email,String? password}) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      //TODO
       Get.off(const HomeLayout());
    }
  }
}