import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/buisness_screen.dart';
import 'package:news_app/modules/entertinment/entertainment_screen.dart';
import 'package:news_app/modules/health/health_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitial());

  NewsCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;

  List screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    EntertainmnetScreen(),
    HealthScreen()
  ];

  List<BottomNavigationBarItem> bottomBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.games), label: 'Entertainment'),
    BottomNavigationBarItem(
        icon: Icon(Icons.health_and_safety), label: 'Health'),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }
}
