import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/common_widget.dart';
import 'package:speeder_website/Utills/consts.dart';
import 'package:speeder_website/Utills/utils.dart';
import 'package:speeder_website/admin_panel/admin_panel_dashboard.dart';
import 'package:speeder_website/dialogs/failed_dialog.dart';
import 'package:speeder_website/footer/footer.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return AdminLoginPageState();
  }
}

class AdminLoginPageState extends State<AdminLoginPage> {
  final userIdController = TextEditingController();
  final passwordController = TextEditingController();
  var _isButtonVisible = true;
  var _isProgressVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(35),
          child: Container(
            width: 800,
            height: 500,
            decoration: BoxDecoration(
                color: hexToColor("#FFFFFF"),
                borderRadius: const BorderRadius.all(Radius.circular(35))),
            child: Row(
              children: [
                Container(
                  width: 300,
                  height: 500,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: hexToColor('#002366'),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          topLeft: Radius.circular(35))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/speeder_logo.png", height: 25),
                      const SizedBox(
                        height: 25,
                      ),
                      textStyle(footerText, padding: 0),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Log In For Admin Panel",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat",
                            color: hexToColor('#002366')),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      fillDetails("Admin Panel User Id",
                          "Enter Admin Panel User Id", userIdController,
                          isRequired: 1, width: 400, padding: 0),
                      const SizedBox(
                        height: 30,
                      ),
                      fillDetails(
                          "Admin Password",
                          "Enter Admin Password",
                          isPassWord: 1,
                          passwordController,
                          isRequired: 1,
                          width: 400,
                          padding: 0),
                      buildButton("Submit", () {
                        adminLogin(context, userIdController.text.toString(),
                            passwordController.text.toString());
                      },
                          width: 400,
                          leftMargin: 0,
                          isButtonVisible: _isButtonVisible,
                          isProgressBarVisible: _isProgressVisible,
                          rightMargin: 0,
                          topMargin: 50,
                          height: 55,
                          textColor: '#FFFFFF',
                          backgroundColor: "#002366",
                          fontSize: 16,
                          bottomMargin: 0)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  void adminLogin(BuildContext context, String email, String password) {
    setState(() {
      _isButtonVisible = false;
      _isProgressVisible = true;
    });
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      navigateToAdminDashboardScreen(context);
      setState(() {
        _isButtonVisible = true;
        _isProgressVisible = false;
      });
    }).onError((error, stackTrace) {
      debugPrint('Something Error: ${error.toString()}');
      showFailedDialog(context, 'Something Error: ${error.toString()}');
      setState(() {
        _isButtonVisible = true;
        _isProgressVisible = false;
      });
    });
  }

  void navigateToAdminDashboardScreen(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return const AdminDashboardScreen();
    }));
  }
}
