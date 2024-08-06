import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/common_widget.dart';
import 'package:speeder_website/Utills/consts.dart';
import 'package:speeder_website/Utills/utils.dart';
import 'package:speeder_website/responsive/responsive.dart';

class OurServices extends StatefulWidget {
  const OurServices({super.key});

  @override
  State<StatefulWidget> createState() {
    return OurServicesState();
  }
}

class OurServicesState extends State<OurServices> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        if (width > 1200) const SizedBox(height: 40),
        Text(
          "Our Services",
          style: TextStyle(
              fontSize: 28,
              fontFamily: "Montserrat",
              color: hexToColor("#212C62")),
        ),
        Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            padding: const EdgeInsets.all(20),
            child: const Text(
              ourServicesText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, fontFamily: "Montserrat"),
            )),
        if (Responsive.isDesktop(context)) const WebOurServices(),
        if (!Responsive.isDesktop(context)) const MobOurServices()
      ],
    );
  }
}

class WebOurServices extends StatefulWidget {
  const WebOurServices({super.key});

  @override
  State<StatefulWidget> createState() {
    return WebOurServicesState();
  }
}

class WebOurServicesState extends State<WebOurServices> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [WebOurServicesGrid()],
    );
  }
}

class MobOurServices extends StatefulWidget {
  const MobOurServices({super.key});

  @override
  State<StatefulWidget> createState() {
    return MobOurServicesState();
  }
}

class MobOurServicesState extends State<MobOurServices> {
  @override
  Widget build(BuildContext context) {
    return const MobOurServicesGrid();
  }
}

class WebOurServicesGrid extends StatefulWidget {
  const WebOurServicesGrid({super.key});

  @override
  State<StatefulWidget> createState() {
    return WebOurServicesGridState();
  }
}

class WebOurServicesGridState extends State<WebOurServicesGrid> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.fromLTRB(
          80 / mockupWebWidth * width,
          30 / mockupWebWidth * width,
          80 / mockupWebWidth * width,
          30 / mockupWebWidth * width),
      constraints: const BoxConstraints(maxWidth: 1600),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width > 1200 ? 3 : 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1.3),
          itemCount: gridMap.length,
          itemBuilder: (context, index) {
            return ourServicesGrid(gridMap, index, context);
          }),
    );
  }
}

class MobOurServicesGrid extends StatefulWidget {
  const MobOurServicesGrid({super.key});

  @override
  State<StatefulWidget> createState() {
    return MobOurServicesGridState();
  }
}

class MobOurServicesGridState extends State<MobOurServicesGrid> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(maxWidth: 1600),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: width > 670 ? 2 : 1,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1.3,
        ),
        itemCount: gridMap.length,
        itemBuilder: (context, index) {
          return ourServicesGrid(gridMap, index, context);
        },
      ),
    );
  }
}

Widget ourServicesGrid(
    List<Map<String, dynamic>> gridMap, int index, BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return HoverWidget(
    builder: (isHovered) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: isHovered ? Colors.grey.withOpacity(0.2) : Colors.transparent,
        ),
        child: PhysicalModel(
          color: Colors.transparent,
          elevation: isHovered ? 25 : 0,
          child: Container(
            padding: EdgeInsets.all(20 / mockupWebWidth * width),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: isHovered ? Colors.white : hexToColor("#DDDDDD"),
              ),
              color: hexToColor("#fef7ff"),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Use Image.asset since your images are local assets
                Image.asset(
                  gridMap[index]['image'], // Remove string interpolation here
                  width: 75 / mockupWebWidth * width,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Text(
                        'Image not found'); // Handle error gracefully
                  },
                ),
                SizedBox(height: 20 / mockupWebWidth * width),
                Text(
                  gridMap[index]['title'], // Remove string interpolation here
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10 / mockupWebWidth * width),
                Text(
                  gridMap[index]
                      ['description'], // Remove string interpolation here
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 15 / mockupWebWidth * width),
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Learn More",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Image.asset(
                        "assets/images/learn_more.png",
                        width: 15,
                      ),
                    ],
                  ),
                  onTap: () {
                    // Implement the onTap logic here
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
