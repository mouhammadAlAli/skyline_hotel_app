import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/components/components.dart';
import '../../styles/themes.dart';

class HomeScreen extends StatelessWidget {
  var i = const DecorationImage(
      image: AssetImage('assets/images/blue.png'), fit: BoxFit.cover);

  List<Widget> pageView = [
    pageViewItem(
        imageUrl:
            'https://images-platform.99static.com/2FORxxMKJ95b32Nu463el_ZlC5g=/0x0:1979x1979/500x500/top/smart/99designs-contests-attachments/78/78731/attachment_78731040',
        title: "Five Stars",
        text:
            "text text text text text text text text text text text text text text ",
        bImage: const DecorationImage(
            image: AssetImage('assets/images/blue.png'), fit: BoxFit.cover)),
    pageViewItem(
        imageUrl:
            'https://www.theshelbourne.com/resourcefiles/roomssmallimages/heritage-parkview-guestroom.jpg',
        title: "Rooms and Suits",
        text:
            "text text text text text text text text text text text text text text ",
        bImage: const DecorationImage(
            image: AssetImage('assets/images/blue.png'), fit: BoxFit.cover)),
    pageViewItem(
      imageUrl:
          'https://www.gasterijzondag.nl/wp-content/uploads/2012/07/cropped-Restaurant.jpg',
      title: "Restaurant",
      text:
          "text text text text text text text text text text text text text text ",
      bImage: const DecorationImage(
          image: AssetImage('assets/images/blue.png'), fit: BoxFit.cover),
    ),
    pageViewItem(
        imageUrl:
            'https://leisurepools.eu/wp-content/uploads/2020/06/best-type-of-swimming-pool-for-my-home_2.jpg',
        title: "Swimming pool",
        text:
            "text text text text text text text text text text text text text text ",
        bImage: const DecorationImage(
            image: AssetImage('assets/images/blue.png'), fit: BoxFit.cover)),
    pageViewItem(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHnqCKtinqAQQP_LOmAz8cUxPef2haaHyJvg&usqp=CAU',
        title: "Spa",
        text:
            "text text text text text text text text text text text text text text ",
        bImage: const DecorationImage(
            image: AssetImage('assets/images/blue.png'), fit: BoxFit.cover)),
  ];

  var boardController = PageController();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: boardController,
            itemBuilder: (context, index) => pageView[index],
            itemCount: pageView.length,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: SmoothPageIndicator(
              effect: ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 10,
                  expansionFactor: 4,
                  activeDotColor: defaultColor),
              controller: boardController,
              count: pageView.length),
        )
      ],
    );
  }
}

//Rooms and Suits
//"text text text text text text text text text text text text text text "
