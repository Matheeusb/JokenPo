import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    backgroundColor: Colors.black,
    brightness: Brightness.dark,
  );

  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
