import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/bloc/mode_bloc.dart';
import '../modules/search/search_screen.dart';
import '../logic/bloc/news_bloc.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsCubit newsCubit = NewsCubit.get(context);
    ModeCubit modeCubit = ModeCubit.get(context);
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ));
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {
                  modeCubit.changeThemeMode();
                },
                icon: const Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: newsCubit.currentIndex,
            onTap: (index) {
              newsCubit.changeBottomNavBar(index);
            },
            items: newsCubit.bottomBarItems,
          ),
          body: newsCubit.screens[newsCubit.currentIndex],
        );
      },
    );
  }
}
