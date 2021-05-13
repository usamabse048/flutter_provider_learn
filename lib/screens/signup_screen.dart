import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_provider_learn/firebase_resources/firebase_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  static String signupRoute = "/signupScreen";
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign UP"),
      ),
      body: Column(
        children: [
          Text("Sign up bitches!"),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Form(
                child: Column(
              children: [
                Text("Email"),
                SizedBox(height: 20),
                TextFormField(
                  controller: _email,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Password"),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _password,
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<FirebaseRepo>(context, listen: false)
                          .signUp(email: _email.text, password: _password.text);
                    },
                    child: Text("Sign UP"))
              ],
            )),
          )
        ],
      ),
    );
  }
}
