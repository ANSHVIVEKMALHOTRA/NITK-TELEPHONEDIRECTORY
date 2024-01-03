


//import 'package:TelephoneDirectory/models/facultyindividual.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';

//import 'package:android_intent/android_intent.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

import 'package:TelephoneDirectory/models/facultyindividual.dart';

class Info extends StatefulWidget {
  Info({super.key,required this.userDetails});
  facultyindividual userDetails;
  // This widget is the root of your application.
  @override
  State<Info> createState(){
    return _InfoState();}
}

class _InfoState extends State<Info> {

  Future<void>_sendingMails(String? Email) async {
    var url = Uri.parse("mailto:"+Email!);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  Future<void> _makingPhoneCall(String? mobile1) async {
    String dialUri = "tel:+91$mobile1";
    if(dialUri != null && dialUri.isNotEmpty)
    {
      var url = Uri.parse(dialUri);

      if (await canLaunchUrl(url)) {

        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    else
    {
      print("Invalid phonenumber");
    }
  }

  @override
  void launchWhatsApp(
      String? phone,
      String message,
      ) async {
    String url() {
      if (Platform.isAndroid) {
        // add the [https]
        return "https://wa.me/+91$phone/?text="; // new line
      } else {
        // add the [https]
        return "https://api.whatsapp.com/send?phone=+91$phone="; // new line
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }



  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueGrey[50],

      appBar: AppBar(

        centerTitle: true,
        title: const Text(
          'Details',
          style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
        ),

        backgroundColor:const   Color(0xFF192F59),

      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              color: Colors.white60, borderRadius: BorderRadius.circular(20)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          'https://media.licdn.com/dms/image/D5603AQEu4GLWV0rq6Q/profile-displayphoto-shrink_800_800/0/1692427344601?e=2147483647&v=beta&t=mzeFXfo7bnwCELchV_ciRGwElYtdHxwUyz2KvmjnVt4'),
                    ),
                    const  Padding(padding: EdgeInsets.only(left: 20)),
                    Container(
                      width: MediaQuery.of(context).size.width - 200,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${widget.userDetails.name}",
                            style:const  TextStyle(fontSize: 22),
                          ), //NAME OF THE PROFFESOR
                          Text(
                            widget.userDetails.designationId.toString(),
                            style: TextStyle(fontSize: 19, color: Colors.grey),
                          ), // THEIR POSITION OR POST OR ANY KIND OF DESIGNATION
                          const   SizedBox(
                            height: 10,
                          ),
                
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: Container(
                    height: 2.0,
                    width: 1300.0,
                    color: const   Color(0xFF192F59),
                  ),
                ),
//
                if(widget.userDetails.mobile1!=null)
                  Card(
                   child:
                  ListTile(
                    minLeadingWidth: 20,
                    leading: const Icon(Icons.mobile_friendly),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.userDetails.mobile1}",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(const Color(0xFF349CDC))
                          ),

                          onPressed: () {
                            _makingPhoneCall(widget.userDetails.mobile1.toString()); // THEIR PHONE NUMBER OR LANDLINE NUMBER ANY FEASIBLE
                          },
                          child:const  Icon(Icons.call,
                            color: Color.fromARGB(255, 255, 255, 255),),
                        ),
                      ],
                    ),
                    subtitle: const Text (
                      "Mobile-1",
                      style: TextStyle(fontSize: 12),
                    ),

                  ),
                ),


                if(widget.userDetails.mobile2!=null)
                  Card(
                    child: ListTile(
                      minLeadingWidth: 20,
                      leading: const Icon(Icons.mobile_friendly),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.userDetails.mobile2}",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            style:  ButtonStyle(backgroundColor: MaterialStatePropertyAll(const Color(0xFF349CDC))),
                            onPressed: () {
                              _makingPhoneCall(widget.userDetails.mobile2.toString()); // THEIR PHONE NUMBER OR LANDLINE NUMBER ANY FEASIBLE
                            },
                            child:const  Icon(Icons.call,color: Colors.white),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        "Mobile-2",
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                ),

                if(widget.userDetails.landlineOfficeDirect!=null)
                  Card(
                    child: ListTile(
                      minLeadingWidth: 20,
                      leading: const Icon(Icons.call),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.userDetails.landlineOfficeDirect}",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            style:  ButtonStyle(backgroundColor: MaterialStatePropertyAll(const Color(0xFF349CDC))),
                            onPressed: () {
                              _makingPhoneCall(widget.userDetails.landlineOfficeDirect.toString()); // THEIR PHONE NUMBER OR LANDLINE NUMBER ANY FEASIBLE
                            },
                            child:const  Icon(Icons.call,color: Colors.white,),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        "Landline(office)",
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                ),

                if(widget.userDetails.landlineResidential!=null)
                  Card(
                    child: ListTile(
                      minLeadingWidth: 20,
                      leading: const Icon(Icons.call),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.userDetails.landlineResidential}",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        "Landline(residential)",
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                ),
                Card(                            //card one
                    child: ListTile(
                      minLeadingWidth: 20,
                      leading: const Icon(Icons.web_asset_outlined),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(child:Text(
                            "${widget.userDetails.siteName}",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ) )
                          ,
                        ],
                      ),
                      subtitle: Text(
                        "Site Name",
                        style: TextStyle(fontSize: 11),
                      ),
                    )
                ),
                Card(                                         //card2
                    child: ListTile(
                      minLeadingWidth: 20,
                      leading: const Icon(Icons.date_range),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.userDetails.joiningDate}",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        "Joining Date",
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                ),


                Card(
                    child: ListTile(
                      minLeadingWidth: 20,
                      leading: const Icon(Icons.admin_panel_settings_outlined),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(child:Text(
                            "${widget.userDetails.departmentId}",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ) )
                          ,
                        ],
                      ),
                      subtitle: Text(
                        "Department ID",
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                ),

//

                SizedBox(
                  height: 80,
                )

              ]
          ),
        ),
      ),
        floatingActionButton:
        SwipeTo(
          child: Container(
            width: 200,
            //padding: const EdgeInsets.only(top: 2.0,left: 300,right: 25, bottom: 0.0),
            child: const Card(
              color: Color(0xFF349CDC),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back,color: Colors.white, size: 20,),
                      Text("WhatsApp ", style: TextStyle(color: Colors.white),),
                      // Icon(Icons.messenger),
                      // Text(" | ",style: TextStyle(color: Colors.white),),
                      Divider( thickness: 2, color: Colors.black, indent: 10,),
                      Icon(Icons.mail_outline_rounded, color: Colors.white, size: 20,),
                      Text(" Mail",style: TextStyle(color: Colors.white),),
                      Icon(Icons.arrow_forward,color: Colors.white, size: 20,),
//
                    ],
//new code
                  ),
                ],
              ),
            ),
          ),
          onLeftSwipe: (detail) {
            launchWhatsApp(widget.userDetails.mobile1.toString(), 'hello');// THEIR PHONE NUMBER OR LANDLINE NUMBER ANY FEASIBLE
          },
          iconOnLeftSwipe: Icons.message,
          iconOnRightSwipe: Icons.email_outlined,
          onRightSwipe: (detail) {
            _sendingMails(widget.userDetails.email);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
//some changes
    );
  }
}
//s
//chnages

//added a ico tile
class IconTile extends StatelessWidget {
  final String? imgAssetPath;
  final Color? backColor;

  IconTile({this.imgAssetPath, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
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
}
//deleted unwanted files