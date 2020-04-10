// import 'package:app/uploadImage.dart';
// import 'package:flutter/material.dart';
// import 'package:app/auth/login_page.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Login',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ProfilePage(),
//     );
//   }
// }

import 'package:app/loginpage.dart';
import 'package:app/homepage.dart';
import 'package:app/signuppage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        routes: <String, WidgetBuilder>{
          '/landingpage': (BuildContext context) => new MyApp(),
          '/signuppage': (BuildContext context) => new SignupPage(),
          '/homepage': (BuildContext context) => new FirstScreen(),
        });
  }
}

// import 'package:flutter/material.dart';
// import 'loginpage.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Login',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: LoginPage(),
//     );
//   }
// }
