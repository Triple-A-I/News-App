import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/business/buisness_screen.dart';
import '../../modules/entertinment/entertainment_screen.dart';
import '../../modules/health/health_screen.dart';
import '../../modules/science/science_screen.dart';
import '../../modules/sports/sports_screen.dart';
import '../../network/remote/dio_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;

  List screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    EntertainmnetScreen(),
    HealthScreen(),
    // SettingsScreen(),
  ];

  List<BottomNavigationBarItem> bottomBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.games), label: 'Entertainment'),
    BottomNavigationBarItem(
        icon: Icon(Icons.health_and_safety), label: 'Health'),
    // BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) {
      getBusiness();
    } else if (index == 1) {
      getSports();
    } else if (index == 2) {
      getScience();
    } else if (index == 3) {
      getEntertainment();
    } else if (index == 4) {
      getHealth();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  List<dynamic> entertainment = [];
  List<dynamic> sports = [];
  List<dynamic> health = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingStates());
    if (business.isEmpty) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "business",
        "apiKey": "525978ee8bb64f51bd70af647fc1d638"
      }).then(
        // ignore: avoid_print
        (value) {
          // print(value.data.toString());
          business = value.data["articles"];
          // ignore: avoid_print
          print(business[2].title);
          emit(NewsGetBusinessSuccessStates());
        },
      ).catchError((error) {
        emit(NewsGetBusinessErrorStates(error.toString()));

        // ignore: avoid_print
        print(error.toString());
      });
    } else {
      emit(NewsGetBusinessSuccessStates());
    }
  }

  void getEntertainment() {
    emit(NewsGetEntertainmentLoadingStates());
    if (entertainment.isEmpty) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "entertainment",
        "apiKey": "525978ee8bb64f51bd70af647fc1d638"
      }).then(
        // ignore: avoid_print
        (value) {
          // print(value.data.toString());
          entertainment = value.data["articles"];
          // ignore: avoid_print
          print(entertainment[2].title);
          emit(NewsGetEntertainmentSuccessStates());
        },
      ).catchError((error) {
        emit(NewsGetEntertainmentErrorStates(error.toString()));

        // ignore: avoid_print
        print(error.toString());
      });
    } else {
      emit(NewsGetEntertainmentSuccessStates());
    }
  }

  void getSports() {
    emit(NewsGetSportsLoadingStates());
    if (sports.isEmpty) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "sports",
        "apiKey": "525978ee8bb64f51bd70af647fc1d638"
      }).then(
        // ignore: avoid_print
        (value) {
          // print(value.data.toString());
          sports = value.data["articles"];
          // ignore: avoid_print
          print(sports[2].title);
          emit(NewsGetSportsSuccessStates());
        },
      ).catchError((error) {
        emit(NewsGetSportsErrorStates(error.toString()));

        // ignore: avoid_print
        print(error.toString());
      });
    } else {
      emit(NewsGetSportsSuccessStates());
    }
  }

  void getScience() {
    emit(NewsGetScienceLoadingStates());
    if (science.isEmpty) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "science",
        "apiKey": "525978ee8bb64f51bd70af647fc1d638"
      }).then(
        // ignore: avoid_print
        (value) {
          // print(value.data.toString());
          science = value.data["articles"];
          // ignore: avoid_print
          print(science[2].title);
          emit(NewsGetScienceSuccessStates());
        },
      ).catchError((error) {
        emit(NewsGetScienceErrorStates(error.toString()));

        // ignore: avoid_print
        print(error.toString());
      });
    } else {
      emit(NewsGetScienceSuccessStates());
    }
  }

  void getHealth() {
    emit(NewsGetHealthLoadingStates());
    if (health.isEmpty) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "health",
        "apiKey": "525978ee8bb64f51bd70af647fc1d638"
      }).then(
        // ignore: avoid_print
        (value) {
          // print(value.data.toString());
          health = value.data["articles"];
          // ignore: avoid_print
          print(health[2].title);
          emit(NewsGetHealthSuccessStates());
        },
      ).catchError((error) {
        emit(NewsGetHealthErrorStates(error.toString()));

        // ignore: avoid_print
        print(error.toString());
      });
    } else {
      emit(NewsGetHealthSuccessStates());
    }
  }

  void getSearch(String value) {
    emit(NewsGetSearchLoadingStates());
    if (search.isEmpty) {
      DioHelper.getData(
        url: "v2/everything",
        query: {
          "q": value,
          "apiKey": "525978ee8bb64f51bd70af647fc1d638",
        },
      ).then(
        (value) {
          search = value.data["articles"];
          print(search[2].title);
          emit(NewsGetSearchSuccessStates());
        },
      ).catchError((error) {
        emit(NewsGetSearchErrorStates(error.toString()));

        print(error.toString());
      });
    } else {
      emit(NewsGetSearchSuccessStates());
    }
  }
}
