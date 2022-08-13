import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyline/controller/home_layout_controller.dart';
import 'package:skyline/modules/login/login_screen.dart';
import 'package:skyline/shared/components/components.dart';
import 'package:skyline/shared/components/constants.dart';
import 'package:skyline/styles/themes.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLayoutController>(
      init: HomeLayoutController(),
      builder: (controller) {
        return Scaffold(
          drawer: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 80.0,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    onTap: (){
                      if(Get.isDarkMode){
                        Get.changeTheme(lightTheme);
                      }else{
                        Get.changeTheme(darkTheme);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Dark theme",style: Theme.of(context).textTheme.titleSmall,),
                        const Icon(Icons.dark_mode_outlined),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: getAppBar(controller.titles[controller.currentIndex]),
          bottomNavigationBar: getNavBar(controller),
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: Get.isDarkMode?AssetImage(darkBackgroundImage):AssetImage(lightBackgroundImage), fit: BoxFit.cover)
              ),
              child: controller.screens[controller.currentIndex]
          ),
          floatingActionButton: Visibility(
            visible: controller.showLogInButton,
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: MaterialButton(
                  onPressed: () {
                    navigateTo(context, const LoginScreen());
                  },
                  color: Theme.of(context).primaryColor,
                  height: 50,
                  child: Text("LOGIN",style:  Theme.of(context).textTheme.titleMedium,),
                )
            ),
          ),
        );
      }
    );
  }
}

