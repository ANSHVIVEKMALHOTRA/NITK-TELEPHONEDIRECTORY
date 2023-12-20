//import 'dart:js_interop';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dummyapp/screens/uidetails.dart';
import 'package:http/http.dart' as http;
import 'package:dummyapp/models/facultyindividual.dart';
import 'package:dummyapp/models/department.dart';



//import 'package:dummyapp/screens/uidetails.dart';


List<facultyindividual> allindividuals=[];
List<department> alldepartments=[];

String name="";
int _dropdownvalue=-1;

class SearchMenu extends StatefulWidget
{
 const SearchMenu({super.key});
 
 
 @override
 State<SearchMenu> createState()
 {
  return _SearchMenuState();
 }
}

class _SearchMenuState extends State<SearchMenu>
{
var nametext= TextEditingController();
var topictext=TextEditingController();
bool isapicall=false;
bool isdepartment=false;
List<facultyindividual> filteredlist=[];


Future<void> _fetchdepartments() async
{
  final url=Uri.parse("http://telephone.nitk.ac.in/api/v1/faculties");
  final response= await http.get(url);

  final data= jsonDecode(response.body);
  if(response.statusCode ==200)
 {
 for(final i in data)
 {
  alldepartments.add(department.fromJson(i));
 }
print(alldepartments.length);
}
else
{
  print('Failed to load');
}
}

Future<void> _fetchindividuals() async {
final url = Uri.parse(
"http://telephone.nitk.ac.in/api/v1/faculties"
);
final response = await http.get(url);
print(response.body);
final data= jsonDecode(response.body);
print(response.statusCode);
//print(response);

 if(response.statusCode ==200)
 {
 for(final i in data)
 {
  allindividuals.add(facultyindividual.fromJson(i));
  
 }
 setState(() {
    isapicall=true;
  });
print(allindividuals.length);
}
else
{
  print('Failed to load the API call that ypu were mKINGGGG');
}
allindividuals.sort();

}

void filteredlistonparameters(String name, int departmentid){
setState(() {
   filteredlist =allindividuals.where((element)
   {
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
  else if (name=="" && departmentid != -1)
  {
    return element.departmentId==departmentid;
  }
  else if(name != "" && departmentid != -1)
  {
    return  element.name!.toLowerCase().contains(name.toLowerCase()) && element.departmentId==departmentid;
  }
}
return false;
   }).toList();
   
   
  /*  filteredlist = completelist.where((element){
if(n=="n" && i != -1)
{
  return element.departmentId==i?true:false;
}
else
if(n != "n" && i == -1)
{
  return element.name == n;
}
else
if(n!= "n" && i != -1)
{
  return element.name==n && element.departmentId==i;
}
return true;
 }).toList();
*/
});
 
}

String name="";
int _dropdownvalue=-1;

@override
void dispose(){
  nametext.dispose();
  topictext.dispose();
  super.dispose();
}

@override
void initState() {
  _fetchindividuals();
 // _fetchdepartments();
    filteredlist=allindividuals;
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {

    Widget content = isapicall ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                              const SizedBox(height: 5,),
                         
                            Container(
                             padding: const EdgeInsets.all(6),
                              child: TextField(
                                
                                controller: nametext,
                                onChanged: (value){
                                  name=value;
                                  filteredlistonparameters(name, _dropdownvalue);},
                                 decoration: InputDecoration(
                                  labelText:  "Name" ,
                                  labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                                  focusedBorder:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                    gapPadding:1,
                                    borderSide: const BorderSide(width: 2,color:Color(0xFF349CDC)),
                                                 ) ,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                    gapPadding:5,
                                    borderSide: const BorderSide(width: 2,color: Color(0xFF192F59) ),
                                  ),
                                  disabledBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                    gapPadding:5,
                                    borderSide: const BorderSide(width: 2,color:Color.fromARGB(255, 110, 109, 109) ),
                                  ),
                                 // hintText: "Enter the name",
                                 ),
                                 ),
                            ),
                            const SizedBox(height: 5,),
                           const Row(
                            children: 
                                   [
                                    SizedBox(width: 10,),
                                    ]),
                         
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [ 
                                ElevatedButton(onPressed: () async{
                                  await showModalBottomSheet(
                                    elevation: 15,
                                    context: context, 
                                    builder: (context) {
                                      return Column(
                                        children: [
                                          const SizedBox(height: 21,),
                                           const Row(children: [SizedBox(width: 10,),
                                     Text("Branch"),]),
                                     const SizedBox(height: 4,),
                            Row(
                              children: 
                                   [ const SizedBox(width: 10,),
                                      DropdownButton(

                               hint: const Text("Select the branch"),
                               elevation: 8,
                                 items: const[
                                  DropdownMenuItem( value:-1, child: Text("Select the branch"),),
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
                                 Navigator.pop(context);
                                 } 
                                  ),
                                  ])

                                        ],
                                      );
                                    },);

                                  },
                                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll( Color(0xFF349CDC))), child: const Text("Filters", style: TextStyle(color: Colors.white),),
                                  ),
                                  const SizedBox(width: 9,),
                                  
                                  TextButton(onPressed: (){
                                         setState(() {
                                           filteredlistonparameters("", -1);
                                           nametext.text="";
                                         });    
                                    
                                  },
                                    child: const Text("Reset",style: TextStyle(color: Colors.black),))
                              ],
                            ),
                Expanded(
                child:  ListView.builder(
        itemCount: filteredlist.length,
 itemBuilder:(context, index){
         return Container(
          height: 85,
          padding: const EdgeInsets.only(left: 7,right: 7,top: 2,bottom: 2),
          child: Card(
            color:const Color(0xFF192F59),
            child: Row(
              children: [
                const SizedBox(width: 10,),
                Text(" ${index+1}",style: const TextStyle(color: Colors.white),),
                const SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${filteredlist[index].name}",style:const TextStyle(color: Colors.white,fontSize: 15,)
  )
                   ,
                  
                                       Text("Landline: ${filteredlist[index].mobile2.toString()}",
                                       style:const TextStyle(color: Colors.white,fontSize: 12,)),                   
                      Text("Mobile: ${filteredlist[index].mobile1.toString()}",style:const TextStyle(color: Colors.white,fontSize: 12,)),
                  ],
                ),
                const Spacer(),
               TextButton(
                
                style: const ButtonStyle(
                     backgroundColor: MaterialStatePropertyAll( Color(0xFF349CDC)),
                     iconSize: MaterialStatePropertyAll(11),

                     ),
                onPressed: ()
               {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>Info(userDetails: filteredlist[index])),);
               }
               
               ,child: const Text("Details",style: TextStyle(color: Colors.white),) ,
               
               ),
               const SizedBox(width: 7,)
              ],
            ),
            
          ) 
      ,);
     }, 
    )
   ), 
            ],
             ): LoadingPage();
    return Scaffold(
       appBar: AppBar(
                       title: const Text("Telephone Directory",style: TextStyle(color: Colors.white),),
                       backgroundColor: const Color(0xFF192F59),
                       centerTitle: true,
                      ),
             body: content ,
              
    );
  }
}  



class LoadingPage extends StatelessWidget {

  @override

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
               
               Container(
                      width: 200, // Adjust the width of the image
                      height: 200, // Adjust the height of the image
                      child: Image.asset(
                        'lib/assets/image_assets.jpg',
                       // fit: BoxFit.contain, // Adjust the fit of the image
                      ),
                    ),
                   const Text("NITK Surathkal",style: TextStyle(fontSize: 21)),
               // SizedBox(height: 1,),
                const Text("Telephone Directory",style: TextStyle(fontSize: 27)),
                 const SizedBox(height: 13,),
                
                Container(
                  height: 15.0,
                  color: Color.fromARGB(255, 255, 255, 255), // Loading bar color
                ),
              const
              CircularProgressIndicator(color: Color(0xFF192F59), )
              ],
            ),
          ),
          // Loading indicator
          
        ],
      ),

    );
  }
}
