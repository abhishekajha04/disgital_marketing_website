import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/utils.dart';
import 'package:speeder_website/about_us/about_us_page.dart';
import 'package:speeder_website/contact_us/contact_us.dart';
import 'package:speeder_website/footer/footer.dart';
import 'package:speeder_website/home_page_body/home_page_body.dart';
import 'package:speeder_website/our_services/our_services.dart';
import 'package:speeder_website/pricing/pricing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor("#FFFFFF"),
      body: SafeArea(
        child: Column(
          children: [
            const ContactSection(),
            HomePageHeader(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _getScreens(),
                    Footer(
                        selectedIndex: _selectedIndex,
                        onItemTapped: _onItemTapped)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getScreens() {
    switch (_selectedIndex) {
      case 0:
        return const HomePageBody();
      case 1:
        return const AboutUs();
      case 2:
        return const OurServices();
      case 3:
        return const Pricing();
      case 4:
        return const ContactUs();
      default:
        return const HomePageBody();
    }
  }
}

class HomePageHeader extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const HomePageHeader({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<StatefulWidget> createState() {
    return HomePageHeaderState();
  }
}

class HomePageHeaderState extends State<HomePageHeader> {
  bool _isMenuExpanded = false;
  void _toggleMenu() {
    setState(() {
      _isMenuExpanded = !_isMenuExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 60,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      EdgeInsets.fromLTRB(width > 600 ? 100 : 15, 20, 10, 0),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 100,
                  ),
                ),
              ),
              if (width > 1200)
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MenuText(
                        text: "Home",
                        selectedIndex: widget.selectedIndex,
                        index: 0,
                        onItemTapped: widget.onItemTapped,
                      ),
                      MenuText(
                        text: "About Us",
                        selectedIndex: widget.selectedIndex,
                        index: 1,
                        onItemTapped: widget.onItemTapped,
                      ),
                      MenuText(
                        text: "Our Services",
                        selectedIndex: widget.selectedIndex,
                        index: 2,
                        onItemTapped: widget.onItemTapped,
                      ),
                      MenuText(
                        text: "Pricing",
                        selectedIndex: widget.selectedIndex,
                        index: 3,
                        onItemTapped: widget.onItemTapped,
                      ),
                      MenuText(
                        text: "Contact Us",
                        selectedIndex: widget.selectedIndex,
                        index: 4,
                        onItemTapped: widget.onItemTapped,
                      ),
                    ],
                  ),
                ),
              if (width < 1200)
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: GestureDetector(
                          onTap: () {
                            _toggleMenu();
                          },
                          child: const Icon(Icons.menu_rounded),
                        ))),
            ],
          ),
        ),
        if (width < 1200)
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: _isMenuExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: Container(),
              secondChild: Column(
                children: <Widget>[
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isMenuExpanded = !_isMenuExpanded;
                          });
                          widget.onItemTapped(0);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Home",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: widget.selectedIndex == 0
                                    ? hexToColor("#002366")
                                    : hexToColor("#000000"),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              )),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: widget.selectedIndex == 0
                            ? hexToColor("#A2C2FF")
                            : hexToColor("#D9D9D9"),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isMenuExpanded = !_isMenuExpanded;
                          });
                          widget.onItemTapped(1);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("About Us",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: widget.selectedIndex == 1
                                    ? hexToColor("#002366")
                                    : hexToColor("#000000"),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              )),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: widget.selectedIndex == 1
                            ? hexToColor("#A2C2FF")
                            : hexToColor("#D9D9D9"),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isMenuExpanded = !_isMenuExpanded;
                          });
                          widget.onItemTapped(2);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Our Services",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: widget.selectedIndex == 2
                                    ? hexToColor("#002366")
                                    : hexToColor("#000000"),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              )),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: widget.selectedIndex == 2
                            ? hexToColor("#A2C2FF")
                            : hexToColor("#D9D9D9"),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isMenuExpanded = !_isMenuExpanded;
                          });
                          widget.onItemTapped(3);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Pricing",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: widget.selectedIndex == 3
                                    ? hexToColor("#002366")
                                    : hexToColor("#000000"),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              )),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: widget.selectedIndex == 3
                            ? hexToColor("#A2C2FF")
                            : hexToColor("#D9D9D9"),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isMenuExpanded = !_isMenuExpanded;
                          });
                          widget.onItemTapped(4);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Contact Us",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: widget.selectedIndex == 4
                                    ? hexToColor("#002366")
                                    : hexToColor("#000000"),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              )),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: widget.selectedIndex == 4
                            ? hexToColor("#A2C2FF")
                            : hexToColor("#D9D9D9"),
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

class MenuText extends StatefulWidget {
  final String text;
  final int selectedIndex;
  final int index;
  final Function(int) onItemTapped;

  const MenuText({
    super.key,
    required this.text,
    required this.selectedIndex,
    required this.index,
    required this.onItemTapped,
  });

  @override
  State<StatefulWidget> createState() {
    return _MenuTextState();
  }
}

class _MenuTextState extends State<MenuText> {
  bool _isHovered = false;
  final GlobalKey _textKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MouseRegion(
            onEnter: (event) => _onHover(true),
            onExit: (event) => _onHover(false),
            cursor: SystemMouseCursors.click,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: GestureDetector(
                onTap: () {
                  // Call the onItemTapped function with the index
                  widget.onItemTapped(widget.index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: widget.selectedIndex == widget.index
                        ? const BorderRadius.all(Radius.circular(15))
                        : null,
                    border: widget.selectedIndex == widget.index
                        ? Border.all(color: hexToColor("#212C62"))
                        : null,
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius:
                          _isHovered && widget.selectedIndex != widget.index
                              ? const BorderRadius.all(Radius.circular(15))
                              : null,
                      border: _isHovered && widget.selectedIndex != widget.index
                          ? Border.all(color: hexToColor("#212C62"))
                          : null,
                    ),
                    child: Text(
                      widget.text,
                      key: _textKey,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: _isHovered
                            ? hexToColor("#002366")
                            : hexToColor("#2D2D2D"),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          right: width > 600 ? 40 : 20, top: 5), // Adjust the padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          imageButton("assets/images/phone.png"),
          const SizedBox(width: 5),
          const Text(
            "Get a Proposal:",
            style: TextStyle(
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 5),
          const Text(
            "+91 96379 03345",
            style: TextStyle(
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget imageButton(String image) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
          onTap: () {},
          child: Image.asset(
            image,
            width: 22,
          )),
    );
  }
}
