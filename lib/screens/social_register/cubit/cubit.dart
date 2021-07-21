import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/models.dart';
import 'package:social_app/screens/social_register/cubit/states.dart';


class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    @required String? name,
    @required String? email,
    @required String? password,
    @required String? phone,
  }) {
    print('hello');

    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    )
        .then((value) {
      userCreate(
        uId: value.user!.uid,
        phone: phone!,
        email: email,
        name: name!,

      );
    }).catchError((error) {
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    @required String? name,
    @required String? email,
    @required String? phone,
    @required String? uId,
  }) {
    SocialUserModel model = SocialUserModel(
      name: name!,
      email: email!,
      phone: phone!,
      uId: uId!,
      bio: 'write you bio ...',
      cover: 'https://uploads-ssl.webflow.com/5d815dacb45c9150dc1aca1d/5e6eb2450f8bc355d2b9d2e9_42%20A.jpg',
      image: 'https://image.freepik.com/free-photo/photo-attractive-bearded-young-man-with-cherful-expression-makes-okay-gesture-with-both-hands-likes-something-dressed-red-casual-t-shirt-poses-against-white-wall-gestures-indoor_273609-16239.jpg',
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value)
    {
          emit(SocialCreateUserSuccessState());
    })
        .catchError((error) {
          print(error.toString());
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SocialRegisterChangePasswordVisibilityState());
  }
}