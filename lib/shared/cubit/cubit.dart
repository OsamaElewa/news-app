import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/businesses/business_screen.dart';
import 'package:newsapp/modules/science/science_screen.dart';
import 'package:newsapp/modules/settings_screen/settingsScreen.dart';
import 'package:newsapp/modules/sports/sports_screen.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'package:newsapp/shared/network/local/cache_helper.dart';

import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState>{

  NewsCubit():super(NewsInitialState());

  static NewsCubit get(context)=> BlocProvider.of(context);

  int currentIndex=0;

  List<Widget> Screens=[
    Businesspage(),
    Sportspage(),
    Sciencepage(),
    Settingpage(),
  ];

  List<BottomNavigationBarItem> bottomItems=[

    const BottomNavigationBarItem(
        icon: Icon(Icons.business),
      label: 'Business',
    ),

    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),

    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),

    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),

  ];

  bool isDark=false;
 // IconData myIcon=Icons.brightness_3_rounded;
  void changeAppMode({bool? fromshared}){
    if(fromshared!=null) {
      isDark=fromshared;
      emit(NewsChangeModeState());
    } else {
      isDark= !isDark;
      CacheHelper.putdata(key: 'isDark', value: isDark).then((value){
        emit(NewsChangeModeState());
      });
    }
  }

  void Changeindex(index){
    currentIndex=index;
    if(index==1) {
      GetSport();
    }
    if(index==2) {
      GetScience();
    }
    emit(NewsBottomNavState());
  }




  List<dynamic> search=[];
  void GetSearch(String value){
    DioHelper.getdata(
      url: 'v2/everything',
      query:
      {
        'q' : value,
        'apiKey' :'5de91158e349434ba986828607121ed3',
      },
    ).then((value)
    {
      search=value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> business=[];
  void GetBusiness(){
    emit(NewsGetBusinessLoadingState());
    if(business.isEmpty){
      DioHelper.getdata(
        url: 'v2/top-headlines',
        query:
        {
          'country' : 'eg',
          'category' : 'business',
          'apiKey' :'5de91158e349434ba986828607121ed3',
        },
      ).then((value)
      {
        business=value.data['articles'];

        print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    }else{
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> sport=[];
  void GetSport(){
    emit(NewsGetSportsLoadingState());
    if(sport.isEmpty)
      {
        DioHelper.getdata(
          url: 'v2/top-headlines',
          query:
          {
            'country' : 'eg',
            'category' : 'sports',
            'apiKey' :'5de91158e349434ba986828607121ed3',
          },
        ).then((value)
        {
          sport=value.data['articles'];

          print(sport[0]['title']);
          emit(NewsGetSportsSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsGetSportsErrorState(error.toString()));
        });
      }else{
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science=[];
  void GetScience(){
    emit(NewsGetScienceLoadingState());
    if(science.isEmpty)
      {
        DioHelper.getdata(
          url: 'v2/top-headlines',
          query:
          {
            'country' : 'eg',
            'category' : 'science',
            'apiKey' :'5de91158e349434ba986828607121ed3',
          },
        ).then((value)
        {
          science=value.data['articles'];

          print(science[0]['title']);
          emit(NewsGetScienceSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsGetScienceErrorState(error.toString()));
        });
      }else{
      emit(NewsGetScienceSuccessState());
    }

  }



  //tests/test_2/public/api/test
}