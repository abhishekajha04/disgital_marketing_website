import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void updateUserContactData(
  String firstName,
  String lastName,
  int contactNumber,
  int alternateContactNumber,
  String email,
  String message,
) async {
  try {
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
  } catch (error) {
    debugPrint("Error: ${error.toString()}");
  }
}
