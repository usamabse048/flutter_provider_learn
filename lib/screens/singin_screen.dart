import 'package:firebase_provider_learn/firebase_resources/firebase_repo.dart';
import 'package:firebase_provider_learn/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        actions: [
          IconButton(
              icon: Icon(Icons.person_add),
              onPressed: () {
                Navigator.pushNamed(context, SignUpScreen.signupRoute);
              })
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Text("Welcome To firebase_provider_learn"),
            SizedBox(
              height: 20,
            ),
            Text("Sign In"),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text("Email"),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<FirebaseRepo>(context, listen: false)
                            .signIn(
                                email: _emailController.text,
                                password: _passwordController.text);
                      },
                      child: Text("Sign In"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
