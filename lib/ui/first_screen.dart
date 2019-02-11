import 'package:flutter/material.dart';
import 'detail_screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Center(
        child: FlatButton(
          // child: Text("Go to Second"), 
          child: Text("Go to Detail"), 
            onPressed: () {
              // Navigator.pushNamed(context, "/second"); // goto
              // Navigator.pushNamed(context, "/detail"); // goto detail
              Navigator.push(context, 
                MaterialPageRoute(
                  builder:(context) => DetailScreen(title: "Hello"),
                ),
              ); // goto detail with parameter
            },
        ),
      )
    );
  }
}