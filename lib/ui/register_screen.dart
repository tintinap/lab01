import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() {

    return RegisterScreenState();
  }

}

class RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("Register new User")
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) return "Email is required.";
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty && value.length < 8) return "Password is required.";
                },
              ),
              TextFormField(
                controller: rePasswordController,
                decoration: InputDecoration(labelText: "Confirmation Password"),
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) return "Password is required.";
              },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: Text("Register"),
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                        auth
                            .createUserWithEmailAndPassword(
                                email: emailController.text, password: passwordController.text)
                            .then((FirebaseUser user) {
                              user.sendEmailVerification().then((user) {
                                Navigator.pop(context);
                              });
                                print("return from firebase $user.email");
                            }).catchError((error) {
                                print(" this is the cause of error :$error");
                            });
                        } else {
                          print("error");
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}