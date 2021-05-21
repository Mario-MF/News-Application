abstract class AppStates{}
class AppInitialStates extends AppStates{}

class AppChangeBtmNavStates extends AppStates{}

class AppGetBusinessLoadingStates extends AppStates{}
class AppGetBusinessSuccessStates extends AppStates{}
class AppGetBusinessErrorStates extends AppStates{
  final String error;
  AppGetBusinessErrorStates(this.error);

}
class AppGetSportsLoadingStates extends AppStates{}
class AppGetSportsSuccessStates extends AppStates{}
class AppGetSportsErrorStates extends AppStates{
  final String error;
  AppGetSportsErrorStates(this.error);
}

class AppGetScienceLoadingStates extends AppStates{}
class AppGetScienceSuccessStates extends AppStates{}
class AppGetScienceErrorStates extends AppStates{
  final String error;
  AppGetScienceErrorStates(this.error);
}
class AppGetTechnologyLoadingStates extends AppStates{}
class AppGetTechnologySuccessStates extends AppStates{}
class AppGetTechnologyErrorStates extends AppStates{
  final String error;
  AppGetTechnologyErrorStates(this.error);
}
class AppSearchLoadingStates extends AppStates{}
class AppSearchSuccessStates extends AppStates{}
class AppSearchErrorStates extends AppStates{
  final String error;
  AppSearchErrorStates(this.error);
}

class AppChangeThemeModeStates extends AppStates{}





