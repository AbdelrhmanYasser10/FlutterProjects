import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:social_app/models/models.dart';
import 'package:social_app/screens/news_feed/news_feed.dart';
import 'package:social_app/shared/components/constants.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  SocialUserModel? model;

  void getUserData()
  {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value)
    {
      model = SocialUserModel.fromJason(value.data()!);
      emit(SocialGetUserSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));

    });
  }

  int currentIndex = 0;

  List<Widget> screens =
  [
    NewsFeedScreen(),
    /*
    ChatsScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingsScreen(),*/
  ];

  List<String> titles =
  [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings',
  ];

  void changeBottomNav(int index)
  {
    if(index == 2)
      emit(SocialNewPostState());
    else
    {
      currentIndex = index;
      emit(SocialChangeBottomNavState());
    }
  }
}