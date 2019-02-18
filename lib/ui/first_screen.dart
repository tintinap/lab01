import 'dart:io';

import 'package:flutter/material.dart';

import 'detail_screen.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return FirstScreenState();
  }
}

class FirstScreenState extends State {
  List<String> _passengers = ["", '1', '2', '3', "4", '5'];
  String _passenger;
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
          _image = image;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () {
          getImage();
        }
      ),


      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child:Column(
        children: <Widget>[
          _image == null ? Text("No image selected") : Image.file(_image, height: 329, width: 500,),
          InputDecorator(
            decoration: const InputDecoration(
              icon: const Icon(Icons.people),
              labelText: 'Passenger', 
            ),
            isEmpty: _passenger == '', // use for displaying
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: _passenger,
                isDense: true,
                onChanged: (value) {
                  setState( () {
                    _passenger = value;
                  });
                },
                items: _passengers.map((String value) {
                  return DropdownMenuItem<String>(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child:DateTimePickerFormField(
              inputType: InputType.date,
              format: DateFormat('dd-MM-yyyy'),
              decoration: InputDecoration(labelText: "Date"),
          )
          ),
        ],
      )
    )
    );
  }

}