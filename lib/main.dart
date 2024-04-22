import 'package:flutter/material.dart';
import 'package:TelephoneDirectory/screens/searchscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp(
      //main function to 
      home:SearchMenu() 
    );    
 
  }
}
//