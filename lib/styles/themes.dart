import 'package:flutter/material.dart';

var defaultColor = Colors.lightBlue;

ThemeData lightTheme= ThemeData(
  primarySwatch: defaultColor,
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    backgroundColor: defaultColor,
    elevation: 0.0,
    selectedItemColor: Colors.white,
    type: BottomNavigationBarType.fixed
  ),
    drawerTheme: DrawerThemeData(backgroundColor: Colors.lightBlue.withOpacity(0.5)),
    textTheme: const TextTheme(titleSmall:  TextStyle(color: Colors.white,fontSize: 18),titleMedium: TextStyle(color: Colors.white, fontSize: 18.0)),
    iconTheme: const IconThemeData(color: Colors.white,size: 35),

  appBarTheme: const AppBarTheme(
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),
  ),
  tabBarTheme: TabBarTheme(unselectedLabelColor: Colors.grey,labelColor: defaultColor,),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor:  const Color(0xff121212),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: defaultColor,
    ),
  tabBarTheme: TabBarTheme(unselectedLabelColor: Colors.white,labelColor: defaultColor),
  iconTheme: IconThemeData(color: defaultColor,size: 35),
  textTheme: TextTheme(titleSmall: TextStyle(color: defaultColor,fontSize: 18),titleMedium: TextStyle(color: defaultColor,fontSize: 18.0)),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(color: defaultColor,fontWeight: FontWeight.bold,fontSize: 18.0),
      iconTheme: IconThemeData(color: defaultColor))
);