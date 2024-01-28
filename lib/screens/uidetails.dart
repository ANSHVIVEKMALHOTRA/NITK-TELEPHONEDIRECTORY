import 'package:flutter/material.dart';//
import 'package:swipe_to/swipe_to.dart'; //changes
import 'package:url_launcher/url_launcher.dart';
import 'dart:io'; //
import 'package:TelephoneDirectory/models/facultyindividual.dart';

class Info extends StatefulWidget {
  // Stateful widget is used 
  Info(
     {
      super.key,
      required this.userDetails,
      required this.department
      }
      );
  //Inital value
  final String department;
  final facultyindividual userDetails;
  // This widget is the root of your application.
  @override
  State<Info> createState(){
    return _InfoState();
    }
}

class _InfoState extends State<Info> {

//Function to open the webpage

void openwebpage( String urlname) async
{
  var url = Uri.parse(urlname);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
}

// Function to send the mails

Future<void>_sendingMails(String? Email) async {
  // if email is not enetered the user then the 
  // a alert dialog will be shown stating that the email
  // is not available
  print(Email);
if(Email == null || Email == '')
{
   showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text('Sorry'),
      content: Text('Email not available.'),
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
}
 else
 {
  var url = Uri.parse("mailto:"+Email);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
 }
    
  }

// Function to make a phone call

Future<void> _makingPhoneCall(String? mobile1) async {

     String dialUri = "tel:+91$mobile1";  //
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
                  ) async 
{ 
//a condition check to see if the number of available
if(phone == "null")
{
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

}
else {
   String url() {
      if (Platform.isAndroid) {
        return "https://wa.me/+91$phone/?text="; // new line //
      } else {
        return "https://api.whatsapp.com/send?phone=+91$phone="; // new line // 
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }//
}

Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  Color.fromARGB(255, 235, 235, 235),
      appBar: AppBar(  
            leading: IconButton(       //adding a extra button to make the screen move back
           icon: Icon(Icons.arrow_back_ios,color: Colors.white,), // Use your preferred icon
             onPressed: () => Navigator.pop(context),
              ),     //
        centerTitle: true,
        title: const Text(
          'Details',
          style: TextStyle(fontSize: 25, 
                           color: Color.fromARGB(255, 255, 255, 255),
                           fontWeight: FontWeight.bold,),
                        ),
        backgroundColor:const Color(0xFF192F59), //
),

      body: SingleChildScrollView(
          child: Container(
               padding: const EdgeInsets.symmetric(horizontal: 11),
               decoration: BoxDecoration(
                            color: Color.fromARGB(255, 235, 235, 235), 
                            borderRadius: BorderRadius.circular(20)
                            ),
               child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                          const Padding(padding: EdgeInsets.only(bottom: 15)),
                          Card(
                            color: Colors.white,
                            child: Row(
                               children: <Widget>[
                                const SizedBox(width: 7,),
                                       widget.userDetails.imageUrl!=null ?
                                     //if image is already available then show the image
                                       CircleAvatar(
                                          radius: 60,
                                          backgroundImage: 
                                                NetworkImage(
                                                        widget.userDetails.imageUrl.toString()
                                                         ),
                                                      ):
                                      // if image is missing then show a icon                
                                      CircleAvatar(
                                             radius: 60,
                                             child: Icon(Icons.person,size: 45),
                                                 ),
                                      const  Padding(padding: EdgeInsets.only(left: 20)),
                                      Container(
                                          width: MediaQuery.of(context).size.width - 220,
                                          height: 150,
                                         child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,               
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                                 Flexible(
                                                                   child: Text(
                                                                    "${widget.userDetails.name}",
                                                                      style:const  TextStyle(fontSize: 21 ,
                                                                                             fontWeight: FontWeight.bold
                                                                                  ),
                                                                          ),
                                                                 ),
                                                                 const  SizedBox(
                                                                 height: 10, //
                                                                ),
                                                                Text(widget.department)
                                                          ],
                                                   ),
                                            )
                                      ],
                               ),
                          ),
                 Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: Container(
                    height: 2.0,
                    width: 1300.0,
                    color: const Color(0xFF192F59),
                  ),
                ),//
               
               //if condition is used to display the button only if the number is available
                if(widget.userDetails.mobile1!=null)
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
                                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                           ),
                                       const Spacer(),
                                      ],
                    ),
                    subtitle: const Text (
                      "Mobile-1",
                      style: TextStyle(fontSize: 15),
                    ),
                    trailing:  ElevatedButton(
                                         style: ButtonStyle(
                                         backgroundColor: MaterialStatePropertyAll(const Color(0xFF00144B)
                                         )
                                       ),//
                                      onPressed: () {
                               _makingPhoneCall(widget.userDetails.mobile1.toString()); // THEIR PHONE NUMBER OR LANDLINE NUMBER ANY FEASIBLE
                               },
                                         child:const  Icon(Icons.call,
                                         color: Color.fromARGB(255, 255, 255, 255),),
                        ) ,
                  ),
                ),


                if(widget.userDetails.mobile2!=null)
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
                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                           ),
                          const Spacer(),
                          ElevatedButton(
                            style:  ButtonStyle(backgroundColor: MaterialStatePropertyAll(const Color(0xFF00144B))),
                            onPressed: () {
                              _makingPhoneCall(widget.userDetails.mobile2.toString()); // THEIR PHONE NUMBER OR LANDLINE NUMBER ANY FEASIBLE
                             },
                            child:const  Icon(Icons.call,color: Colors.white),
                          ),
                        ],
                      ),
                      subtitle: Text(
                           "Mobile-2",
                            style: TextStyle(fontSize: 15),
                           ),
                        )
                    ),

                // condition to check whether the landlineofficeIntercom number is present or not
                if( widget.userDetails.landlineOfficeIntercom!=null )
                Card(
                  color: Colors.white,
                     child: ListTile(
                      minLeadingWidth: 20,
                      leading: const Icon(Icons.call),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "${widget.userDetails.landlineOfficeIntercom}",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Spacer(),
                          
                        ],
                      ),
                      subtitle: Text(
                        "Landline(office)",
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing:ElevatedButton(
                            style:  ButtonStyle(backgroundColor: MaterialStatePropertyAll(const Color(0xFF00144B))),
                            onPressed: () {
                              _makingPhoneCall(widget.userDetails.landlineOfficeIntercom.toString()); // THEIR PHONE NUMBER OR LANDLINE NUMBER ANY FEASIBLE
                            },
                            child:const  Icon(Icons.call,color: Colors.white,),
                          ) ,
                    )
                ),
                 //condition to check whether the landlineResdential exist
                if(widget.userDetails.landlineResidential!=null)
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
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        "Landline(residential)",
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                ),
                if(widget.userDetails.siteName!= null )
                Card(   
                  color: Colors.white,                         //card one
                    child: InkWell(
                      onTap: () {
                       openwebpage(widget.userDetails.siteName!);           
                        },
                      child: ListTile(
                        minLeadingWidth: 20,
                        leading: const Icon(Icons.web_asset_outlined),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(child:Text(
                              "Website",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ) )
                            ,
                          ],
                        ),
                      ),
                    )
                ),
                if( widget.userDetails.joiningDate !=null)
                Card(  
                  color: Colors.white,                                       //card2//
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
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                ),  //
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
            width: 230,
            child: const Card(
              color: Color(0xFF00144B),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back,color: Colors.white, size: 20,),
                      Text("WhatsApp ", style: TextStyle(color: Colors.white),), //
                      Divider( thickness: 2, color: Colors.black, indent: 10,),
                      Icon(Icons.mail_outline_rounded, color: Colors.white, size: 20,),
                      Text(" Mail",style: TextStyle(color: Colors.white),),
                      Icon(Icons.arrow_forward,color: Colors.white, size: 20,),
                     ], //
                  ),
                ],
              ),
            ),
          ),
          onLeftSwipe: (detail) {
            launchWhatsApp(widget.userDetails.mobile1.toString());// THEIR PHONE NUMBER OR LANDLINE NUMBER ANY FEASIBLE
          },
          iconOnLeftSwipe: Icons.message,
          iconOnRightSwipe: Icons.email_outlined,
          onRightSwipe: (detail) {
            _sendingMails(widget.userDetails.email);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );//
  }
}
//
class IconTile extends StatelessWidget {
  final String? imgAssetPath;      //
  final Color? backColor;
  IconTile({this.imgAssetPath, this.backColor});// 
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
}//