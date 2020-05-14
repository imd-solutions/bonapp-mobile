import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/user.dart';

class InitialScreen extends StatelessWidget {
  final User user;

  InitialScreen({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Initial Screen'),
      ),
      body: Center(
        child: Text('Hello ${user.profile.firstname}'),
      ),
    );
  }
}
