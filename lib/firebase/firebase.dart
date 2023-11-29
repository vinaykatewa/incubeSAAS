import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class FirebaseClass {
  Future<UserCredential?> signup(
    String accelerator_Name,
    String user_Name,
    String email,
    String website_Link,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final collectionRef =
          FirebaseFirestore.instance.collection('${credential.user!.uid}');
      final docSnapshot = await collectionRef.doc('Fields').get();
      if (!docSnapshot.exists) {
        await collectionRef.doc('Fields').set({
          'Accelerator_Name': accelerator_Name,
          'User_Name': user_Name,
          'Email': email,
          'Website_Link': website_Link,
          'password': password,
        });
      }
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserCredential?> signin(String email, String passcode) async {
    try {
      final Credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: passcode);

      return Credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return null;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
