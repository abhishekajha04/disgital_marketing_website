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
        PriceExpansion(
          heading: "Business Website Development",
          iconDirectionFlag: 0,
          label1: "Informative",
          price1: "₹9,999",
          description1: "Perfect for Entrepreneurs",
          label2: "E-Commerce",
          price2: "₹14,999",
          description2: "Perfect for Entrepreneurs",
          label3: "Customized",
          price3: "Contact Us",
          description3: "Perfect for Entrepreneurs",
          expandedHeight: 1150,
          data1: priceDetails2,
          data2: priceDetails1,
          data3: priceDetails,
        ),
        PriceExpansion(
          heading: "Brand Book",
          iconDirectionFlag: 1,
          label1: "Silver",
          price1: "₹14,999",
          description1: "Perfect for Entrepreneurs",
          label2: "Gold",
          price2: "₹19,999",
          description2: "Perfect for Entrepreneurs",
          label3: "Primimum",
          price3: "₹29,999",
          description3: "Perfect for Entrepreneurs",
          expandedHeight: 800,
          data1: brandBookPriceDetails,
          data2: brandBookPriceDetails0,
          data3: brandBookPriceDetails1,
        ),
        PriceExpansion(
          heading: "SEO",
          iconDirectionFlag: 0,
          label1: "Silver",
          price1: "₹19,999",
          description1: "Perfect for Entrepreneurs",
          label2: "Gold",
          price2: "₹26,999",
          description2: "Perfect for Entrepreneurs",
          label3: "Premimum",
          price3: "₹34,999",
          description3: "Perfect for Entrepreneurs",
          expandedHeight: 1175,
          data1: seoDetails,
          data2: seoDetails0,
          data3: seoDetails1,
        ),
        PriceExpansion(
          heading: "Performance Marketing",
          iconDirectionFlag: 1,
          label1: "Silver",
          price1: "₹14,999",
          description1: "Perfect for Entrepreneurs",
          label2: "Gold",
          price2: "₹24,999",
          description2: "Perfect for Entrepreneurs",
          label3: "Premium",
          price3: "₹39,999",
          description3: "Perfect for Entrepreneurs",
          expandedHeight: 750,
          data1: perMarPriceDetails,
          data2: perMarPriceDetails0,
          data3: perMarPriceDetails1,
        ),
        PriceExpansion(
          heading: "Social Media Marketing",
          iconDirectionFlag: 0,
          label1: "Silver",
          price1: "₹14,999",
          description1: "Perfect for Entrepreneurs",
          label2: "Gold",
          price2: "₹19,999",
          description2: "Perfect for Entrepreneurs",
          label3: "Premium",
          price3: "₹29,999",
          description3: "Perfect for Entrepreneurs",
          expandedHeight: 800,
          data1: socialMediaDetails,
          data2: socialMediaDetails0,
          data3: socialMediaDetails1,
        )
      ],
    );
  }
}

class PriceExpansion extends StatefulWidget {
  final String heading;
  final int iconDirectionFlag;
  final String label1;
  final String price1;
  final String label2;
  final String price2;
  final String label3;
  final String price3;
  final double expandedHeight;
  final String description1;
  final String description2;

  final String description3;

  final List<Map<String, dynamic>> data1;
  final List<Map<String, dynamic>> data2;
  final List<Map<String, dynamic>> data3;
  const PriceExpansion(
      {super.key,
      required this.heading,
      required this.iconDirectionFlag,
      required this.label1,
      required this.description1,
      required this.price2,
      required this.label2,
      required this.description2,
      required this.price3,
      required this.label3,
      required this.description3,
      required this.price1,
      required this.expandedHeight,
      required this.data1,
      required this.data2,
      required this.data3});

  @override
  State<StatefulWidget> createState() {
    return PriceExpansionState();
  }
}

class PriceExpansionState extends State<PriceExpansion> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.iconDirectionFlag == 0)
              Image.asset(
                "assets/images/arrow_curve.png",
                width: 60,
              ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                widget.heading,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Montserrat",
                  color: hexToColor("#212C62"),
                ),
              ),
            ),
            if (widget.iconDirectionFlag == 1)
              Image.asset(
                "assets/images/left_arrow.png",
                width: 60,
              )
          ],
        ),
        if (Responsive.isDesktop(context))
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Row(
              children: [
                Expanded(
                  child: PriceDetailsContainer(
                    isExpanded: _isExpanded,
                    label: widget.label1,
                    price: widget.price1,
                    description: widget.description1,
                    expandedHeight: widget.expandedHeight,
                    data: widget.data1,
                  ),
                ),
                Expanded(
                  child: PriceDetailsContainer(
                    isExpanded: _isExpanded,
                    label: widget.label2,
                    price: widget.price2,
                    description: widget.description2,
                    expandedHeight: widget.expandedHeight,
                    data: widget.data2,
                  ),
                ),
                Expanded(
                  child: PriceDetailsContainer(
                    isExpanded: _isExpanded,
                    label: widget.label3,
                    price: widget.price3,
                    description: widget.description3,
                    expandedHeight: widget.expandedHeight,
                    data: widget.data3,
                  ),
                ),
              ],
            ),
          ),
        if (!Responsive.isDesktop(context))
          Column(
            children: [
              PriceDetailsContainer(
                isExpanded: _isExpanded,
                label: widget.label1,
                price: widget.price1,
                description: widget.description1,
                expandedHeight: widget.expandedHeight,
                data: widget.data1,
              ),
              PriceDetailsContainer(
                isExpanded: _isExpanded,
                label: widget.label2,
                price: widget.price2,
                description: widget.description2,
                expandedHeight: widget.expandedHeight,
                data: widget.data2,
              ),
              PriceDetailsContainer(
                isExpanded: _isExpanded,
                label: widget.label3,
                price: widget.price3,
                description: widget.description3,
                expandedHeight: widget.expandedHeight,
                data: widget.data3,
              ),
            ],
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
}

class PriceDetailsContainer extends StatefulWidget {
  final bool isExpanded;
  final String label;
  final String price;
  final double expandedHeight;
  final String description;
  final List<Map<String, dynamic>> data;
  const PriceDetailsContainer(
      {super.key,
      required this.isExpanded,
      required this.label,
      required this.description,
      required this.price,
      required this.expandedHeight,
      required this.data});

  @override
  State<StatefulWidget> createState() {
    return PriceDetailsContainerState();
  }
}

class PriceDetailsContainerState extends State<PriceDetailsContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: widget.isExpanded ? widget.expandedHeight : 170,
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: hexToColor("#FFFFFF"),
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
        mainAxisAlignment: widget.isExpanded
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          nonExpandedDetails(
            widget.label,
            widget.price,
            widget.description,
          ),
          if (widget.isExpanded)
            Container(
                height: 1,
                margin: const EdgeInsets.only(top: 15, bottom: 10),
                width: double.infinity,
                color: hexToColor("#D7CFCF")),
          if (widget.isExpanded)
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.data.length,
                itemBuilder: (context, index) {
                  return priceText(widget.data[index]);
                },
              ),
            )
        ],
      ),
    );
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
          if (iconType != 3) const SizedBox(width: 15),
          Expanded(
            child: Text(
              description,
              style: TextStyle(
                  fontSize: iconType != 3 ? 14 : 16,
                  fontFamily: "Montserrat",
                  fontWeight:
                      iconType != 3 ? FontWeight.normal : FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
