import 'package:super_bullet_list/bullet_list.dart';
import 'dart:convert';    //
import 'package:flutter/material.dart';//
import 'package:TelephoneDirectory/screens/uidetails.dart';
import 'package:http/http.dart' as http;
import 'package:TelephoneDirectory/models/facultyindividual.dart';
import 'package:TelephoneDirectory/models/department.dart';  //

//Global values to be used in the screen
List<facultyindividual> allindividuals=[];
List<department> alldepartments=[]; //
String name="";
int _dropdownvalue=-1;

class SearchMenu extends StatefulWidget
{
 const SearchMenu({super.key});
 
 // A stateful widget is used since we need to change the state                     
 @override
 State<SearchMenu> createState()
 {
  return _SearchMenuState();
 }
}

class _SearchMenuState extends State<SearchMenu>
{

//List of variable used within the class
var nametext= TextEditingController();
var topictext=TextEditingController();
bool isapicall=false;
bool isdepartment=false;
List<facultyindividual> filteredlist=[];
String name="";
int _dropdownvalue=-1;

//Functions that are calle within the app

//Function to fecth the data pf the department

Future<void> _fetchdepartments() async
{
  
  // The url is made form the URI so that it can be used to make the 
  // get request, thus fetch the required data accordingly

  final url=Uri.parse("http://telephone.nitk.ac.in/api/v1/departments");
  final response = await http.get(url).timeout(Duration(seconds: 30));
  
  final data= jsonDecode(response.body);

  // If the status code is 2000 implies thata the data is 
  // successfully fetched form the net, thus we format the data 
  // accordingly, so that the images are shown as we wish

  if(response.statusCode ==200)
  {
     for(final i in data)
     {
         alldepartments.add(department.fromJson(i));
     }    //
  }
    else
  {
     print('Failed to load');
  }
}

//function to fetch the data of the individual faculties

Future<void> _fetchindividuals() async {

 // The url is made form the URI so that it can be used to make the 
 // get request, thus fetch the required data accordingly

final url = Uri.parse(
"http://telephone.nitk.ac.in/api/v1/faculties"
);

final response = await http.get(url); //
final data= jsonDecode(response.body);

  // If the status code is 2000 implies thata the data is 
  // successfully fetched form the net, thus we format the data 
  // accordingly, so that the images are shown as we wish

 if(response.statusCode == 200 )
 {
   for(final i in data )
   {
      allindividuals.add(facultyindividual.fromJson(i));
   }
 
 // once data is we fetched 
 setState(() 
  {
    isapicall=true;
  });
 } //
else
 {
  print('Failed to load the API call that ypu were mKINGGGG');
 }

allindividuals.sort();   // the list os sorted acccordingly so that the data is displayed in alphabetical order

// the department details are fetched in here
await _fetchdepartments();

}

// Function to sort the elements based on the list 
// based on the paramters like name and department ID

void filteredlistonparameters(String name, int departmentid)
{
 // to change list and show the elements 
 // based on the name entered and the department chosen

setState(() 
{
   filteredlist =allindividuals.where((element)
   {
    //Logic for the sorting part
      if(name==  "" && departmentid == -1)
       {
         return true;
       }
      else
       {
        if(name != "" && departmentid== -1)
        {
          return element.name!.toLowerCase().contains(name.toLowerCase());
        }
         else 
       if (name=="" && departmentid != -1)
        {
          return element.departmentId==departmentid;
        }
        else 
       if(name != "" && departmentid != -1)
        {
          return  
          element.name!.toLowerCase().contains(name.toLowerCase()) 
                     && 
          element.departmentId==departmentid;
        }
}
return false;
}
   ).toList();
  }
);
 
}

// All the dispose methods to remove the controller used in the code

@override
void dispose(){
  nametext.dispose();
  topictext.dispose();
  super.dispose();
}

// the init state method, the data fetching function _fetchindividual is called here
// all data will be fetched once, when the page is initialised

@override
void initState() 
 {
   _fetchindividuals();   //function call to fetch i=the individual faculties details
  // once the data is fetched its stored in the filtered list
  // which will be used to show the details
  filteredlist=allindividuals;
  super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
  Widget content = isapicall ?           //content will store the widget to be displayed based on the condition whether data is fetched or not
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                          const SizedBox(height: 5,),
                          Container(
                                padding: const EdgeInsets.all(6),
                                child: TextField(
                                        controller: nametext,
                                        onChanged: (value)
                                                {
                                                 name=value;
                                                 filteredlistonparameters(name, _dropdownvalue);
                                                },
                                        decoration: InputDecoration(
                                                          labelText:  "Name" ,
                                                          labelStyle: const TextStyle(
                                                            color: Color.fromARGB(255, 0, 0, 0)
                                                            ),
                                                          focusedBorder:OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(150.0),
                                                                            gapPadding:1,
                                                                            borderSide: const BorderSide(
                                                                              width: 2,
                                                                              color:Color(0xFF29043A)
                                                                              ),) ,
                                                          enabledBorder: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(7.0),
                                                                            gapPadding:5,
                                                                            borderSide: const BorderSide(
                                                                              width: 2,
                                                                              color: Color(0xFF192F59)
                                                                              )
                                                                            ),
                                                          disabledBorder:  OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(7.0),
                                                                            gapPadding:5,
                                                                            borderSide: const BorderSide(
                                                                              width: 2,
                                                                              color:Color.fromARGB(255, 0, 0, 0)
                                                                              )
                                                                          )
                                                                        ),
                                                                      ),
                                                                     ),
                                const SizedBox(height: 5,),
                                SizedBox(width: 10,),//                           
                                Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [ 
                                      const SizedBox(width: 11,),
                                      Expanded(
                                           child: Container(
                                                     padding: EdgeInsets.all(2),
                                                     child: DropdownButton( 

                                                      isExpanded: true,
                                                      iconSize: 35,
                                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                                      hint: const Text("Select the section"),
                                                      elevation: 8,
                                                      items: const [
                                                            DropdownMenuItem( value:-1, 
                                                                              child: Text("Select the section"),
                                                                              ),
                                                            DropdownMenuItem( value:1, child: Text("Computer Science"),),
                                                            DropdownMenuItem( value: 2 ,child: Text("Civil"),),
                                                            DropdownMenuItem( value: 3 ,child: Text("Information Technology"),),
                                                            DropdownMenuItem( value: 6 ,child: Text("Water resources and Ocean Eng"),),
                                                            DropdownMenuItem( value: 7 ,child: Text("Chemical"),),
                                                            DropdownMenuItem( value: 8 ,child: Text("Chemistry"),),
                                                            DropdownMenuItem( value: 9 ,child: Text("Electrical and Electronics"),),
                                                            DropdownMenuItem( value: 10 ,child: Text("Electrical and Communication"),),
                                                            DropdownMenuItem( value: 11 ,child: Text("MACS"),),
                                                            DropdownMenuItem( value: 12 ,child: Text("Mechanical Engineering"),),
                                                            DropdownMenuItem( value: 13 ,child: Text("Metallurgical and Materials Engineering"),),
                                                            DropdownMenuItem( value: 14 ,child: Text("Mining"),),
                                                            DropdownMenuItem( value: 15 ,child: Text("Physics"),),
                                                            DropdownMenuItem( value: 16 ,child: Text("School of Humanitics, Social Sciences, \n and Management")),
                                                            DropdownMenuItem( value: 17 ,child: Text("CDC"),),
                                                            DropdownMenuItem( value: 18 ,child: Text("Central Library"),),
                                                                 ] ,
                                                       value: _dropdownvalue,
                                                       onChanged:
                                                            (newvalue)
                                                           {
                                                         _dropdownvalue=newvalue!;
                                                         filteredlistonparameters(name, _dropdownvalue);
                                                           } 
                                                         ) 
                                                      ),
                                                    ),
                              const SizedBox(width: 9,),
                              TextButton(
                                  style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                             RoundedRectangleBorder(
                                              borderRadius:BorderRadius.all(Radius.circular(15)
                                                  )
                                                )
                                              ),
                                  backgroundColor:MaterialStatePropertyAll( Color(0xFF192F59)
                                                    )
                                                  ),
                                  onPressed: (){
                                           setState(() {
                                              filteredlistonparameters("", -1);
                                              _dropdownvalue=-1;
                                              nametext.text="";
                                                  });    
                                                },
                                  child: const Text("Reset",
                                            style: TextStyle(color: Colors.white),
                                            )
                                          ),
                                  SizedBox(width: 7,)
                                ],
                              ),
                              Container(
                                margin:EdgeInsets.fromLTRB(9, 0, 9, 0),
                                color: Color(0xFF192F59),
                                height: 3,
                              ),
                              SizedBox(height: 4,),
                              Expanded(
                                 child: Scaffold(
                                          body: ListView.builder(
                                                   itemCount: filteredlist.length,
                                                   itemBuilder:(context, index)
                                                    {
                                                      return Container(
                                                              margin: EdgeInsets.fromLTRB(9, 3, 9, 2),
                                                              child: ListTile(
                                                              shape: RoundedRectangleBorder(
                                                                       borderRadius: BorderRadius.circular(3.0), // Adjust radius
                                                                                  ),
                                                              leading: filteredlist[index].imageUrl != null ? 
                                                                  CircleAvatar(
                                                                        radius: 22.0, // Set the radius of the circle
                                                                        backgroundImage: NetworkImage(
                                                                                           filteredlist[index].imageUrl.toString(),
                                                                                           // Replace with your actual avatar image URL
                                                                                           ),
                                                                                         ) : CircleAvatar(
                                                                                                 backgroundColor: Colors.white, 
                                                                                                 radius: 22.0, // Set the radius of the circle
                                                                                                 child: Icon(
                                                                                                  Icons.person,
                                                                                                  color: Colors.black
                                                                                                ),
                                                                                             ), 
                                                                         minLeadingWidth: 10,
                                                                         title: Row(
                                                                               children: [
                                                                                  Container(
                                                                                    width: 2,
                                                                                    color: Colors.white,),
                                                                    Expanded(
                                                                        child: Column(
                                                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                                                 mainAxisAlignment: MainAxisAlignment.center,
                                                                                 children: [
                                                                                      Text("${filteredlist[index].name}",
                                                                                                 overflow: TextOverflow.fade ,
                                                                                                 maxLines: 1,
                                                                                                 style: const TextStyle(
                                                                                                                 color: Colors.white,
                                                                                                                 fontSize: 15                          
                                                                                                                       )
                                                                                                                      ),                   
                                                                                      Text("Office: ${filteredlist[index].landlineOfficeIntercom.toString()}", 
                                                                                             style:const TextStyle(
                                                                                                          color: Colors.white,fontSize: 12,
                                                                                                                )
                                                                                                              ),
                                                                                                            ],
                                                                                                         ),
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                              tileColor: const Color(0xFF192F59),
                                                                              onTap: (){
                                                                                  Navigator.push(
                                                                                     context, MaterialPageRoute(
                                                                                               builder: (context) =>Info(
                                                                                                         userDetails: filteredlist[index]    
                                                                                                              )
                                                                                                            )
                                                                                                         ,);
                                                                                                        },
                                                                                                      ) 
                                                                                                   ,);
                                                                                                 }, 
                                                                                            ),
                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                              ): LoadingPage();
  
   return Scaffold(
       appBar: AppBar(
                       title: const Text("Telephone Directory",style: TextStyle(color: Colors.white),),
                       backgroundColor: const Color(0xFF192F59),
                       centerTitle: true,
                       actions: <Widget> [
                          IconButton(
                              icon: Icon(
                                Icons.info_outline,
                                color: Colors.white,
                                  ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                                      elevation: 16,
                                      child: Container(
                                              child: Column(
                                                   mainAxisAlignment: MainAxisAlignment.start,
                                                   crossAxisAlignment: CrossAxisAlignment.center,
                                                   children: [
                                                             Padding(padding: EdgeInsetsDirectional.symmetric(
                                                                                          horizontal: 10,
                                                                                          vertical: 10
                                                                                          )
                                                                                        ),
                                                            Text('HOW TO USE:'),
                                                            Divider(
                                                                thickness: 2,
                                                                color: Colors.black,
                                                                indent: 9,
                                                                endIndent: 9,
                                                                   ),
                                               Padding(
                                                  padding: EdgeInsets.fromLTRB(10, 15, 15, 0),
                                                  child: SuperBulletList(
                                                    isOrdered: true,
                                                    items: [
                                                      Text('On the Home screen you will find a Search option, Which you can directly use to search a particular person',style: TextStyle(fontSize: 14)),
                                                      Text('Filter Option helps you to search person by his/her Department'),
                                                      Text('In the details pane You will get all the required Information about the person'),
                                                      Text('At the bottom you will find a floating button which on sliding left will redirect you to WhatsApp and sliding right to the mail of the person'),
                                                    ],
                                                   ),
                                                ),
                                              ],
                                            ),
                                          ),
                                      );
                                    },
                                 );
                              },
                          )
                       ],
                  ),
             body: content,              
        );
     }
 }  


// This is the page where the loading symbol will be 
class LoadingPage extends StatelessWidget {
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Stack(
        children: <Widget>[
          // Main content
          Container(
            color: Color.fromARGB(255, 255, 255, 255), // Background color
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            //  crossAxisAlignment: CrossAxisAlignment,
              children: <Widget>[
                 Container(    //
                      width: 200, // Adjust the width of the image
                      height: 200, // Adjust the height of the image
                      child: Image.asset(
                        'assets/image_assets.jpg',
                       // fit: BoxFit.contain, // Adjust the fit of the image
                      ),
                    ),
                   const Text("NITK Surathkal",style: TextStyle(fontSize: 21)),
               // SizedBox(height: 1,),
                const Text("Telephone Directory",style: TextStyle(fontSize: 27)),
                const SizedBox(height: 13,),
                Container(           //
                  height: 15.0,
                  color: Color.fromARGB(255, 255, 255, 255), // Loading bar color
                ),
               const CircularProgressIndicator(color: Color(0xFF00144B), )
               ],
            ),
          ),
          // Loading indicator//
        ],
      ), //
    );
  }
}
