import 'package:app/api/food_api.dart';
import 'package:app/notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../model/user.dart';

enum AuthMode { Signup, Login }

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = new TextEditingController();
  AuthMode _authMode = AuthMode.Login;
  User _user = User();
  @override
  void initState() {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    initializeCurrentUser(authNotifier);
    super.initState();
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    if (_authMode == AuthMode.Login) {
      login(_user, authNotifier);
    } else {
      signup(_user, authNotifier);
    }
  }

  Widget _buildDisplayNamedField() {
    return TextFormField(
        decoration: InputDecoration(labelText: "Display Name"),
        keyboardType: TextInputType.text,
        style: TextStyle(fontSize: 26.0),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Display Name is required';
          }
          if (value.length < 5 || value.length > 12) {
            return 'Display NAme must be between 5 and 12 characters';
          }
          return null;
        },
        onSaved: (String value) {
          _user.displayName = value;
        });
  }

  Widget _buildEmailField() {
    return TextFormField(
        decoration: InputDecoration(labelText: "Email"),
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontSize: 26.0),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Email is required';
          }
          if (!RegExp(
                  r'^(([^&>()[\]\\.,;:\s@\"]+(\.[^&>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(value)) {
            return 'Please enter a valid email';
          }
          return null;
        },
        onSaved: (String value) {
          _user.email = value;
        });
  }

  Widget _buildPasswordField() {
    return TextFormField(
        decoration: InputDecoration(labelText: "Password"),
        obscureText: true,
        controller: _passwordController,
        style: TextStyle(fontSize: 26.0),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password is required';
          }
          if (value.length < 5 || value.length > 20) {
            return 'Password must be between 5 and 20 characters';
          }
          return null;
        },
        onSaved: (String value) {
          _user.password = value;
        });
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Confirm Password"),
      obscureText: true,
      style: TextStyle(fontSize: 26.0),
      validator: (String value) {
        if (_passwordController.text != value) {
          return 'Password do not match';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Building login screen");
    return Scaffold(
        body: Form(
      autovalidate: true,
      key: _formKey,
      child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.fromLTRB(32, 96, 32, 0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Please Sign in",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 36),
                  ),
                  SizedBox(height: 32),
                  _authMode == AuthMode.Signup
                      ? _buildDisplayNamedField()
                      : Container(),
                  _buildEmailField(),
                  _buildPasswordField(),
                  _authMode == AuthMode.Signup
                      ? _buildConfirmPasswordField()
                      : Container(),
                  SizedBox(height: 32),
                  RaisedButton(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Switch to ${_authMode == AuthMode.Login ? 'Signup' : 'Login'}',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      setState(() {
                        _authMode = _authMode == AuthMode.Login
                            ? AuthMode.Signup
                            : AuthMode.Login;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  RaisedButton(
                      padding: EdgeInsets.all(16),
                      onPressed: () => _submitForm(),
                      child: Text(
                        _authMode == AuthMode.Login ? 'Login' : 'Signup',
                        style: TextStyle(fontSize: 20.0),
                      ))
                ],
              ))),
    ));
  }
}
