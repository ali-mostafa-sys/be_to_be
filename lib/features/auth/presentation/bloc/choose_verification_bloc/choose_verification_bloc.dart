import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'choose_verification_event.dart';
part 'choose_verification_state.dart';

class ChooseVerificationBloc extends Bloc<ChooseVerificationEvent, ChooseVerificationState> {

  static ChooseVerificationBloc get(context)=>BlocProvider.of(context);
  final SharedPreferences sharedPreferences;
  bool byPhone = false;
  bool byEmail = false;
  ChooseVerificationBloc({required this.sharedPreferences}) : super(ChooseVerificationInitial()) {
    on<ChooseVerificationEvent>((event, emit) async{
      if(event is VerificationByPhoneOrEmailEvent){
        byPhone=event.byPhone;
        byEmail=event.byEmail;
       await sharedPreferences.setBool('byPhone', event.byPhone);
       await sharedPreferences.setBool('byEmail', event.byEmail);
        emit(VerificationByPhoneOrEmailState(byPhone: byPhone, byEmail: byEmail));
      }
    });
  }
}
