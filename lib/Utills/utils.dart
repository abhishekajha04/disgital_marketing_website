import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

Future<void> launchUrlFunc(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(
      url,
      mode: LaunchMode
          .platformDefault, // Use platformDefault for web compatibility
    );
  } else {
    throw Exception('Could not launch $url');
  }
}

Future<void> signOutUser(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    // Optionally, navigate to the login screen or another screen after sign out
    Navigator.pushReplacementNamed(
        context, '/admin'); // Adjust the route as per your app
  } catch (e) {
    print("Error signing out: $e");
  }
}
