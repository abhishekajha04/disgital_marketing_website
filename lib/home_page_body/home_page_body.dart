import 'package:flutter/material.dart';
import 'package:speeder_website/home_page_body/contact_section/contact_section.dart';
import 'package:speeder_website/home_page_body/features_section/feature_section.dart';
import 'package:speeder_website/home_page_body/hero_section/hero_section.dart';
import 'package:speeder_website/home_page_body/our_portfolio/our_portfolio.dart';
import 'package:speeder_website/home_page_body/services_section/service_section.dart';
import 'package:speeder_website/home_page_body/speader_creative/speader_creative.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageBodyState();
  }
}

class HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomePageHeroSection(),
        FeatureSection(),
        ServiceSection(),
        SpeaderCreative(),
        OurPortfolioSection(),
        ContactUsSection()
      ],
    );
  }
}
