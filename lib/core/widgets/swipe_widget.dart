import 'package:TelephoneDirectory/core/utils/send_mails.dart';
import 'package:TelephoneDirectory/core/utils/whatsApp.dart';
import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';

class SwipeWidget extends StatelessWidget {
  final String mobile1;
  final email;
const SwipeWidget({ Key? key,required this.mobile1,required this.email }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SwipeTo(
           onLeftSwipe: (detail) {
            WhatsApp.launchWhatsApp(mobile1,context);
            // launchWhatsApp(widget.userDetails.mobile1
            //     .toString()); // THEIR PHONE NUMBER OR LANDLINE NUMBER ANY FEASIBLE
          },
          iconOnLeftSwipe: Icons.message,
          iconOnRightSwipe: Icons.email_outlined,
          onRightSwipe: (detail) {
            SendMails.sendingMails(email,context);
         //   _sendingMails(widget.userDetails.email);
          },
          child:const SizedBox(
            width: 240,
            child:  Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(21))),
              color: Color(0xFF00144B),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        " WhatsApp ",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ), //
                      Divider(
                        thickness: 2,
                        color: Colors.black,
                        indent: 10,
                      ),
                      Icon(
                        Icons.mail_outline_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        " Mail ",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
                      ),
                    ], //
                  ),
                ],
              ),
            ),
          ),
         
        );
  }
}