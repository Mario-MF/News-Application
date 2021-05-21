import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapplication/shared/components/styles.dart';
import 'package:newsapplication/shared/cubit/app_cubit.dart';
import 'package:newsapplication/shared/cubit/app_states.dart';
import 'package:newsapplication/shared/network/local/cache_helper.dart';
import 'package:newsapplication/shared/network/remote/dio_helper.dart';

import 'layout/home_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark=CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
 final bool isDark;
 MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..getSports()..getBusiness()..getScience()..getTechnology()..changeAppMode(fromShared: isDark),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme:
            ThemeData(

                primarySwatch: Colors.blue,appBarTheme:AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                    color: Colors.blue,fontSize: 10
                ),
              iconTheme: IconThemeData(color: Colors.black)

            )
            ),
            darkTheme: ThemeData(
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                    backgroundColor: HexColor('333739'),
                    systemOverlayStyle:SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light,
                    ),elevation: 0.0,titleTextStyle: TextStyle(
                    color: Colors.white,fontSize: 20
                )),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    unselectedItemColor: Colors.white,
                    unselectedLabelStyle:white14regular() ,
                    elevation: 10,
                    backgroundColor: HexColor('333739')
                ),
                textTheme: TextTheme(
                    bodyText1:white18regular(),
                    bodyText2:white14regular(),
                )
            ),
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark:ThemeMode.light,
            home: HomeLayout(),
          );
        },
      ),
    );
  }
}
