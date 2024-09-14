import 'package:flutter/material.dart';
import 'package:speeder_website/utills/consts.dart';
import 'package:speeder_website/utills/utils.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<StatefulWidget> createState() {
    return AboutUsState();
  }
}

class AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        if (width > 1360) const WebViewAboutUs(),
        if (width <= 1360)
          const Align(
            alignment: Alignment.topLeft,
            child: MobViewAboutUs(),
          ),
      ],
    );
  }
}

class WebViewAboutUs extends StatefulWidget {
  const WebViewAboutUs({super.key});

  @override
  State<StatefulWidget> createState() {
    return WebViewAboutUsState();
  }
}

class WebViewAboutUsState extends State<WebViewAboutUs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(100, 40, 100, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                aboutSpeeder,
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: "Montserrat",
                    color: hexToColor("#212C62")),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: const Text(
                    aboutSpeederDescription,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, fontFamily: "Montserrat"),
                  )),
              const SizedBox(
                height: 50,
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 1800),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Our Mission",
                            style: TextStyle(
                                fontSize: 28,
                                fontFamily: "Montserrat",
                                color: hexToColor("#212C62")),
                          ),
                          const SizedBox(height: 15),
                          const Text(ourMission,
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Montserrat",
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(width: 150),
                    imageContainer(1, 'assets/images/about_img.png')
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 1800),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    imageContainer(0, 'assets/images/founder_pic.png'),
                    const SizedBox(width: 150),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Founder & CEO",
                            style: TextStyle(
                                fontSize: 28,
                                fontFamily: "Montserrat",
                                color: hexToColor("#212C62")),
                          ),
                          const SizedBox(height: 15),
                          const Text(founderText,
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Montserrat",
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.all(40),
          width: double.infinity,
          color: hexToColor("#F8F8FA"),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "About Us Speeder Creatives ",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Montserrat",
                    color: hexToColor("#212C62")),
              ),
              const SizedBox(height: 10),
              Container(
                constraints: const BoxConstraints(maxWidth: 800),
                child: const Text(
                  aboutUsSpeederCreative,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 60,
        )
      ],
    );
  }
}

class MobViewAboutUs extends StatefulWidget {
  const MobViewAboutUs({super.key});

  @override
  State<StatefulWidget> createState() {
    return MobViewAboutUsState();
  }
}

class MobViewAboutUsState extends State<MobViewAboutUs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  aboutSpeeder,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Montserrat",
                      color: hexToColor("#212C62")),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  aboutSpeederDescription,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 13, fontFamily: "Montserrat"),
                ),
                const SizedBox(height: 30),
                Text(
                  "Our Mission",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Montserrat",
                      color: hexToColor("#212C62")),
                ),
                const SizedBox(
                  height: 15,
                ),
                imageContainer(0, 'assets/images/about_img.png'),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  ourMissionDescription,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Founder & CEO",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Montserrat",
                      color: hexToColor("#212C62")),
                ),
                const SizedBox(
                  height: 15,
                ),
                imageContainer(0, 'assets/images/founder_pic.png'),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  founderDescription,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 13,
                  ),
                ),
              ]),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
          width: double.infinity,
          color: hexToColor("#F8F8FA"),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About Us Speeder Creatives ",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Montserrat",
                    color: hexToColor("#212C62")),
              ),
              const SizedBox(height: 10),
              const Text(
                aboutUsSpeederCreative,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

Widget imageContainer(int i, String image) {
  return Container(
    constraints: const BoxConstraints(maxWidth: 400),
    child: Stack(
      children: [
        Container(
          margin: i == 0
              ? const EdgeInsets.only(right: 35)
              : const EdgeInsets.only(left: 35),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: hexToColor("#D9D9D9"),
          ),
          child: ClipRRect(
            // Clip the image to respect the container's border radius
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              image,
              fit: BoxFit
                  .fill, // Fit the image inside the container without distortion
            ),
          ),
        ),
      ],
    ),
  );
}
