import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return BookScreenState();
  }

}

class BookScreenState extends State<BookScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _title = TextEditingController();
  TextEditingController _author = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("BOOK"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _title,
                decoration: InputDecoration(labelText: "title"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please fill title";
                  }
                },
              ),
              TextFormField(
                controller: _author,
                decoration: InputDecoration(labelText: "Author"),
                validator: (value) {
                   if (value.isEmpty) {
                    return "Please fill author";
                   }
                },
              ),
              RaisedButton(
                child: Text("Save"),
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    // //save to cloud firestore
                    // Firestore.instance.collection('books').add({
                    //   "title": _title.text,
                    //   "author": _author.text,
                    // }).then((doc){
                    //   //ur logic here
                    //   print(doc.toString());
                    // });
                    Firestore.instance
                    .collection('books')
                    .document('X1')
                    .collection("items")
                    .document("A")
                    .setData({
                      "title": _title.text,
                      "author": _author.text,
                    }).then((x){
                      print("set success");
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

}