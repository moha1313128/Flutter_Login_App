import 'package:app/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget with NavigationStates {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('My Account', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
  }
}