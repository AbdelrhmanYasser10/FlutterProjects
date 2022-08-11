import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/model/post_model/post_model.dart';
import 'package:instagram_clone/shared/network/resources/storage/storage.dart';
import 'package:instagram_clone/shared/widgets/toast/my_toast.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  Future<String> uploadPost(
      {required String description,
      required Uint8List file,
      required String uid,
      required String username,
      required String profImage}) async {
    String res = "Some error occurred";
    try {
      String photoUrl = await StorageMethod()
          .uploadImageToStorage(childName: 'post', file: file, isPost: true);
      String postId = const Uuid().v1();
      Post post = Post(
        description: description,
        uid: uid,
        postId: postId,
        username: username,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
        likes: [],
      );
      await _fireStore.collection('posts').doc(postId).set(post.toMap());
      res = "Posted Successfully";
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  Future<void> likePost({
    required String postId,
    required String uid,
    required List likes,
  }) async {
    try {
      if (likes.contains(uid)) {
        await _fireStore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid]),
        });
      } else {
        await _fireStore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid]),
        });
      }
    } catch (error) {
      myToast(
          msg: 'an error occurred', color: Colors.red, txtColor: Colors.white);
    }
  }

  Future<String> postComment({
    required String postId,
    required String text,
    required String uid,
    required String name,
    required String profilePicture,
  }) async {
    String res = "some error occurred";
    try {
      if (text.isNotEmpty) {
        String commentId = const Uuid().v1();
        _fireStore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilePicture,
          'name': name,
          'uid': uid,
          'text': text,
          'comment': commentId,
          'datePublished': DateTime.now(),
        });
        res = "Posted";
      }
      else{
        res = "Please enter a text";
      }
    } catch (e) {
      res = e.toString();
    }
    myToast(msg: res, color: Colors.black, txtColor: Colors.white);
    return res;
  }
  Future<String> deletePost(String postId) async {
    String res = "Some error occurred";
    try {
      await _fireStore.collection('posts').doc(postId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
  Future<void> followUser(
      String uid,
      String followId
      ) async {
    try {
      DocumentSnapshot snap = await _fireStore.collection('users').doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];

      if(following.contains(followId)) {
        await _fireStore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });

        await _fireStore.collection('users').doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await _fireStore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });

        await _fireStore.collection('users').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }

    } catch(e) {
      print(e.toString());
    }
  }
}
