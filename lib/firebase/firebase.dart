import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'dart:typed_data';

class FirebaseClass {
  Future<UserCredential?> signup(
      String accelerator_Name,
      String user_Name,
      String email,
      String website_Link,
      String password,
      Uint8List imageFile) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      Reference ref = FirebaseStorage.instance
          .ref()
          .child('Images')
          .child('${credential.user!.uid}.jpg');
      await ref.putData(imageFile);
      final imageUrl = await ref.getDownloadURL();
      print('Image uploaded successfully');

      await FirebaseFirestore.instance
          .collection('${credential.user!.uid}')
          .doc('Fields')
          .set({
        'Accelerator_Name': accelerator_Name,
        'User_Name': user_Name,
        'Email': email,
        'Website_Link': website_Link,
        'password': password,
        'imageUrl': imageUrl,
      });
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
