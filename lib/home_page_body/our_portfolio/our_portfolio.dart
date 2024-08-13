import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/utils.dart';
import 'package:speeder_website/home_page_body/our_portfolio/free_trial.dart';
import 'package:speeder_website/home_page_body/our_portfolio/our_customers.dart';
import 'package:speeder_website/utills/consts.dart';

class OurPortfolioSection extends StatefulWidget {
  const OurPortfolioSection({super.key});

  @override
  State<StatefulWidget> createState() {
    return OurPortfolioSectionState();
  }
}

class OurPortfolioSectionState extends State<OurPortfolioSection> {
  final myitems = [
    Image.asset('assets/images/pc1.png'),
    Image.asset('assets/images/pc2.png'),
    Image.asset('assets/images/pc3.png'),
    Image.asset('assets/images/pc4.png'),
    Image.asset('assets/images/pc5.png'),
    Image.asset('assets/images/pc6.png'),
    Image.asset('assets/images/pc7.png'),
    Image.asset('assets/images/pc8.png'),
  ];

  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 325,
                  color: hexToColor("#FEF5D9"),
                ),
                Container(
                  width: double.infinity,
                  height: 125,
                  color: hexToColor("#F3F8FF"),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Text(
                    "Our Portfolio",
                    style: TextStyle(
                      fontSize: width > 600 ? 24 : 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Montserrat",
                      color: hexToColor("#212C62"),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 700),
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Text(
                      ourPortfolioText,
                      style: TextStyle(
                        fontSize: width > 600 ? 15 : 12,
                        fontFamily: "Montserrat",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      initialPage: 0,
                      viewportFraction: width < 500 ? 1.0 / 1 : 1 / 3.0,
                      height: 300,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 200),
                      autoPlayInterval: const Duration(seconds: 2),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      aspectRatio: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          myCurrentIndex = index;
                        });
                      },
                    ),
                    items: myitems,
                  ),
                ],
              ),
            ),
          ],
        ),
        const FreeTrialSection(),
        const OurCustomersSection()
      ],
    );
  }
}
