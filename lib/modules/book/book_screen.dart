import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyline/styles/themes.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
            indicatorColor: defaultColor,
              onTap: (index){
              
              },
              tabs: const [
                Tab(text: "One bed",icon: Icon(Icons.hotel_outlined),),
                Tab(text: "Two bed", icon: Icon(Icons.bed),),
                Tab(text: "Suits", icon: Icon(Icons.star_outline),),
                Tab(text: "Cars", icon: Icon(Icons.car_rental_outlined),),
              ]
          ),
        ],
      ),
    );
  }
}
