import 'package:flutter/material.dart'; //
import 'package:swipe_to/swipe_to.dart'; //changes
import 'package:url_launcher/url_launcher.dart';
import 'dart:io'; //
import 'package:TelephoneDirectory/models/facultyindividual.dart';

class Info extends StatefulWidget {
  // Stateful widget is used
  const Info(
      {super.key,
      required this.userDetails,
      required this.department,
      required this.designation});
  //Inital value
  final String department;
  final String designation;
  final facultyindividual userDetails;
  // This widget is the root of your application.
  @override
  State<Info> createState() {
    return _InfoState();
  }
}

class _InfoState extends State<Info> {
//Function to open the webpage

  void openwebpage(String urlname) async {
    var url = Uri.parse(urlname);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

// Function to send the mails

  Future<void> _sendingMails(String? email) async {
    // if email is not enetered the user then the
    // a alert dialog will be shown stating that the email
    // is not available
    if (email == null || email == '') {
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

// Function to make a phone call

  Future<void> _makingPhoneCall(String? mobile1) async {
    String dialUri = "tel:+91$mobile1"; //
    var url = Uri.parse(dialUri);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

// Function to make a telephone phone call

  Future<void> _makingPhoneCalltele(String? mobile1) async {
    String dialUri = "tel:$mobile1"; //
    var url = Uri.parse(dialUri);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

//Function to launch the whatsApp call

  void launchWhatsApp(
    String? phone,
  ) async {
//a condition check to see if the number of available
    if (phone == "null") {
      //show a dialog box if the phone is not available
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sorry!'),
            content: Text('WhatsApp number is not available'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      String url() {
        if (Platform.isAndroid) {
          return "https://wa.me/+91$phone/?text="; // new line //
        } else {
          return "https://api.whatsapp.com/send?phone=+91$phone="; // new line //
        }
      }
    } //
  }

@override
  Widget build(BuildContext context) {
    String phonenumber = widget.userDetails.landlineOfficeIntercom!
        .replaceAll(RegExp(r'\s+'), '');
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 235, 235),
        appBar: AppBar(
          leading: IconButton(
            //adding a extra button to make the screen move back
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ), // Use your preferred icon
            onPressed: () => Navigator.pop(context),
          ), //
          centerTitle: true,
          title: const Text(
            'Details',
            style: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFF192F59), //
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 235, 235),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.only(bottom: 15)),
                  Card(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 11,
                        ),
                        widget.userDetails.imageUrl != null
                            ?
                            //
                            Container(
                                width: 110.0,
                                height: 130.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 214, 214, 214),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Optional rounded corners
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        widget.userDetails.imageUrl.toString()),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                            :
                            // if image is missing then show a icon
                            const CircleAvatar(
                                radius: 60,
                                child: Icon(Icons.person, size: 45),
                              ),
                        const Padding(padding: EdgeInsets.only(left: 20)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 200,
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${widget.userDetails.name}",
                                style: const TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 3, //
                              ),
                              widget.designation != "Other" &&
                                      widget.designation != "Director" &&
                                      widget.designation != "Registrar" &&
                                      widget.designation != "-NA-"
                                  ? Text(widget.designation)
                                  : const SizedBox(
                                      height: 1,
                                    ),
                              const SizedBox(
                                height: 3, //
                              ),
                              widget.department.length <= 50
                                  ? Text(widget.department)
                                  : Text(
                                      widget.department,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
//
                  if (widget.userDetails.mobile1 != null)
                    Card(
                      color: Colors.white,
                      child: ListTile(
                        minLeadingWidth: 20,
                        leading: const Icon(Icons.mobile_friendly),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.userDetails.mobile1}",
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                          ],
                        ),
                        trailing: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color(0xFF00144B))), //
                          onPressed: () {
                            _makingPhoneCall(widget.userDetails.mobile1
                                .toString()); // THEIR PHONE NUMBER OR LANDLINE NUMBER ANY FEASIBLE
                          },
                          child: const Icon(
                            Icons.call,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),

                  if (widget.userDetails.mobile2 != null)
                    Card(
                        color: Colors.white,
                        child: ListTile(
                          minLeadingWidth: 20,
                          leading: const Icon(Icons.mobile_friendly),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.userDetails.mobile2}",
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                            ],
                          ),
                          trailing: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color(0xFF00144B))),
                            onPressed: () {
                              _makingPhoneCall(widget.userDetails.mobile2
                                  .toString()); // THEIR PHONE NUMBER OR LANDLINE NUMBER ANY FEASIBLE
                            },
                            child: const Icon(Icons.call, color: Colors.white),
                          ),
                        )),

                  // condition to check whether the landlineofficeIntercom number is present or not
                  if (widget.userDetails.landlineOfficeIntercom != null &&
                      widget.userDetails.landlineOfficeIntercom!.length <= 12)
                    Card(
                        color: Colors.white,
                        child: ListTile(
                          minLeadingWidth: 20,
                          leading: const Icon(Icons.call),
                          title: Row(
                            //      mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.userDetails.landlineOfficeIntercom}",
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              const Spacer()
                            ],
                          ),
                          trailing: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color(0xFF00144B))),
                            onPressed: () {
                              _makingPhoneCalltele(widget
                                  .userDetails.landlineOfficeIntercom
                                  .toString()); // THEIR PHONE NUMBER OR LANDLINE NUMBER ANY FEASIBLE
                            },
                            child: const Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                          ),
                        )),

                  // if the length of the intercom is more than 15 implies that there are 2 numbers and it requires for us to
                  // use the two number separately
                  if (widget.userDetails.landlineOfficeIntercom != null &&
                      widget.userDetails.landlineOfficeIntercom!.length > 13)
                    Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListTile(
                              minLeadingWidth: 20,
                              leading: const Icon(Icons.call),
                              title: Row(
                                //      mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    phonenumber.substring(0, 12),
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer()
                                ],
                              ),
                              trailing: ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0xFF00144B))),
                                onPressed: () {
                                  _makingPhoneCalltele(phonenumber.substring(0,
                                      12)); // THEIR PHONE NUMBER OR LANDLINE NUMBER ANY FEASIBLE
                                },
                                child: const Icon(
                                  Icons.call,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            //2nd number
                            ListTile(
                              minLeadingWidth: 20,
                              leading: const Icon(Icons.call),
                              title: Row(
                                children: [
                               
                                  if (phonenumber.length <= 22)
                                    Text(
                                      "0824-${phonenumber.substring(13)}",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  // now when
                                  if (phonenumber.length > 22)
                                    Text(
                                      phonenumber.substring(13),
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  const Spacer()
                                ],
                              ),
                              trailing: ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0xFF00144B))),
                                onPressed: () {
                                  if (widget.userDetails.landlineOfficeIntercom
                                          .toString()
                                          .length >
                                      22)
                                      {
                                        _makingPhoneCalltele(phonenumber.substring(
                                        13));
                                      }
                                     // THEIR PHONE NUMBER OR LANDLINE NUMBER ANY FEASIBLE
                                  if (phonenumber.length <= 22)
                                  {
                                      _makingPhoneCalltele("0824-${phonenumber.substring(13)}");
                                  }
                                    // THEIR PHONE NUMBER OR LANDLINE NUMBER ANY FEASIBLE
                                },
                                child: const Icon(
                                  Icons.call,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )),

                  //condition to check whether the landlineResdential exist
                  if (widget.userDetails.landlineResidential != null)
                    Card(
                        color: Colors.white,
                        child: ListTile(
                          minLeadingWidth: 20,
                          leading: const Icon(Icons.call),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.userDetails.landlineResidential}",
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )),
                  if (widget.userDetails.email != null &&
                      widget.userDetails.email!.length <= 35)
                    Card(
                        color: Colors.white, //card one
                        child: InkWell(
                          onTap: () {
                            _sendingMails(widget.userDetails.email);
                          },
                          child: ListTile(
                            minLeadingWidth: 20,
                            leading: const Icon(Icons.mail_outlined),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Text(
                                  widget.userDetails.email!,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )),
                              ],
                            ),
                          ),
                        )),
                  if (widget.userDetails.siteName != null)
                    Card(
                        color: Colors.white, //card one
                        child: InkWell(
                          onTap: () {
                            openwebpage(widget.userDetails.siteName!);
                          },
                          child: const ListTile(
                            minLeadingWidth: 20,
                            leading: Icon(Icons.web_asset_outlined),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Text(
                                  "Website",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )),
                              ],
                            ),
                          ),
                        )), //
                  //
                ]),
          ),
        ),
        floatingActionButton: SwipeTo(
           onLeftSwipe: (detail) {
            launchWhatsApp(widget.userDetails.mobile1
                .toString()); // THEIR PHONE NUMBER OR LANDLINE NUMBER ANY FEASIBLE
          },
          iconOnLeftSwipe: Icons.message,
          iconOnRightSwipe: Icons.email_outlined,
          onRightSwipe: (detail) {
            _sendingMails(widget.userDetails.email);
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
         
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat); //
  }
}

//
class IconTile extends StatelessWidget {
  final String? imgAssetPath; //
  final Color? backColor;
 const IconTile({super.key,this.imgAssetPath, this.backColor}); //
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          imgAssetPath!,
          width: 20,
        ),
      ),
    );
  }
} //
