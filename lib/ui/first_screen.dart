import 'package:flutter/material.dart';

import 'detail_screen.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return FirstScreenState();
  }
}

class FirstScreenState extends State {
  List<String> _passengers = ["", '1', '2', '3', "4", '5'];
  String _passenger;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child:Column(
        children: <Widget>[
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