import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SendMails{
  static Future<void> sendingMails(String? email,BuildContext context) async {
    // if email is not enetered the user then the
    // a alert dialog will be shown stating that the email
    // is not available
    if (email == null || email == "") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sorry'),
            content: const Text('email not available.'),
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
      var url = Uri.parse("mailto:$email");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

}