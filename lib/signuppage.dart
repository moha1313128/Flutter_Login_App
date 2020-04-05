import 'package:app/services/usermanagement.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SignupPage extends StatefulWidget {

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _email;
  String _password;

  //google sign in
  GoogleSignIn googleSignIn = new GoogleSignIn();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Email Input
              TextField(
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (value){setState(() {
                  _email = value;
                });},
              ),
              SizedBox(height: 15.0,),
              // Password Input
              TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
                onChanged: (value){setState(() {
                  _password = value;
                });},
              ),
             
              // Register
              SizedBox(height: 15.0),
              RaisedButton(
                child: Text('Sign up'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)
                    .then((signedInUser) {
                      UserManagement().storeNewUser(signedInUser, context);
                    }).catchError((e) {
                      print(e);
                    }); 
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}