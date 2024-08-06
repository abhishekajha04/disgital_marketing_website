import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/utils.dart';
import 'package:speeder_website/responsive/responsive.dart';
import 'package:speeder_website/utills/consts.dart';

class Footer extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  const Footer(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  State<StatefulWidget> createState() {
    return FooterState();
  }
}

class FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Responsive.isDesktop(context))
          WebFooter(
            onItemTapped: widget.onItemTapped,
          ),
        if (!Responsive.isDesktop(context))
          MobFooter(
            onItemTapped: widget.onItemTapped,
          )
      ],
    );
  }
}

class MobFooter extends StatefulWidget {
  final Function(int) onItemTapped;
  const MobFooter({super.key, required this.onItemTapped});

  @override
  State<StatefulWidget> createState() {
    return MobFooterState();
  }
}

class MobFooterState extends State<MobFooter> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: width <= 500 ? 1000 : 780,
      color: hexToColor("#002366"),
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          speederDetails(i: 1),
          const SizedBox(height: 20),
          quickLinks(widget.onItemTapped, i: 1),
          const SizedBox(height: 20),
          ourExpertise(context),
          const SizedBox(height: 20),
          contactDetails()
        ],
      ),
    );
  }
}

class WebFooter extends StatefulWidget {
  final Function(int) onItemTapped;
  const WebFooter({super.key, required this.onItemTapped});

  @override
  State<StatefulWidget> createState() {
    return WebFooterState();
  }
}

class WebFooterState extends State<WebFooter> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      color: hexToColor("#002366"),
      padding: EdgeInsets.fromLTRB(
        40 * mockupWebWidth / width,
        50 * mockupWebWidth / width,
        40 * mockupWebWidth / width,
        50 * mockupWebWidth / width,
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1500),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                flex: 1, // Equal space allocation
                child: Align(
                    alignment: Alignment.center,
                    child: Expanded(
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: speederDetails())))),
            SizedBox(width: 0.03 * width), // Dynamically sized space
            Flexible(
                flex: 1, // Equal space allocation
                child: quickLinks(widget.onItemTapped)),
            SizedBox(width: 0.03 * width), // Dynamically sized space
            ourExpertise(context),
            SizedBox(width: 0.03 * width), // Dynamically sized space
            Flexible(
                flex: 1, // Equal space allocation
                child: contactDetails()),
          ],
        ),
      ),
    );
  }
}

Widget quickLinks(final Function(int) onItemTapped, {int i = 0}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textStyle("Quick Links", fontsize: 18, padding: 20),
      if (i == 0)
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                onItemTapped(0);
              },
              child: textStyle("Home"),
            ),
            GestureDetector(
                onTap: () {
                  onItemTapped(1);
                },
                child: textStyle("About Us")),
            GestureDetector(
                onTap: () {
                  onItemTapped(5);
                },
                child: textStyle("Blog")),
            GestureDetector(
                onTap: () {
                  onItemTapped(2);
                },
                child: textStyle("FAQ's")),
            GestureDetector(
                onTap: () {
                  onItemTapped(3);
                },
                child: textStyle("Pricing")),
            GestureDetector(
                onTap: () {
                  onItemTapped(4);
                },
                child: textStyle("Contact")),
          ],
        ),
      if (i == 1)
        Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    onItemTapped(0);
                  },
                  child: textStyle("Home"),
                ),
                const SizedBox(width: 50),
                GestureDetector(
                    onTap: () {
                      onItemTapped(1);
                    },
                    child: textStyle("About Us")),
                const SizedBox(width: 50),
                GestureDetector(
                    onTap: () {
                      onItemTapped(5);
                    },
                    child: textStyle("Blog")),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      onItemTapped(2);
                    },
                    child: textStyle("FAQ's")),
                const SizedBox(width: 52),
                GestureDetector(
                    onTap: () {
                      onItemTapped(3);
                    },
                    child: textStyle("Pricing")),
                const SizedBox(width: 65),
                GestureDetector(
                    onTap: () {
                      onItemTapped(4);
                    },
                    child: textStyle("Contact")),
              ],
            ),
          ],
        )
    ],
  );
}

Widget ourExpertise(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textStyle("Our Expertise",
          fontsize: 18, padding: 20), // Changed header text
      if (width >= 500)
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textStyle("Performance Marketing"),
                textStyle("E-Commerce Solutions"),
                textStyle("Search Engine Optimization"),
                textStyle("Full API Integration"),
                textStyle("Influencer Marketing"),
                textStyle("Public Relations"),
              ],
            ),
            const SizedBox(width: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textStyle("Website Development"),
                textStyle("Graphic Design"),
                textStyle("Social Media"),
                textStyle("Business Development"),
                textStyle("Google AdWords"), // Fixed typo in "Adwords"
                textStyle("Content Writing"),
              ],
            ),
          ],
        ),
      if (width < 500)
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textStyle("Performance Marketing"),
            textStyle("E-Commerce Solutions"),
            textStyle("Search Engine Optimization"),
            textStyle("Full API Integration"),
            textStyle("Influencer Marketing"),
            textStyle("Public Relations"),
            textStyle("Website Development"),
            textStyle("Graphic Design"),
            textStyle("Social Media"),
            textStyle("Business Development"),
            textStyle("Google AdWords"), // Fixed typo in "Adwords"
            textStyle("Content Writing"),
          ],
        )
    ],
  );
}

Widget contactDetails() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textStyle("Contact Details",
          fontsize: 18, padding: 20), // Changed header text
      textStyle(
          "Pune, Maharashtra Handewadi Hadapsar \nsimplicity Apartment Pin code 411028 ",
          padding: 10),
      textStyle("Contact +91 9637903345", padding: 10),
      textStyle("Mail: speeder.solution@gmail.com")
    ],
  );
}

Widget speederDetails({int i = 0}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 35),
      Image.asset("assets/images/speeder_logo.png", height: 25),
      const SizedBox(height: 30),
      Container(
        constraints: BoxConstraints(maxWidth: i == 0 ? 250 : 1000),
        child:
            textStyle(footerText, padding: 0), // Ensure footerText is defined
      )
    ],
  );
}

Widget textStyle(String text, {double fontsize = 14, double padding = 10}) {
  return Padding(
    padding: EdgeInsets.only(bottom: padding),
    child: Text(text,
        style: TextStyle(
            fontSize: fontsize,
            color: hexToColor("#FFFFFF"),
            fontFamily: "Montserrat")),
  );
}
