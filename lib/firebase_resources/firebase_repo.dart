import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseRepo extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signUp({String email, String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signIn({String email, String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> signout() async {
    await auth.signOut();
    notifyListeners();
  }

  Future<User> get currentUser async {
    return await auth.currentUser;
  }
}
