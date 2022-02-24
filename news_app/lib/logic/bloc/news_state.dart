part of 'news_bloc.dart';

abstract class NewsStates {}

class NewsInitial extends NewsStates {}

class NewsGetBusinessLoadingStates extends NewsStates {}

class NewsGetBusinessSuccessStates extends NewsStates {}

class NewsGetBusinessErrorStates extends NewsStates {
  final String message;

  NewsGetBusinessErrorStates(this.message);
}

class NewsGetEntertainmentLoadingStates extends NewsStates {}

class NewsGetEntertainmentSuccessStates extends NewsStates {}

class NewsGetEntertainmentErrorStates extends NewsStates {
  final String message;

  NewsGetEntertainmentErrorStates(this.message);
}

class NewsGetSportsLoadingStates extends NewsStates {}

class NewsGetSportsSuccessStates extends NewsStates {}

class NewsGetSportsErrorStates extends NewsStates {
  final String message;

  NewsGetSportsErrorStates(this.message);
}

class NewsGetScienceLoadingStates extends NewsStates {}

class NewsGetScienceSuccessStates extends NewsStates {}

class NewsGetScienceErrorStates extends NewsStates {
  final String message;

  NewsGetScienceErrorStates(this.message);
}

class NewsGetHealthLoadingStates extends NewsStates {}

class NewsGetHealthSuccessStates extends NewsStates {}

class NewsGetHealthErrorStates extends NewsStates {
  final String message;

  NewsGetHealthErrorStates(this.message);
}

class NewsGetSearchLoadingStates extends NewsStates {}

class NewsGetSearchSuccessStates extends NewsStates {}

class NewsGetSearchErrorStates extends NewsStates {
  final String message;

  NewsGetSearchErrorStates(this.message);
}

class NewsBottomNavState extends NewsStates {}
