import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/modules/home/home.dart';
import 'package:newsapplication/modules/science/home.dart';
import 'package:newsapplication/modules/sports/home.dart';
import 'package:newsapplication/modules/technology/technology.dart';
import 'package:newsapplication/shared/cubit/app_states.dart';
import 'package:newsapplication/shared/network/local/cache_helper.dart';
import 'package:newsapplication/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    SportsScreen(),
    ScienceScreen(),
    TechnologyScreen(),
  ];
  List<String> titles = [
    'Business',
    'Sports',
    'Science',
    'Technology',

  ];



  void changeBottomNav(int index) {
      currentIndex = index;
      emit(AppChangeBtmNavStates());

  }
  List <dynamic> business=[];
  void getBusiness(){
    emit(AppGetBusinessLoadingStates());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '885b42c1357b4af8bdba724466d4c08d'
      },
    ).then((value) {
      business=value.data['articles'];
      emit(AppGetBusinessSuccessStates());
      print(value.data.toString());
    }).catchError((error) {
      emit(AppGetBusinessErrorStates(
        error.toString()
      ));
      print(error.toString());
    });
  }

  List <dynamic> sports=[];
  void getSports(){
    emit(AppGetSportsLoadingStates());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': '885b42c1357b4af8bdba724466d4c08d'
      },
    ).then((value) {
      sports=value.data['articles'];
      emit(AppGetSportsSuccessStates());
      print(value.data.toString());
    }).catchError((error) {
      emit(AppGetSportsErrorStates(
        error.toString()
      ));
      print(error.toString());
    });
  }

  List <dynamic> science=[];
  void getScience(){
    emit(AppGetScienceLoadingStates());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '885b42c1357b4af8bdba724466d4c08d'
      },
    ).then((value) {
      science=value.data['articles'];
      emit(AppGetScienceSuccessStates());
      print(value.data.toString());
    }).catchError((error) {
      emit(AppGetScienceErrorStates(
        error.toString()
      ));
      print(error.toString());
    });
  }
  List <dynamic> technology=[];
  void getTechnology(){
    emit(AppGetTechnologyLoadingStates());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'technology',
        'apiKey': '885b42c1357b4af8bdba724466d4c08d'
      },
    ).then((value) {
      technology=value.data['articles'];
      emit(AppGetTechnologySuccessStates());
      print(value.data.toString());
    }).catchError((error) {
      emit(AppGetTechnologyErrorStates(
        error.toString()
      ));
      print(error.toString());
    });
  }

  List <dynamic> search=[];
  void getSearch(String value){
    emit(AppSearchLoadingStates());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '885b42c1357b4af8bdba724466d4c08d'
      },
    ).then((value) {
      search=value.data['articles'];
      emit(AppSearchSuccessStates());
      print(value.data.toString());
    }).catchError((error) {
      emit(AppSearchErrorStates(
        error.toString()
      ));
      print(error.toString());
    });
  }


  bool isDark =false;
  void changeAppMode({bool fromShared}){
    if(fromShared !=null)
      {
        isDark = fromShared;
        emit(AppChangeThemeModeStates());  
      }
    else
      {
        isDark =! isDark;
        CacheHelper.putBoolean(key: 'isDark',value: isDark).then((value) {
          emit(AppChangeThemeModeStates());
        });
      }


  }

}