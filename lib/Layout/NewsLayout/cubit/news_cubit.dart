import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Layout/NewsLayout/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Modules/business/business_screen.dart';
import 'package:news_app/Modules/science/science_screen.dart';
import 'package:news_app/Modules/settings/settings_screen.dart';
import 'package:news_app/Modules/sports/sports_screen.dart';
import 'package:news_app/Network/dio/dio_helper/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit(): super(NewsInitialState());

  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> items=[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];


  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  List<dynamic> business=[];
  List<dynamic> sports=[];
  List<dynamic> science=[];

  void changeIndex(int index){
    currentIndex = index;
    switch(index){
        case 1:
        getSportsNews();
        break;
        case 2:
          getScienceNews();
       break;
    }
    emit(NewsChangeNav());
  }

  void getBusinessNews(){
    emit(BusinessLoadingNewsState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'65d60855371f462f956b9d4095ec4b0f',
        }).then((value){
          business = value.data['articles'];
          emit(GetBusinessNewsSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(GetBusinessNewsErrorState(error.toString()));
        });
  }
  void getSportsNews(){
    emit(SportsLoadingNewsState());
    if(sports.length==0) {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'sports',
            'apiKey': '65d60855371f462f956b9d4095ec4b0f',
          }).then((value) {
        sports = value.data['articles'];
        emit(GetSportsNewsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetSportsNewsErrorState(error.toString()));
      });
    }
    else{
      emit(GetSportsNewsSuccessState());

    }
  }
  void getScienceNews(){
    emit(ScienceLoadingNewsState());
    if(science.length == 0) {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'science',
            'apiKey': '65d60855371f462f956b9d4095ec4b0f',
          }).then((value) {
        science = value.data['articles'];
        emit(GetScienceNewsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetScienceNewsErrorState(error.toString()));
      });
    }
    else{
      emit(GetScienceNewsSuccessState());

    }
  }



}