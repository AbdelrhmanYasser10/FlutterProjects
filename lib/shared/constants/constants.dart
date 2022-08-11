
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/modules/add_post_screen/add_post_screen.dart';
import 'package:instagram_clone/modules/profile_screen/profile_screen.dart';
import 'package:instagram_clone/modules/search_screen/search_screen.dart';
import '../../modules/feed_screen/feed_screen.dart';

const webScreenSize = 600;


List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Scaffold(),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid),
];