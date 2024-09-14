import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/common_widget.dart';
import 'package:speeder_website/Utills/utils.dart';
import 'package:speeder_website/dialogs/failed_dialog.dart';
import 'package:speeder_website/dialogs/success_dialog.dart';
import 'package:speeder_website/home_page_body/contact_section/contact_section.dart';

class ContactUsServiceDialog extends StatefulWidget {
  final String message;

  const ContactUsServiceDialog({super.key, required this.message});

  @override
  State<StatefulWidget> createState() {
    return _ContactUsServiceDialogState();
  }
}

class _ContactUsServiceDialogState extends State<ContactUsServiceDialog> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobilePhoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  var _isButtonVisible = true;
  var _isProgressVisible = false;

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        height: 500,
        width: width > 650 ? 500 : double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Let's gets connected",
                  style: TextStyle(
                    fontSize: width > 600 ? 24 : 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Montserrat",
                    color: hexToColor("#212C62"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: textField("First Name", firstNameController)),
                    const SizedBox(width: 20),
                    Expanded(child: textField("Last Name", lastNameController)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: textField("Phone Number", mobilePhoneController),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: textField("Email", emailController),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 100,
                  child: TextField(
                    controller: messageController,
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
                ),
              ),
              buildButton(
                "SEND",
                () {
                  if (firstNameController.text.toString().isNotEmpty &&
                      mobilePhoneController.text.toString().isNotEmpty) {
                    updateUserContactDataMob(
                        context,
                        firstNameController.text.toString(),
                        lastNameController.text.toString(),
                        int.tryParse(mobilePhoneController.text) ?? 0,
                        widget.message,
                        emailController.text.toString(),
                        messageController.text.toString());
                  } else {
                    showFailedDialog(context,
                        " Contact Updation Failed! Please fill all the mandatory filled to contact us");
                  }
                },
                height: 45,
                width: 150,
                backgroundColor: "#9FFF00",
                isButtonVisible: _isButtonVisible,
                isProgressBarVisible: _isProgressVisible,
                borderRadius: 15,
                leftMargin: 0,
                textColor: "#FFFFFF",
                fontSize: 14,
                bottomMargin: 0,
                rightMargin: 0,
                topMargin: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateUserContactDataMob(
    BuildContext context,
    String firstName,
    String lastName,
    int contactNumber,
    String services,
    String email,
    String message,
  ) async {
    try {
      setState(() {
        _isButtonVisible = false;
        _isProgressVisible = true;
      });
      final userDocRef =
          FirebaseFirestore.instance.collection('service_contactUs');
      await userDocRef.add({
        'first_name': firstName,
        'last_name': lastName,
        'contact_number': contactNumber,
        'service': services,
        'email': email,
        'message': message,
        'created_date': FieldValue.serverTimestamp(),
      });
      debugPrint('Contact Detail Updated');
      Navigator.pop(context);
      showSuccessDialog(context,
          'Successfully Updated Your Contact Details. Will Contact Soon');
      firstNameController.clear(); // Clears the input
      lastNameController.clear();

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
