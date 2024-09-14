import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/common_widget.dart';
import 'package:speeder_website/Utills/utils.dart';
import 'package:speeder_website/dialogs/failed_dialog.dart';
import 'package:speeder_website/dialogs/success_dialog.dart';
import 'package:speeder_website/responsive/responsive.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<StatefulWidget> createState() {
    return ContactUsState();
  }
}

class ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Responsive.isDesktop(context)) const WebContactUs(),
        if (!Responsive.isDesktop(context)) const MobContactUs()
      ],
    );
  }
}

class WebContactUs extends StatefulWidget {
  const WebContactUs({super.key});

  @override
  State<StatefulWidget> createState() {
    return WebContactUsState();
  }
}

class WebContactUsState extends State<WebContactUs> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumber = TextEditingController();
  final alternatePhoneNumber = TextEditingController();
  final userEmail = TextEditingController();
  final userMssage = TextEditingController();
  var _isButtonVisible = true;
  var _isProgressVisible = false;

  @override
  void dispose() {
    // Don't forget to dispose of the controllers to avoid memory leaks
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumber.dispose();
    alternatePhoneNumber.dispose();
    userEmail.dispose();
    userMssage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: height),
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      color: hexToColor("#ECF1FA"),
      child: Column(
        children: [
          Text(
            "Contact Us",
            style: TextStyle(
                fontSize: 28,
                fontFamily: "Montserrat",
                color: hexToColor("#000000")),
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: fillDetails(
                            "Name", "First Name", firstNameController,
                            isRequired: 1, width: double.infinity, padding: 0),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: fillDetails("", "Last Name", lastNameController,
                            width: double.infinity, padding: 0),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: fillDetails("Contact Number",
                            "Enter Contact Number", phoneNumber,
                            isRequired: 1, width: double.infinity, padding: 30),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: fillDetails(
                            "Alt. Contact no. (Optional)",
                            "Enter Alternate Mobile Number",
                            alternatePhoneNumber,
                            width: double.infinity,
                            padding: 30),
                      )
                    ],
                  ),
                  fillDetails("Email", "Enter Email Address", userEmail,
                      isRequired: 1, width: double.infinity, padding: 30),
                  fillDetailsTypeIII("Message", "Enter Message..", userMssage,
                      padding: 30, isRequired: 1),
                  const SizedBox(height: 40),
                  buildButton("Submit", () {
                    if (firstNameController.text.toString().isNotEmpty &&
                        phoneNumber.text.toString().isNotEmpty &&
                        userEmail.text.toString().isNotEmpty &&
                        userMssage.text.toString().isNotEmpty) {
                      updateUserContactDataWeb(
                          context,
                          firstNameController.text.toString(),
                          lastNameController.text.toString(),
                          int.tryParse(phoneNumber.text) ?? 0,
                          int.tryParse(alternatePhoneNumber.text) ?? 0,
                          userEmail.text.toString(),
                          userMssage.text.toString());
                    } else {
                      showFailedDialog(context,
                          " Contact Updation Failed! Please fill all the mandatory filled to contact us");
                    }
                  },
                      width: double.infinity,
                      isButtonVisible: _isButtonVisible,
                      isProgressBarVisible: _isProgressVisible,
                      leftMargin: 0,
                      rightMargin: 0,
                      height: 55,
                      backgroundColor: "#9FFF00",
                      fontSize: 16,
                      bottomMargin: 30)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateUserContactDataWeb(
    BuildContext context,
    String firstName,
    String lastName,
    int contactNumber,
    int alternateContactNumber,
    String email,
    String message,
  ) async {
    try {
      setState(() {
        _isButtonVisible = false;
        _isProgressVisible = true;
      });
      final userDocRef = FirebaseFirestore.instance.collection('contactUs');
      // Add user data (name and city) to the document
      await userDocRef.add({
        'first_name': firstName,
        'last_name': lastName,
        'contact_number': contactNumber,
        'alt_contact_number': alternateContactNumber,
        'email': email,
        'message': message,
        'created_date': FieldValue.serverTimestamp(),
      });
      debugPrint('Contact Detail Updated');
      showSuccessDialog(context, 'Successfully Updated All Contacts');
      firstNameController.clear(); // Clears the input
      lastNameController.clear();
      phoneNumber.clear();
      alternatePhoneNumber.clear();
      userEmail.clear();
      userMssage.clear();
      setState(() {
        _isButtonVisible = true;
        _isProgressVisible = false;
      });
    } catch (error) {
      debugPrint("Error: ${error.toString()}");
      setState(() {
        _isButtonVisible = true;
        _isProgressVisible = false;
      });
      showFailedDialog(context, "Error: ${error.toString()}");
    }
  }
}

class MobContactUs extends StatefulWidget {
  const MobContactUs({super.key});

  @override
  State<StatefulWidget> createState() {
    return MobContactUsState();
  }
}

class MobContactUsState extends State<MobContactUs> {
  var _isButtonVisible = true;
  var _isProgressVisible = false;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumber = TextEditingController();
  final alternatePhoneNumber = TextEditingController();
  final userEmail = TextEditingController();
  final userMssage = TextEditingController();

  @override
  void dispose() {
    // Don't forget to dispose of the controllers to avoid memory leaks
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumber.dispose();
    alternatePhoneNumber.dispose();
    userEmail.dispose();
    userMssage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: hexToColor("#ECF1FA"),
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Contact Us",
            style: TextStyle(
                fontSize: 28,
                fontFamily: "Montserrat",
                color: hexToColor("#000000")),
          ),
          const SizedBox(height: 30),
          fillDetails("Name", "First Name", firstNameController,
              isRequired: 1, width: double.infinity, padding: 0),
          fillDetails("", "Last Name", lastNameController,
              width: double.infinity, padding: 0),
          fillDetails("Contact Number", "Enter Contact Number", phoneNumber,
              isRequired: 1, width: double.infinity, padding: 30),
          fillDetails("Alt. Contact no. (Optional)",
              "Enter Alternate Mobile Number", alternatePhoneNumber,
              width: double.infinity, padding: 30),
          fillDetails("Email", "Enter Email Address", userEmail,
              isRequired: 1, width: double.infinity, padding: 30),
          fillDetailsTypeIII("Message", "Enter Message..", userMssage,
              padding: 30, isRequired: 1),
          const SizedBox(height: 40),
          buildButton("Submit", () {
            if (firstNameController.text.toString().isNotEmpty &&
                phoneNumber.text.toString().isNotEmpty &&
                userEmail.text.toString().isNotEmpty &&
                userMssage.text.toString().isNotEmpty) {
              updateUserContactDataMob(
                  context,
                  firstNameController.text.toString(),
                  lastNameController.text.toString(),
                  int.tryParse(phoneNumber.text) ?? 0,
                  int.tryParse(alternatePhoneNumber.text) ?? 0,
                  userEmail.text.toString(),
                  userMssage.text.toString());
            } else {
              showFailedDialog(context,
                  " Contact Updation Failed! Please fill all the mandatory filled to contact us");
            }
          },
              width: double.infinity,
              isButtonVisible: _isButtonVisible,
              isProgressBarVisible: _isProgressVisible,
              leftMargin: 0,
              rightMargin: 0,
              height: 55,
              backgroundColor: "#9FFF00",
              fontSize: 16,
              bottomMargin: 30)
        ],
      ),
    );
  }

  void updateUserContactDataMob(
    BuildContext context,
    String firstName,
    String lastName,
    int contactNumber,
    int alternateContactNumber,
    String email,
    String message,
  ) async {
    try {
      setState(() {
        _isButtonVisible = false;
        _isProgressVisible = true;
      });
      final userDocRef = FirebaseFirestore.instance.collection('contactUs');
      // Add user data (name and city) to the document
      await userDocRef.add({
        'first_name': firstName,
        'last_name': lastName,
        'contact_number': contactNumber,
        'alt_contact_number': alternateContactNumber,
        'email': email,
        'message': message,
        'created_date': FieldValue.serverTimestamp(),
      });
      debugPrint('Contact Detail Updated');
      showSuccessDialog(context, 'Successfully Updated All Contacts');
      firstNameController.clear(); // Clears the input
      lastNameController.clear();
      phoneNumber.clear();
      alternatePhoneNumber.clear();
      userEmail.clear();
      userMssage.clear();
      setState(() {
        _isButtonVisible = true;
        _isProgressVisible = false;
      });
    } catch (error) {
      debugPrint("Error: ${error.toString()}");
      setState(() {
        _isButtonVisible = true;
        _isProgressVisible = false;
      });
      showFailedDialog(context, "Error: ${error.toString()}");
    }
  }
}
