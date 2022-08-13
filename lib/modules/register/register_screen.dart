import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../layouts/home_layout/home_layout.dart';
import '../../shared/components/components.dart';
import '../../styles/themes.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var nationalIdController = TextEditingController();
  var coPasswordController = TextEditingController();
  bool isPassword = true;
  String countryCode = "";
  var visibleIconColor = defaultColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Get.isDarkMode? Color(0xff121212) : Colors.white,
          iconTheme: IconThemeData(color: defaultColor),
          leading: IconButton(onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back),),
        ),
        body: Container(
          color: Get.isDarkMode? Color(0xff121212) : Colors.white,
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
                        "REGISTER",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Welcome to our hotel",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      defaultFormField(
                        controller: firstNameController,
                        type: TextInputType.name,
                        validate: (String? val) {
                          if (val!.isEmpty) {
                            return "please enter your name";
                          }
                          return null;
                        },
                        prefix: Icons.account_box_outlined,
                        label: "First Name",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                        controller: lastNameController,
                        type: TextInputType.name,
                        validate: (String? val) {
                          if (val!.isEmpty) {
                            return "please enter your last name";
                          }
                          return null;
                        },
                        prefix: Icons.account_box_outlined,
                        label: "Last Name",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                        controller: nationalIdController,
                        type: TextInputType.number,
                        validate: (String? val) {
                          if (val!.isEmpty) {
                            return "please enter your national id";
                          }
                          return null;
                        },
                        prefix: Icons.flag_outlined,
                        label: "National Id",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          CountryCodePicker(
                            onChanged: (val) {
                              countryCode = val.toString();
                            },
                            initialSelection: 'sy',
                            showCountryOnly: true,
                            favorite: ['+963', 'sy'],

                          ),
                          Expanded(child: defaultFormField(
                            controller: phoneNumberController,
                            type: TextInputType.phone,
                            validate: (String? val) {
                              if (val!.isEmpty) {
                                return "please enter your phone";
                              }
                              return null;
                            },
                            prefix: Icons.phone_outlined,
                            label: "Phone Number",
                          ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
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
                            if (value.length < 8) {
                              return "password is too short";
                            }
                          },
                          prefix: Icons.lock_open_outlined,
                          label: "Password",
                          onSubmit: (value) {},
                          isPassword: isPassword),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                          controller: coPasswordController,
                          type: TextInputType.visiblePassword,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return "please enter your password";
                            }
                            if (passwordController.value.text.isEmpty) {
                              return "enter the password first";
                            }
                            if (passwordController.value.text != value) {
                              return "does not match with your password";
                            }
                          },
                          prefix: Icons.lock_open_outlined,
                          label: "Confirm Password",
                          onSubmit: (value) {},
                          isPassword: isPassword),
                      const SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        onPressed: () {
                          register(context, formKey, email: emailController.text, password: passwordController.text, fName: firstNameController.text, lName: lastNameController.text, phone: '$countryCode${phoneNumberController.text}', nationalId: nationalIdController.text);
                        },
                        height: 55,
                        elevation: 0.0,
                        minWidth: double.infinity,
                        child: Text(
                          "REGISTER",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: Colors.white),
                        ),
                        color: defaultColor,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}

void register(BuildContext context, GlobalKey<FormState> formKey,{String? fName, String? lName, String? phone, String? email, String? password, String? nationalId}){
  FocusScope.of(context).requestFocus(FocusNode());
  if (formKey.currentState!.validate()) {
    //TODO
    navigateToAndFinish(context, HomeLayout());
  }
}




