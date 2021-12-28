import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jokenpo/app_widget.dart';

import 'app_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const AppWidget()),
    blocObserver: AppBlocObserver(),
  );
}
