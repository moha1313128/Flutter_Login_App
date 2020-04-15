import 'package:app/notifier/auth_notifier.dart';
import 'package:app/notifier/food_notifier.dart';
import 'package:app/screens/feed.dart';
import 'package:app/screens/food_form.dart';
import 'package:app/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => AuthNotifier(),
        ),
        ChangeNotifierProvider(
          builder: (context) => FoodNotifier(),
        ),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.blue,
        ),
        // home: FoodForm(),
        home: Consumer<AuthNotifier>(
          builder: (context, notifier, child) {
            return notifier.user != null ? Feed() : Login();
          },
        ));
  }
}
