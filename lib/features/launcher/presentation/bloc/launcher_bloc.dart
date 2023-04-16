import 'dart:async';

import 'package:be_to_be/features/launcher/domain/usecase/get_cities_usecase/get_luancher_cities_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'launcher_event.dart';

part 'launcher_state.dart';

class LauncherBloc extends Bloc<LauncherEvent, LauncherState> {
  static LauncherBloc get(context) => BlocProvider.of(context);

  final GetLauncherCitiesUseCase getLauncherCitiesUseCase;
  final SharedPreferences sharedPreferences;

  LauncherBloc({
    required this.sharedPreferences,
    required this.getLauncherCitiesUseCase,
  }) : super(LauncherInitial()) {
    on<LauncherEvent>((event, emit) async {
      if (event is LauncherPageEvent) {
        emit(LauncherPageState());
      }

    });
  }
}
