# app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Tutorial
https://medium.com/flutterpub/flutter-how-to-do-user-login-with-firebase-a6af760b14d5
```
code
```
https://github.com/tattwei46/flutter_login_demo
```
code
```
https://flutterawesome.com/provides-login-screen-with-login-signup-functionalities/
```
import 'package:app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
// import 'dashboard_screen.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginPage extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'WebDevMa',
      // logo: 'assets/images/ecorp-lightblue.png',
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}

```
## Authenticated client [Work]
```
keytool -exportcert -keystore C:\Users\MOHAMMEDETTAIBI\.android\debug.keystore -list -v
```


## Get SHA1 from debug.keystore file
```
keytool -list -v -keystore debug.keystore -alias androiddebugkey -storepass android -keypass android
```
## Create debug.keystore file again at the same location if required.
```
keytool -genkey -v -keystore debug.keystore -storepass android -alias androiddebugkey -keypass android -keyalg RSA -keysize 2048 -validity 10000
```

## cmd
```
keytool -list -v -keystore debug.keystore -alias androiddebugkey -storepass android -keypass android
```
