import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:io';


class SecondScreen extends StatelessWidget {
  int counter = 0;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      // body: Center(
      //   child: FlatButton(
      //     child: Text("Back to First Screen"),
      //       onPressed: () {
      //         Navigator.pop(context); // goback
      //       }
      //   ),
      // )
      body: ListView(
        children: <Widget> [
          FlatButton(
            child: Text("Read from file"),
            onPressed: () {
              // print(readCounter());
              readCounter().then((value) {
                print(value);
              });
            },
          ),

          FlatButton(
            child: Text("Write to file"),
            onPressed: () {
              writeCounter(counter);
            },
          ),


          FlatButton(
            child : Text("Back to First Screen"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ]
      )
    );
  }
}