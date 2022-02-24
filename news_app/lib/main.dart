import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'bloc_observer.dart';
import 'design/news_layout.dart';
import 'logic/bloc/mode_bloc.dart';
import 'logic/bloc/mode_states.dart';
import 'logic/bloc/news_bloc.dart';
import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        isDark: isDark,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({Key? key, this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<NewsCubit>(
              create: (BuildContext context) => NewsCubit()..getBusiness()),
          BlocProvider<ModeCubit>(
            create: (BuildContext context) =>
                ModeCubit()..changeThemeMode(fromShared: isDark),
          ),
        ],
        child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return BlocBuilder<ModeCubit, ModeStates>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'News App',
                  themeMode: ModeCubit.get(context).isDark
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  darkTheme: ThemeData(
                    primaryColorDark: Colors.deepOrange,
                    textTheme: const TextTheme(
                      bodyText1: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      backgroundColor: HexColor('333739'),
                      selectedLabelStyle: const TextStyle(fontSize: 10),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 9,
                      ),
                      unselectedItemColor: Colors.white60,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.deepOrangeAccent,
                      elevation: 20.0,
                    ),
                    dividerColor: Colors.grey,
                    primarySwatch: Colors.deepOrange,
                    scaffoldBackgroundColor: HexColor('333739'),
                    appBarTheme: AppBarTheme(
                      titleSpacing: 20.0,
                      iconTheme: const IconThemeData(
                        color: Colors.white,
                      ),
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: HexColor('333739'),
                        statusBarIconBrightness: Brightness.light,
                      ),
                      backgroundColor: HexColor('333739'),
                      elevation: 0.0,
                      titleTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  theme: ThemeData(
                    primaryColorLight: Colors.deepOrange,
                    textTheme: const TextTheme(
                      bodyText1: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    primarySwatch: Colors.deepOrange,
                    scaffoldBackgroundColor: Colors.white,
                    appBarTheme: const AppBarTheme(
                      titleSpacing: 20.0,
                      iconTheme: IconThemeData(
                        color: Colors.black,
                      ),
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark,
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    bottomNavigationBarTheme:
                        const BottomNavigationBarThemeData(
                      selectedLabelStyle: TextStyle(fontSize: 10),
                      unselectedLabelStyle: TextStyle(fontSize: 9),
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.deepOrangeAccent,
                      elevation: 20.0,
                    ),
                  ),
                  home: const NewsLayout(),
                );
              },
            );
          },
        ));
  }
}
