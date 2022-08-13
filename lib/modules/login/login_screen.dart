import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyline/controller/login_controller.dart';
import 'package:skyline/modules/register/register_screen.dart';

import '../../shared/components/components.dart';
import '../../styles/themes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    {
      var formKey = GlobalKey<FormState>();
      var emailController = TextEditingController();
      var passwordController = TextEditingController();

      return GetBuilder<LoginController>(
        init: LoginController(),
          builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Get.isDarkMode? const Color(0xff121212) : Colors.white,
          iconTheme: IconThemeData(color: defaultColor),
          leading: IconButton(onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back),),
        ),
        body: Container(
          color: Get.isDarkMode? const Color(0xff121212) : Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LOGIN",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Welcome to our hotel",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return "please enter your email address";
                            }
                            return null;
                          },
                          prefix: Icons.email_outlined,
                          label: "Email Address"),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return "please enter your password";
                            }
                            if(value.length<8){
                              return "password is too short";
                            }
                            return null;
                          },
                          suffix: IconButton(
                              onPressed: () {
                                controller.changeShowPassword();
                              },
                              icon: Icon(
                                Icons.visibility_outlined,
                                color: controller.visibleIconColor,
                              )),
                          prefix: Icons.lock_open_outlined,
                          label: "Password",
                          onSubmit: (value) {
                            controller.login(context, formKey,email: emailController.text,password: passwordController.text);
                          },
                          isPassword: controller.isPassword),
                      const SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        onPressed: () {
                          controller.login(context, formKey,email: emailController.text,password: passwordController.text);
                        },
                        height: 55,
                        elevation: 0.0,
                        minWidth: double.infinity,
                        child: Text(
                          "LOGIN",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: Colors.white),
                        ),
                        color: defaultColor,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                              onPressed: () {
                                navigateTo(context,  RegisterScreen());
                              }, child: const Text("REGISTER"))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ));
    }
  }
}


