import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'mode_states.dart';
import '../../network/local/cache_helper.dart';

class ModeCubit extends Cubit<ModeStates> {
  ModeCubit() : super(InitialThemeModeStates());

  static ModeCubit get(BuildContext context) => BlocProvider.of(context);

  bool isDark = false;

  void changeThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then(
        (value) => emit(NewsThemeModeStates()),
      );
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then(
        (value) => emit(NewsThemeModeStates()),
      );
    }
  }
}
