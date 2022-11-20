import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  static VerificationBloc get(context)=>BlocProvider.of(context);

final  SharedPreferences sharedPreferences;
 bool? byPhone;

  VerificationBloc({required this.sharedPreferences}) : super(VerificationInitial()) {
    on<VerificationEvent>((event, emit)async {
      if(event is OnOpenVerificationPageEvent){
        emit(OnOpeningVerificationPageState());
        byPhone=await sharedPreferences.getBool('byPhone');
        emit(OnOpenVerificationPageState());
      }
    });
  }
}
