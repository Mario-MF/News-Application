import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/modules/search/search_screen.dart';
import 'package:newsapplication/shared/components/components.dart';
import 'package:newsapplication/shared/cubit/app_cubit.dart';
import 'package:newsapplication/shared/cubit/app_states.dart';
import 'package:newsapplication/shared/network/remote/dio_helper.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {
        // if(state is AppNewPostStates){
        //   navigateTo(context, NewPostScreen());
        //}
      },
      builder: (BuildContext context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
            actions: [
              IconButton(icon: Icon(Icons.search,), onPressed: (){
                navigateTo(context, SearchScreen());
              }),
              IconButton(icon: Icon(Icons.wb_incandescent_outlined,),
                  onPressed: (){
                AppCubit.get(context).changeAppMode();
              }),
            ],

          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     DioHelper.getData(
          //       url: 'v2/top-headlines',
          //       query: {
          //         'country': 'us',
          //         'category': 'business',
          //         'apiKey': '885b42c1357b4af8bdba724466d4c08d'
          //       },
          //     ).then((value) {
          //       print(value.data.toString());
          //     }).catchError((error) {
          //       print(error.toString());
          //     });
          //   },
          // ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_baseball),
                label: 'Sports',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.science_outlined),
                label: 'Science',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.adb_outlined),
                label: 'Technology',
              ),

            ],
          ),
        );
      },
    );
  }
}
