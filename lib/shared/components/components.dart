import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyline/controller/home_layout_controller.dart';

Widget defaultFormField({
  required TextEditingController controller,
  String hint = "",
  required TextInputType type,
  required String? Function(String?) validate,
  bool isPassword = false,
  Widget? suffix,
  required IconData prefix,
  required String label,
  VoidCallback? onTap,
  bool isClickable = true,
  void Function(String)? onChanged,
  void Function(String)? onSubmit,
}) =>
    TextFormField(
      style: Get.isDarkMode?const TextStyle(color: Colors.white):const TextStyle(color: Colors.black),
      enabled: isClickable,
      decoration: InputDecoration(
        hintText: hint,
        label: Text(label),
        prefixIcon: Icon(prefix),
        border: const OutlineInputBorder(),
        suffixIcon: suffix,
      ),
      controller: controller,
      onChanged: onChanged,
      keyboardType: type,
      obscureText: isPassword,
      validator: validate,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
    );

Widget pageViewItem({
  required String imageUrl,
  required String title,
  required String text,
  DecorationImage? bImage,
  bool center = false,
  Color titleColor = Colors.white,
  Color textColor = Colors.white,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        // Container(
        //   width: double.infinity,
        //   height: 200,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     image: DecorationImage(
        //         image: NetworkImage(imageUrl),
        //         fit: BoxFit.cover
        //     ),
        //   ),
        // ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            image: bImage,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment:
                  center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: titleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: 16.0),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

void navigateTo(context, route) =>
    Navigator.push(context, MaterialPageRoute(builder: (c) => route));

void navigateToAndFinish(context, route) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (c) => route),
      (route) => false,
    );

AppBar getAppBar(String title) => AppBar(
      centerTitle: true,
      title: Text(
        title,
      )
    );

BottomNavigationBar getNavBar(HomeLayoutController homeLayoutController) =>
    BottomNavigationBar(
        currentIndex: homeLayoutController.currentIndex,
        onTap: (index) {
          homeLayoutController.changeIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.room_service_outlined), label: "Services"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined), label: "Book"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined), label: "account"),
        ]);
