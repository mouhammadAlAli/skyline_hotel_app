import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyline/shared/components/components.dart';
import 'package:skyline/styles/themes.dart';

class ServicesScreen extends StatelessWidget {
  List<Widget> services = [
    pageViewItem(
      imageUrl:
          'https://d1gymyavdvyjgt.cloudfront.net/drive/images/uploads/headers/ws_cropper/1_0x0_790x520_0x520_bay_parking_guide.jpg',
      title: 'Car Parking',
      text:
          'text text text text text text text text text text text text text text text text text text text text text text text text ',
      center: true,
      titleColor: defaultColor,
      textColor: Get.isDarkMode?  Colors.white : Colors.black
    ),
    pageViewItem(
      imageUrl:
          'https://i0.wp.com/www.cablefree.net/wp-content/uploads/2017/05/CableFree-Wi-Fi_Logo.png?resize=1024%2C657&ssl=1',
      title: 'Free WiFi',
      text:
          'text text text text text text text text text text text text text text text text text text text text text text text text ',
      center: true,
      titleColor: defaultColor,
      textColor: Get.isDarkMode?  Colors.white : Colors.black,
    ),
    pageViewItem(
      imageUrl:
      'https://cdn.vox-cdn.com/thumbor/kfRJdxNdGpNlTuf8ZK4MD9i59h8=/0x0:3500x2333/620x465/filters:focal(1470x887:2030x1447):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/58534937/bb1_0512_51950505088_o.262.jpg',
      title: 'Restaurant',
      text:
          'text text text text text text text text text text text text text text text text text text text text text text text text ',
      center: true,
      titleColor: defaultColor,
      textColor: Get.isDarkMode?  Colors.white : Colors.black,
    ),
    pageViewItem(
      imageUrl:
        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/best-luxury-gyms-london-1577449934.jpg?resize=980:*',
      title: 'Gym',
      text:
          'text text text text text text text text text text text text text text text text text text text text text text text text ',
      center: true,
      titleColor: defaultColor,
      textColor: Get.isDarkMode?  Colors.white : Colors.black,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "OUR SERVICES",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              "BEST PLACE TO ENJOY",
              style: TextStyle(fontSize: 16, color: defaultColor),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => services[index],
              itemCount: services.length,
              separatorBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  height: 2.0,
                  color: defaultColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
