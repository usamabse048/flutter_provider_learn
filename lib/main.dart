import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_provider_learn/firebase_resources/firebase_repo.dart';
import 'package:firebase_provider_learn/screens/home_screen.dart';
import 'package:firebase_provider_learn/screens/signup_screen.dart';
import 'package:firebase_provider_learn/screens/singin_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    runApp(MyApp());
  } catch (e) {
    print("${e.toString()} there is problem in flutter fire");
  }
}

class MyApp extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  // User checkUserState() {
  //   User user;
  //   auth.authStateChanges().listen((User myuser) {
  //     user = myuser;
  //   });
  //   return user;
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FirebaseRepo(),
      child: MaterialApp(
        home: Consumer<FirebaseRepo>(
          builder: (context, firebaseRepo, _) {
            return FutureBuilder<User>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  return HomeScreen();
                }
                return SignInScreen();
              },
              future: firebaseRepo.currentUser,
            );
          },
        ),
        routes: {
          SignUpScreen.signupRoute: (context) => SignUpScreen(),
        },
      ),
    );
  }
}
