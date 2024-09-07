import 'package:flutter/material.dart';

void showCustomAlertDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), 
        ),
        child: Container(
            padding: const EdgeInsets.all(20), 
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius:
                  BorderRadius.circular(20), 
            ),
            child: Material(
              elevation: 5,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            )),
      );
    },
  );
}
