import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/utils.dart';
import 'package:speeder_website/responsive/responsive.dart';
import 'package:speeder_website/utills/common_widget.dart';
import 'package:speeder_website/utills/consts.dart';

class Pricing extends StatefulWidget {
  const Pricing({super.key});

  @override
  State<StatefulWidget> createState() {
    return PricingState();
  }
}

class PricingState extends State<Pricing> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Our Best Pricing",
          style: TextStyle(
              fontSize: 28,
              fontFamily: "Montserrat",
              color: hexToColor("#212C62")),
        ),
        Container(
            constraints: const BoxConstraints(maxWidth: 800),
            padding: const EdgeInsets.all(20),
            child: const Text(
              pricingText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, fontFamily: "Montserrat"),
            )),
        if (Responsive.isDesktop(context)) const WebPricing(),
        if (!Responsive.isDesktop(context)) const MobPricing()
      ],
    );
  }
}

class WebPricing extends StatefulWidget {
  const WebPricing({super.key});

  @override
  State<StatefulWidget> createState() {
    return WebPricingState();
  }
}

class WebPricingState extends State<WebPricing> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [WebPriceExpansion()],
    );
  }
}

class MobPricing extends StatefulWidget {
  const MobPricing({super.key});

  @override
  State<StatefulWidget> createState() {
    return MobPricingState();
  }
}

class MobPricingState extends State<MobPricing> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [],
    );
  }
}

class WebPriceExpansion extends StatefulWidget {
  const WebPriceExpansion({super.key});

  @override
  State<StatefulWidget> createState() {
    return WebPriceExpansionState();
  }
}

class WebPriceExpansionState extends State<WebPriceExpansion> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/arrow_curve.png",
              width: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                "Business Website Development",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Montserrat",
                  color: hexToColor("#212C62"),
                ),
              ),
            ),
            // Image.asset(
            //   "assets/images/left_arrow.png",
            //   width: 60,
            // )
          ],
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            children: [
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _isExpanded ? 1150 : 170,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: hexToColor("#fef7ff"),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: _isExpanded
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      nonExpandedDetails(
                        "Informative",
                        "₹9,999",
                        "Perfect for Entrepreneurs",
                      ),
                      if (_isExpanded)
                        Container(
                            height: 1,
                            margin: const EdgeInsets.only(top: 15, bottom: 10),
                            width: double.infinity,
                            color: hexToColor("#D7CFCF")),
                      if (_isExpanded)
                        Expanded(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: priceDetails2.length,
                            itemBuilder: (context, index) {
                              return priceText(priceDetails2[index]);
                            },
                          ),
                        )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _isExpanded ? 1150 : 170,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: hexToColor("#fef7ff"),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: _isExpanded
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      nonExpandedDetails(
                        "E-commerce",
                        "₹14,999",
                        "Perfect for Entrepreneurs",
                      ),
                      if (_isExpanded)
                        Container(
                            height: 1,
                            margin: const EdgeInsets.only(top: 15, bottom: 10),
                            width: double.infinity,
                            color: hexToColor("#D7CFCF")),
                      if (_isExpanded)
                        Expanded(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: priceDetails1.length,
                            itemBuilder: (context, index) {
                              return priceText(priceDetails1[index]);
                            },
                          ),
                        )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _isExpanded ? 1150 : 170,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: hexToColor("#fef7ff"),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: _isExpanded
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      nonExpandedDetails(
                        "Customized",
                        "Contact Us",
                        "Perfect for Entrepreneurs",
                      ),
                      if (_isExpanded)
                        Container(
                            height: 1,
                            margin: const EdgeInsets.only(top: 15, bottom: 10),
                            width: double.infinity,
                            color: hexToColor("#D7CFCF")),
                      if (_isExpanded)
                        Expanded(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: priceDetails.length,
                            itemBuilder: (context, index) {
                              return priceText(priceDetails[index]);
                            },
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        buildButton(
          _isExpanded ? "Hide Full Details" : "View Full Details",
          _toggleExpansion, // Call the toggle function
          height: 50,
          width: 200,
          topMargin: 15,
          bottomMargin: 40,
          fontSize: 12,
          textColor: "#FFFFFF",
          backgroundColor: "#164DAE",
          leftMargin: 0,
          rightMargin: 0,
        ),
        Container(
          height: 1,
          constraints: const BoxConstraints(maxWidth: 1200),
          margin: const EdgeInsets.only(bottom: 25),
          width: double.infinity,
          color: hexToColor("#D7CFCF"),
        )
      ],
    );
  }

  // Toggle the expansion state
  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  Widget nonExpandedDetails(String text, String price, String details) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 25,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(
                8,
              ))),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  fontFamily: "Montserrat", fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          price,
          style: const TextStyle(
              fontSize: 22,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          details,
          style: const TextStyle(
              fontSize: 14,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.normal),
        )
      ],
    );
  }

  Widget priceText(Map<String, dynamic> data) {
    int iconType = data['iconType'] as int;
    String description = data['description'] as String;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (iconType == 0)
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Image.asset("assets/images/tick_mark.png", width: 15),
            ),
          if (iconType == 1)
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Image.asset("assets/images/cross_mark.png", width: 15),
            ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.normal),
            ),
          )
        ],
      ),
    );
  }
}
