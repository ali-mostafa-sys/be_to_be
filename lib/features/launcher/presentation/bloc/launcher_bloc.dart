import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'launcher_event.dart';
part 'launcher_state.dart';

class LauncherBloc extends Bloc<LauncherEvent, LauncherState> {

  static LauncherBloc get(context)=>BlocProvider.of(context);

  final SharedPreferences sharedPreferences;





  LauncherBloc({
    required this.sharedPreferences,
}) : super(LauncherInitial()) {
    on<LauncherEvent>((event, emit)async {
      if(event is LauncherPageEvent){
        emit(LauncherPageState());
      }

    });
  }
}
