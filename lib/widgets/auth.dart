import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:travelscape/widgets/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  Stream<AppUser?> get user {
    return _auth
        .idTokenChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

  String error = '';
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } on PlatformException catch (e) {
      switch (e.code) {
        case 'ERROR_INVALID_EMAIL':
          error = "Enter A Valid Email-Id";
          // print("Enter A Valid Email-Id");
          break;
        case 'ERROR_WRONG_PASSWORD':
          error = "Incorrect Password";
          // print("Incorrect Password");
          break;
        case 'ERROR_USER_NOT_FOUND':
          error = "User Not Found";
          // print("User Not Found");
          break;
        case 'ERROR_USER_DISABLED':
          error = "User diasbled";
          // print("User diasbled");
          break;
        case 'ERROR_TOO_MANY_REQUESTS':
          error = "Too many requests";
          // print("Too many requests");
          break;
        default:
          error = "Unknown error";
          // print("Unknown error");
          break;
      }
      return error;
    }
  }

  Future register(String email, String password, String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      user!.sendEmailVerification();
      FirebaseFirestore.instance.collection('/users').doc(user.uid).set({
        'uid': user.uid,
        'email': email,
        'name': name,
        'points': 0,
        // 'events': initialEvents,
      });
      return _userFromFirebaseUser(user);
    } on PlatformException catch (e) {
      switch (e.code) {
        case 'ERROR_WEAK_PASSWORD':
          error = "Enter a Stronger Password";
          break;
        case 'ERROR_INVALID_EMAIL':
          error = "Please Enter a Valid Email";
          break;
        case 'ERROR_EMAIL_ALREADY_IN_USE':
          error = "Email is already in Use";
          break;
        default:
          error = "Unknown Error Occured";
          break;
      }
      return error;
    }
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
