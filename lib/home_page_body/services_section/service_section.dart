import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/consts.dart';
import 'package:speeder_website/Utills/utils.dart';
import 'package:speeder_website/responsive/responsive.dart';

class ServiceSection extends StatefulWidget {
  const ServiceSection({super.key});
  @override
  State<StatefulWidget> createState() {
    return ServiceSectionState();
  }
}

class ServiceSectionState extends State<ServiceSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Responsive.isDesktop(context)) const WebServiceSection(),
        if (!Responsive.isDesktop(context)) const WebServiceSection()
      ],
    );
  }
}

class WebServiceSection extends StatefulWidget {
  const WebServiceSection({super.key});
  @override
  State<StatefulWidget> createState() {
    return WebServiceSectionState();
  }
}

class WebServiceSectionState extends State<WebServiceSection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 550),
          width: double.infinity,
          height: 300,
          color: hexToColor("#F3F8FF"),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(top: 120),
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 150.0),
                    child: AllServicesSection(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Learn More",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        width: 100,
                        height: 1,
                        color: hexToColor("#212C62"),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "What We Do",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Diving a Better way of \ndoing Marketing",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Montserrat",
                                  color: hexToColor("#212C62")),
                            )
                          ],
                        ),
                        const SizedBox(width: 30),
                        Flexible(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 500),
                                padding: const EdgeInsets.only(left: 20),
                                child: const Text(servicesTest,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w400))),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MobServiceSection extends StatefulWidget {
  const MobServiceSection({super.key});
  @override
  State<StatefulWidget> createState() {
    return MobServiceSectionState();
  }
}

class MobServiceSectionState extends State<MobServiceSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                const Text(
                  "What We Doing",
                  style: TextStyle(fontSize: 12, fontFamily: "Montserrat"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Diving a Better way of \ndoing Marketing",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Montserrat",
                      color: hexToColor("#212C62")),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class AllServicesSection extends StatefulWidget {
  const AllServicesSection({super.key});
  @override
  State<StatefulWidget> createState() {
    return AllServicesSectionState();
  }
}

int currentIndex = 0;

class AllServicesSectionState extends State<AllServicesSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: 1050,
      height: 450,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        color: hexToColor("#212C62"),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 450,
              width: 700,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                color: hexToColor("#F3F8FF"),
              ),
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(75, 100, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                services[currentIndex].description,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: hexToColor("#212C62"),
                                  fontFamily: "Montserrat",
                                ),
                              ),
                              const SizedBox(height: 10),
                              listText(services[currentIndex].s1),
                              listText(services[currentIndex].s2),
                              listText(services[currentIndex].s3),
                              listText(services[currentIndex].s4),
                              listText(services[currentIndex].s5),
                              const SizedBox(height: 15),
                              const Text(
                                "Learn More",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                ),
                              ),
                              Container(
                                width: 85,
                                height: 1,
                                color: hexToColor("#212C62"),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 230,
                          height: 300,
                          margin: const EdgeInsets.only(top: 65, right: 20),
                          decoration: BoxDecoration(
                            color: hexToColor("#FFFFFF"),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.2), // Shadow color
                                spreadRadius: 5, // Spread radius
                                blurRadius: 7, // Blur radius
                                offset: const Offset(0, 3), // Shadow position
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 125.0,
                                    height: 125.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: hexToColor("#212C62")),
                                      color: Colors.white, // Fill color
                                      shape: BoxShape.circle, // Circular shape
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          services[currentIndex].percentage,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: "Montserrat",
                                              color: hexToColor("#212C62"),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(height: 10),
                                        Image.asset(
                                          "assets/images/arrow.png",
                                          width: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  const Text(
                                    "We redefine success with bespoke services, from eye-catching Branding.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                button(0, "Branding"),
                button(1, "Social Media Management"),
                button(2, "Application Development"),
                button(3, "Free Service")
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget listText(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Image.asset(
            "assets/images/tick.png",
            width: 15,
            height: 15,
          ),
          const SizedBox(width: 20),
          Text(
            label,
            style: const TextStyle(
              fontFamily: "Montserrat",
            ),
          )
        ],
      ),
    );
  }

  Widget button(int buttonIndex, String label) {
    return Container(
      height: 75,
      width: 380,
      decoration: BoxDecoration(
        color: currentIndex == buttonIndex
            ? hexToColor("#FFFFFF")
            : Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = buttonIndex;
                });
              },
              child: Text(
                label,
                style: TextStyle(
                    fontSize: 16,
                    color: currentIndex == buttonIndex
                        ? hexToColor("#212C62")
                        : Colors.white,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const Spacer(flex: 1),
          if (currentIndex == buttonIndex)
            Container(
              width: 55,
              height: 55,
              margin: const EdgeInsets.only(right: 15),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: hexToColor("#212C62"),
                  borderRadius: const BorderRadius.all(Radius.circular(55))),
              child: Image.asset("assets/images/white_right_arrow.png"),
            )
        ],
      ),
    );
  }
}
