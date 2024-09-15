import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/common_widget.dart';
import 'package:speeder_website/Utills/utils.dart';
import 'package:speeder_website/dialogs/contact_us_dialog.dart';
import 'package:speeder_website/responsive/responsive.dart';

class HomePageHeroSection extends StatefulWidget {
  const HomePageHeroSection({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageHeroSectionState();
  }
}

class HomePageHeroSectionState extends State<HomePageHeroSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Responsive.isDesktop(context)) const WebHeroSection(),
        if (!Responsive.isDesktop(context)) const MobHeroSection()
      ],
    );
  }
}

class WebHeroSection extends StatefulWidget {
  const WebHeroSection({super.key});

  @override
  State<StatefulWidget> createState() {
    return WebHeroSectionState();
  }
}

class WebHeroSectionState extends State<WebHeroSection> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: width - 80),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: LeftHeroSection(),
                  ),
                ),
                SizedBox(width: 100),
                Align(
                    alignment: Alignment.centerRight,
                    child: RightHeroSection()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MobHeroSection extends StatefulWidget {
  const MobHeroSection({super.key});

  @override
  State<StatefulWidget> createState() {
    return MobHeroSectionState();
  }
}

class MobHeroSectionState extends State<MobHeroSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: LeftHeroSection(),
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: RightHeroSection()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LeftHeroSection extends StatefulWidget {
  const LeftHeroSection({super.key});

  @override
  State<StatefulWidget> createState() {
    return LeftHeroSectionState();
  }
}

class LeftHeroSectionState extends State<LeftHeroSection> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final Uri videoUrl = Uri.parse('https://www.instagram.com/p/C8zV6imMW2K/');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("let's create",
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: width > 500 ? 28 : 18,
                color: hexToColor("#002366"))),
        const SizedBox(
          height: 10,
        ),
        Text("Bright Ideas,",
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: width > 500 ? 48 : 28,
                fontWeight: FontWeight.w500,
                color: hexToColor("#8796B3"))),
        Text("Brilliant Results,",
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: width > 500 ? 48 : 28,
                fontWeight: FontWeight.w700,
                color: hexToColor("#002366"))),
        const SizedBox(
          height: 20,
        ),
        Text(
          width > 500
              ? "Turn likes into Loyalty, Discover why businesses Trust Us \nwith Their Marketing Journey "
              : "Turn likes into Loyalty, Discover why businesses Trust Us with Their Marketing Journey ",
          style: const TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (width > 500)
              mainMenuButton("Let's Talk", onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const ContactUsServiceDialog(
                        message: 'Want To Talk');
                  },
                );
              }),
            if (width < 500)
              buildButton("Let's Talk", () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const ContactUsServiceDialog(
                        message: 'Want To Talk');
                  },
                );
              },
                  height: 40,
                  width: 125,
                  backgroundColor: "#002366",
                  borderRadius: 20,
                  leftMargin: 0,
                  textColor: "#FFFFFF",
                  bottomMargin: 0,
                  rightMargin: 0,
                  topMargin: 0),
            SizedBox(width: width > 500 ? 50 : 35),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  launchUrlFunc(videoUrl);
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/video_play.png",
                      width: 35,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Watch Video",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Poppins",
                          color: hexToColor("#002366"),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: width > 500 ? 50 : 35),
        happyCustomerWidget(),
      ],
    );
  }

  Widget happyCustomerWidget() {
    return Row(
      children: [
        Container(
          height: 65,
          width: 10,
          decoration: BoxDecoration(
              color: hexToColor("#F5BD02"),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
        ),
        Container(
          height: 65,
          width: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [hexToColor("#FFE07A"), hexToColor("#FFFFFF")],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "10K+ Happy Customers",
                  style: TextStyle(
                      fontFamily: "Montserrat", fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/star.png",
                      width: 25,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "4.9 (2k+ Reviews)",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                          color: hexToColor("#002366")),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class RightHeroSection extends StatefulWidget {
  const RightHeroSection({super.key});

  @override
  State<StatefulWidget> createState() {
    return RightHeroSectionState();
  }
}

class RightHeroSectionState extends State<RightHeroSection> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/images/ellipse_2.png",
              width: 800,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150, left: 150),
              child: Image.asset(
                "assets/images/person.png",
                width: 400,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0, left: 350),
              child: facebookContent(),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 400.0, left: 550),
              child: secondContent(),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 230.0, left: 0),
              child: thirdContent(),
            ),
          )
        ],
      ),
    );
  }

  Widget facebookContent() {
    return Container(
      height: 100,
      width: 350,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            hexToColor("#4AE0E9").withOpacity(.15),
            hexToColor("#A1C7D7").withOpacity(.15),
            hexToColor("#F1BBF5").withOpacity(.15)
          ], // Adjust the colors as needed
          begin: Alignment.topLeft, // Adjust the gradient direction as needed
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Image.asset(
                "assets/images/progress_indicator.png",
                height: 70,
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Facebook marketing campaign",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "BebasNeue",
                    fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: hexToColor("#002366"),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                  ),
                  RichText(
                      text: TextSpan(
                          text: "  Clicks : ",
                          style: const TextStyle(fontFamily: "Poppins"),
                          children: [
                        TextSpan(
                          text: "690",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              color: hexToColor("#002366")),
                        )
                      ])),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: hexToColor("#D9D9D9"),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                  ),
                  RichText(
                      text: TextSpan(
                          text: "  Goal : ",
                          style: const TextStyle(fontFamily: "Poppins"),
                          children: [
                        TextSpan(
                          text: "1000",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              color: hexToColor("#002366")),
                        )
                      ]))
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget secondContent() {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: hexToColor("#3B62D8").withOpacity(.08),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          const Text(
            "Generate Leads \n& Traffic",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: "Poppins", fontSize: 15),
          ),
          const SizedBox(height: 10),
          Image.asset(
            "assets/images/graph.png",
            width: 150,
          ),
          const SizedBox(height: 10),
          Text(
            "61 %",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 15,
                color: hexToColor("#002366")),
          ),
          const Text(
            "Annual Growth Rate",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: "Poppins", fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget thirdContent() {
    return Container(
      width: 250,
      height: 70,
      decoration: BoxDecoration(
          color: hexToColor("#3B62D8").withOpacity(0.09),
          borderRadius: const BorderRadius.all(Radius.circular(50))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    )),
                child: Image.asset(
                  "assets/images/emojii.png",
                ),
              )),
          const SizedBox(width: 5),
          const Text(
            "Increase ROI by 25%",
            style: TextStyle(
                fontSize: 14,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
