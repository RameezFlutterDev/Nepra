import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//Sign In
  Future<UserCredential> SignInWithEmailPassword(
      String Email, String Password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: Email, password: Password);
      return userCredential;
    } catch (e) {
      throw Exception(e);
    }
    //
    // on FirebaseAuthException catch (e) {
    //   throw Exception(e.code);
  }

  //Sign up

  Future<UserCredential> SignUpWithEmailPassword(
      String Email, String Password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: Email, password: Password);

      return userCredential;
    } catch (e) {
      throw Exception(e);
    }
  }

  //Sign out
  Future<void> SignOutUser() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw (e);
    }
  }
}
