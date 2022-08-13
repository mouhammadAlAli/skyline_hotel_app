import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/account/account_screen.dart';
import '../modules/book/book_screen.dart';
import '../modules/home/home_screen.dart';
import '../modules/room_service/service_screen.dart';

class HomeLayoutController extends GetxController{
  bool showLogInButton = true;
  int currentIndex = 0;
  List<String> titles = [
    "Home",
    "Services",
    "Book",
    "Account"
  ];
  List<Widget> screens = [
    HomeScreen(),
    ServicesScreen(),
    const BookScreen(),
    const AccountScreen()
  ];

  void changeIndex(int index){
    currentIndex = index;
    update();
  }
}