import 'package:flutter/material.dart';

class AdminPanelDashboard extends StatefulWidget {
  const AdminPanelDashboard({super.key});
  @override
  State<StatefulWidget> createState() {
    return AdminPanelDashboardState();
  }
}

class AdminPanelDashboardState extends State<AdminPanelDashboard> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: Text("Admin Panel Dashboard"),
      )),
    );
  }
}
