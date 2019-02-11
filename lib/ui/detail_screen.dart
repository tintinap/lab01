import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  
  final String title;
  DetailScreen({this.title}); //constructor
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title Screen"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("Go Back"), 
            onPressed: () {
              Navigator.pop(context); // goback
            },
        ),
      )
    );
  }
}