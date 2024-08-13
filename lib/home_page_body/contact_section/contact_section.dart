import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/common_widget.dart';
import 'package:speeder_website/Utills/consts.dart';
import 'package:speeder_website/Utills/utils.dart';

class ContactUsSection extends StatefulWidget {
  const ContactUsSection({super.key});

  @override
  State<StatefulWidget> createState() {
    return ContactUsSectionState();
  }
}

class ContactUsSectionState extends State<ContactUsSection> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        if (width >= 650)
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            padding: const EdgeInsets.only(
                top: 100, bottom: 50, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                contactDetails(context),
                const SizedBox(width: 80),
                Expanded(child: Container()),
                fillContact(context)
              ],
            ),
          ),
        if (width < 650)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              children: [
                contactDetails(context),
                const SizedBox(height: 40),
                fillContact(context)
              ],
            ),
          ),
        const SendEmailSection()
      ],
    );
  }
}

class SendEmailSection extends StatelessWidget {
  const SendEmailSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 40, bottom: 40),
      padding: EdgeInsets.fromLTRB(width > 500 ? 50 : 20, width > 500 ? 40 : 20,
          width > 500 ? 50 : 20, width > 500 ? 40 : 20),
      color: hexToColor("#164DAE"),
      child: Column(
        children: [
          if (width <= 900)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                contactText(context),
                const SizedBox(height: 20),
                sendEmail()
              ],
            ),
          if (width > 900)
            Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Row(
                children: [
                  Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: contactText(context)),
                  SizedBox(width: 200 * width / mockupWebWidth),
                  Expanded(child: sendEmail())
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget contactText(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact Us",
          style: TextStyle(
              color: hexToColor("#FFFFFF"),
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w500,
              fontSize: width > 500 ? 38 : 24),
        ),
        const SizedBox(height: 5),
        Text(
          contactUsText,
          style: TextStyle(
              color: hexToColor("#FFFFFF"),
              fontFamily: "Montserrat",
              fontSize: 12),
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
      ],
    );
  }

  Widget sendEmail() {
    return Container(
      height: 80,
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: hexToColor("#FFFFFF"),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 5),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Your Email",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontFamily: "Montserrat",
                  fontSize: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 1.5,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              style: const TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 5),
          buildButton(
            "Send",
            () {},
            leftMargin: 10,
            backgroundColor: "#164DAE",
            fontSize: 14,
            textColor: "#FFFFFF",
            rightMargin: 0,
            topMargin: 10,
            bottomMargin: 10,
            width: 100,
            height: double.infinity,
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}

Widget contactDetails(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return SizedBox(
      height: 300,
      width: width > 650 ? 450 : double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact US',
            style: TextStyle(
                fontSize: 28,
                fontFamily: 'Montserrat',
                color: hexToColor('#212C62')),
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/b1.png',
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Flexible(
                child: Text(
                  'Pune, Autadwadi Handewadi, Maharashtra 411028 \nSimplicity 304 Hadapsar',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/b2.png',
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Flexible(
                child: Text(
                  '+91 9637903345',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/b3.png',
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Flexible(
                child: Text(
                  'info@speedercreative.com',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/b4.png',
                height: 30,
                width: 30,
              ),
              const SizedBox(width: 20),
              Image.asset(
                'assets/images/b5.png',
                height: 30,
                width: 30,
              ),
              const SizedBox(width: 10),
              Image.asset(
                'assets/images/b6.png',
                height: 30,
                width: 30,
              ),
              const SizedBox(width: 10),
              Image.asset(
                'assets/images/b7.png',
                height: 30,
                width: 30,
              ),
            ],
          )
        ],
      ));
}

Widget fillContact(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5), // Shadow color
          spreadRadius: 2, // Spread radius
          blurRadius: 2, // Blur radius
          offset: const Offset(0, 1), // Offset of the shadow
        ),
      ],
      borderRadius: BorderRadius.circular(15),
    ),
    height: 400,
    width: width > 650 ? 500 : double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(child: textField("First Name")),
                const SizedBox(width: 20), // Add space between text fields
                Expanded(child: textField("Last Name")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: textField("Email"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                    child: SizedBox(
                  height: 100,
                  child: TextField(
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: hexToColor('#F3F8FF'),
                      hintText: "Message",
                      hintStyle: TextStyle(
                        color: hexToColor('#5F5C5C'),
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                      ),
                      labelText: "Message",
                      labelStyle: TextStyle(
                        color: hexToColor('#5F5C5C'),
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                )),
                const SizedBox(width: 20), // Add space between text fields
              ],
            ),
          ),
          buildButton("SEND", () {},
              height: 45,
              width: 150,
              backgroundColor: "#9FFF00",
              borderRadius: 15,
              leftMargin: 0,
              textColor: "#FFFFFF",
              fontSize: 14,
              bottomMargin: 0,
              rightMargin: 0,
              topMargin: 20),
        ],
      ),
    ),
  );
}

Widget textField(String label) {
  return TextField(
    decoration: InputDecoration(
      filled: true, // Fill the TextField with a color
      isCollapsed: false,
      fillColor: hexToColor('#F3F8FF'),
      hintText: label,
      hintStyle: TextStyle(
        color: hexToColor('#5F5C5C'),
        fontSize: 14,
        fontFamily: 'Montserrat',
      ),
      labelText: label,
      labelStyle: TextStyle(
        color: hexToColor('#5F5C5C'),
        fontSize: 14,
        fontFamily: 'Montserrat',
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none, // Border colo
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
