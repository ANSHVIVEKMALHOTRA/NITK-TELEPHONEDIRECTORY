import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsApp{
  static void launchWhatsApp(
    String? phone,
    BuildContext context
  ) async {
//a condition check to see if the number of available
    if (phone == "null") {
      //show a dialog box if the phone is not available
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sorry!'),
            content: const Text('WhatsApp number is not available'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
        if (Platform.isAndroid) {
          launchUrl(Uri.parse("https://wa.me/+91$phone/?text=")); // new line //
        } else {
          launchUrl(Uri.parse("https://api.whatsapp.com/send?phone=+91$phone="));
     //     return "https://api.whatsapp.com/send?phone=+91$phone="; // new line //
        }
      
    } //
  }
}