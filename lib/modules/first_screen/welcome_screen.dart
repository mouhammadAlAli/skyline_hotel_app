import 'package:flutter/material.dart';
import 'package:skyline/layouts/home_layout/home_layout.dart';
import 'package:skyline/styles/themes.dart';

import '../../shared/components/components.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0.0, backgroundColor: Colors.white),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/skyLine.jpg'),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    navigateToAndFinish(context, const HomeLayout());
                  },
                  minWidth: double.infinity,
                  height: 70,
                  color: defaultColor,
                  child: const Text(
                    "RESERVE NOW",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
