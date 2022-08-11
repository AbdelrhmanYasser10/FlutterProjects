import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/shared/network/resources/storage/storage.dart';
import 'package:instagram_clone/model/user_model/user_model.dart' as model;

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl = await StorageMethod().uploadImageToStorage(
            childName: 'profilePictures', file: file, isPost: false);

        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          followers: [],
          following: [],
          photoUrl: photoUrl,
        );

        await _fireStore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toMap());
        res = "Registered Successfully";
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "invalid-email") {
        res = "The email is badly formatted";
      } else if (error.code == "weak-password") {
        res = "Password should be at least 6 characters";
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  Future<String> logInUser(
      {required String email, required String password}) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "Log in successfully";
      } else {
        res = "Please enter all the fields";
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  Future<model.User> getUserDetails() async{
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snapshot = await _fireStore.collection('users').doc(currentUser.uid).get();
    return model.User.fromJson(snapshot.data() as Map<String,dynamic>);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
