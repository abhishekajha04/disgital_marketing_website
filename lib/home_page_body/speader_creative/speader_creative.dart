import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/consts.dart';
import 'package:speeder_website/Utills/utils.dart';
import 'package:speeder_website/responsive/responsive.dart';

class SpeaderCreative extends StatefulWidget {
  const SpeaderCreative({super.key});

  @override
  State<StatefulWidget> createState() {
    return SpeaderCreativeState();
  }
}

class SpeaderCreativeState extends State<SpeaderCreative> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      color: hexToColor("#F3F8FF"),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            "Why Speeder Creative ?",
            style: TextStyle(
              fontSize: width > 600 ? 24 : 20,
              fontWeight: FontWeight.w700,
              fontFamily: "Montserrat",
              color: hexToColor("#212C62"),
            ),
          ),
          SizedBox(height: width > 600 ? 10 : 5),
          Text(
            "Delegate your success to our dedicated team.",
            style: TextStyle(
              fontSize: width > 600 ? 16 : 12,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
              color: hexToColor("#000000"),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            constraints: const BoxConstraints(maxWidth: 650),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              speederCreativeText,
              style: TextStyle(
                fontSize: width > 600 ? 14 : 12,
                fontFamily: "Montserrat",
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          if (Responsive.isDesktop(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sppederCreativeContainer(
                  context,
                  "assets/images/c1.png",
                  "7+ Years of experience",
                  speederCreativeText1,
                ),
                sppederCreativeContainer(context, "assets/images/c2.png",
                    "1400 + Happy Customers", speederCreativeText2),
                sppederCreativeContainer(context, "assets/images/c3.png",
                    "140 + Projects Completed", speederCreativeText3),
                sppederCreativeContainer(context, "assets/images/c4.png",
                    "Worldwide businessinfluence.", speederCreativeText4),
              ],
            ),
          if (!Responsive.isDesktop(context))
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: sppederCreativeContainerMobile(
                          context,
                          "assets/images/c1.png",
                          "7+ Years of experience",
                          speederCreativeText1,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: sppederCreativeContainerMobile(
                            context,
                            "assets/images/c2.png",
                            "1400 + Happy Customers",
                            speederCreativeText2),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: sppederCreativeContainerMobile(
                            context,
                            "assets/images/c3.png",
                            "140 + Projects Completed",
                            speederCreativeText3),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: sppederCreativeContainerMobile(
                            context,
                            "assets/images/c4.png",
                            "Worldwide businessinfluence.",
                            speederCreativeText4),
                      ),
                    ],
                  )
                ],
              ),
            ),
          SizedBox(
            height: width < 500 ? 50 : 80,
          )
        ],
      ),
    );
  }
}

Widget sppederCreativeContainer(
    BuildContext context, String image, String heading, String description) {
  final width = MediaQuery.of(context).size.width;
  return Container(
    width: width > 600 ? 235 : 200,
    height: width > 600 ? 250 : 275,
    margin: const EdgeInsets.all(10),
    color: Colors.white,
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Image.asset(
          image,
          width: 80,
        ),
        const SizedBox(height: 12),
        Text(
          heading,
          style: TextStyle(
              fontSize: 14,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w700,
              color: hexToColor("#212C62")),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: const TextStyle(
            fontSize: 10,
            fontFamily: "Montserrat",
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget sppederCreativeContainerMobile(
    BuildContext context, String image, String heading, String description) {
  return Container(
    width: double.infinity,
    height: 285,
    color: Colors.white,
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Image.asset(
          image,
          width: 80,
        ),
        const SizedBox(height: 12),
        Text(
          heading,
          style: TextStyle(
              fontSize: 14,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w700,
              color: hexToColor("#212C62")),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: const TextStyle(
            fontSize: 10,
            fontFamily: "Montserrat",
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
