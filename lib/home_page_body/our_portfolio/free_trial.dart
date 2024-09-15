import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/common_widget.dart';
import 'package:speeder_website/Utills/utils.dart';
import 'package:speeder_website/dialogs/contact_us_dialog.dart';
import 'package:speeder_website/utills/consts.dart';

class FreeTrialSection extends StatefulWidget {
  const FreeTrialSection({super.key});

  @override
  State<StatefulWidget> createState() {
    return FreeTrialSectionState();
  }
}

class FreeTrialSectionState extends State<FreeTrialSection> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      // height: width > 1000 ? 400 : 800,
      color: hexToColor("#F3F8FF"),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            SizedBox(
              height: width > 500 ? 30 : 10,
            ),
            if (width > 1000)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/lady.png",
                    width: 600,
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  freeTrial(),
                ],
              ),
            if (width <= 1000)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: freeTrial(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        "assets/images/lady.png",
                        width: 600,
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(
              height: width > 500 ? 75 : 50,
            )
          ],
        ),
      ),
    );
  }

  Widget freeTrial() {
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: width > 500 ? 130 : 85,
              height: width > 500 ? 25 : 20,
              color: hexToColor("#EAF1FF"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "WORLD - CLASS CUSTOMER SUPPORT",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: width > 500 ? 14 : 10,
                    color: hexToColor("#002366"),
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: width > 500 ? 25 : 15),
        RichText(
            text: TextSpan(
                text: "Our ",
                style: TextStyle(
                    fontSize: width > 500 ? 32 : 24,
                    color: hexToColor("#000000"),
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500),
                children: [
              TextSpan(
                text: "free trial support",
                style: TextStyle(
                    fontSize: width > 500 ? 32 : 24,
                    color: hexToColor("#002366"),
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Montserrat"),
              ),
              TextSpan(
                text: " is",
                style: TextStyle(
                    fontSize: width > 500 ? 32 : 24,
                    color: hexToColor("#000000"),
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: "\nbetter than your paid support",
                style: TextStyle(
                    fontSize: width > 500 ? 32 : 24,
                    color: hexToColor("#000000"),
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500),
              )
            ])),
        SizedBox(height: width > 500 ? 20 : 10),
        Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: const Text(
            customerSupportText,
            style: TextStyle(
              fontSize: 12,
              fontFamily: "Montserrat",
            ),
          ),
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            if (width >= 500)
              mainMenuButton(
                "Let's Talk",
                width: 150,
                fontSize: 14,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ContactUsServiceDialog(
                          message: 'Want To Talk');
                    },
                  );
                },
              ),
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
                  width: 110,
                  backgroundColor: "#002366",
                  borderRadius: 20,
                  leftMargin: 0,
                  textColor: "#FFFFFF",
                  fontSize: 12,
                  bottomMargin: 0,
                  rightMargin: 0,
                  topMargin: 0),
            SizedBox(width: width > 500 ? 50 : 20),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ContactUsServiceDialog(
                          message: 'Need Free Consultancy');
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Text("Free Consulatancy",
                          style: TextStyle(
                            fontSize: width > 500 ? 14 : 12,
                            fontFamily: "Montserrat",
                          )),
                      const SizedBox(width: 15),
                      Image.asset(
                        "assets/images/arrow_left.png",
                        width: width > 500 ? 20 : 10,
                      )
                    ],
                  ),
                ))
          ],
        )
      ],
    );
  }
}
