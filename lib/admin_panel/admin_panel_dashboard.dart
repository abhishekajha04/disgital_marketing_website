import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/utils.dart';
import 'package:speeder_website/admin_panel/contact_list.dart';
import 'package:speeder_website/admin_panel/email_list.dart';
import 'package:speeder_website/admin_panel/service_contact.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return AdminDashboardScreenState();
  }
}

class AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor('#FFFFFF'),
      body: SafeArea(
          child: Row(
        children: [
          SideNavigationBar(
              selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
          Expanded(
              child: Column(
            children: [
              Container(
                height: 75,
                color: hexToColor('#ECF1FA'),
              ),
              Expanded(child: _getScreens())
            ],
          ))
        ],
      )),
    );
  }

  Widget _getScreens() {
    switch (_selectedIndex) {
      case 0:
        return const ContactList();
      case 1:
        return const EmailList();
      case 2:
        return const ServiceContactList();
      default:
        return const ContactList();
    }
  }
}

class SideNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  const SideNavigationBar(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 250,
      color: hexToColor('#ECF1FA'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Image.asset(
              'assets/images/logo.png',
              width: 125,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Text(
              'Main Menu',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
                    child: Text(
                      'Website Data',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: hexToColor('#005794')),
                    ),
                  ),
                  _buildMenuItem(0, 'Contact List'),
                  _buildMenuItem(1, 'Email List'),
                  _buildMenuItem(2, 'Enquiry List'),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: hexToColor('#70ACD7'),
            child: Center(
                child: GestureDetector(
              onTap: () async {
                await signOutUser(context);
              },
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Image.asset(
                          'assets/images/log-out.png', // Replace with your image asset path
                          width: 25,
                        ),
                      ),
                      const TextSpan(
                        text: '    Logout',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFFFFFFFF)),
                      ),
                    ],
                  )),
            )),
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(int index, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: GestureDetector(
        onTap: () => onItemTapped(index),
        child: Container(
          alignment: Alignment.centerLeft,
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: selectedIndex == index ? Colors.white : null,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight:
                  selectedIndex == index ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
