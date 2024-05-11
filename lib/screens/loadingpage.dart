import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Main content
          Container(
            color: const Color.fromARGB(255, 255, 255, 255), // Background color
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              //  crossAxisAlignment: CrossAxisAlignment,
              children: <Widget>[
                Container(
                  //
                  width: 200, // Adjust the width of the image
                  height: 200, // Adjust the height of the image
                  child: Image.asset(
                    'assets/image_assets.jpg',
                    // fit: BoxFit.contain, // Adjust the fit of the image
                  ),
                ),
                const Text("NITK Surathkal", style: TextStyle(fontSize: 21)),
                // SizedBox(height: 1,),
                const Text("Telephone Directory",
                    style: TextStyle(fontSize: 27)),
                const SizedBox(
                  height: 13,
                ),
                Container(
                  //
                  height: 15.0,
                  color:
                      const Color.fromARGB(255, 255, 255, 255), // Loading bar color
                ),
                const CircularProgressIndicator(
                  color: Color(0xFF00144B),
                )
              ],
            ),
          ),
          // Loading indicator//
        ],
      ), //
    );
  }
}
