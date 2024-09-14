import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/common_widget.dart';
import 'package:speeder_website/Utills/utils.dart';

void showSuccessDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Container(
            decoration: BoxDecoration(
              color: hexToColor('#FFFFFF'),
              borderRadius: BorderRadius.circular(35),
            ),
            child: Material(
              elevation: 5,
              borderRadius: const BorderRadius.all(Radius.circular(35)),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 350,
                height: 325,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/tick_sign.png',
                      width: 75,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Success',
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      message,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    buildButton('Continue', () {
                      Navigator.pop(context);
                    },
                        topMargin: 20,
                        bottomMargin: 0,
                        height: 45,
                        textColor: '#FFFFFF',
                        fontSize: 14,
                        backgroundColor: '#4cc14c')
                  ],
                ),
              ),
            )),
      );
    },
  );
}
