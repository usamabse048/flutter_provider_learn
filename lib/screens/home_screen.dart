import 'package:firebase_provider_learn/firebase_resources/firebase_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: ElevatedButton(
        child: Text("Sign out"),
        onPressed: () {
          Provider.of<FirebaseRepo>(context, listen: false).signout();
        },
      ),
    );
  }
}
