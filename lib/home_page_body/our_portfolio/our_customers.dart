import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/utils.dart';

class OurCustomersSection extends StatefulWidget {
  const OurCustomersSection({super.key});

  @override
  State<StatefulWidget> createState() {
    return OurCustomersSectionState();
  }
}

class OurCustomersSectionState extends State<OurCustomersSection> {
  final myitems = [
    Image.asset('assets/images/a1.png'),
    Image.asset('assets/images/a2.png'),
    Image.asset('assets/images/a3.png'),
    Image.asset('assets/images/a4.png'),
    Image.asset('assets/images/a5.png'),
    Image.asset('assets/images/a6.png'),
    Image.asset('assets/images/a7.png'),
    Image.asset('assets/images/a8.png'),
    Image.asset('assets/images/a9.png'),
    Image.asset('assets/images/a10.png'),
    Image.asset('assets/images/a11.png'),
    Image.asset('assets/images/a12.png'),
    Image.asset('assets/images/a13.png'),
    Image.asset('assets/images/a14.png'),
    Image.asset('assets/images/a15.png'),
    Image.asset('assets/images/a16.png'),
    Image.asset('assets/images/a17.png'),
    Image.asset('assets/images/a18.png'),
  ];

  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        if (width >= 600)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "45+ customers in ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      color: hexToColor("#000000")),
                ),
                Text(
                  "over 07 countries ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      color: hexToColor("#3B62D8")),
                ),
                Text(
                  "grow their business with Growly",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      color: hexToColor("#000000")),
                ),
              ],
            ),
          ),
        if (width < 600)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "45+ customers in ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      color: hexToColor("#000000")),
                ),
                Text(
                  "over 07 countries ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      color: hexToColor("#3B62D8")),
                ),
                Text(
                  "grow their business with Growly",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      color: hexToColor("#000000")),
                ),
              ],
            ),
          ),
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            initialPage: 0,
            viewportFraction: width > 500 ? 1 / 6 : 1 / 4,
            height: width > 500 ? 150 : 120,
            autoPlayAnimationDuration: const Duration(milliseconds: 200),
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            onPageChanged: (index, reason) {
              setState(() {
                myCurrentIndex = index;
              });
            },
          ),
          items: myitems,
        ),
      ],
    );
  }
}
