import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/auth/domain/entity/login_entity/login_entity.dart';
import 'package:be_to_be/features/auth/domain/usecase/login_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/strings/const.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static LoginBloc get(context)=>BlocProvider.of(context);
  final LoginUseCase loginUseCase;
  final SharedPreferences sharedPreferences;
  final TextEditingController emailText = TextEditingController();
  final TextEditingController passwordText = TextEditingController();
  final TextEditingController phoneText = TextEditingController();

   bool obSecure=true;
   String token='';
   String email='';
   String password='';
   String notes='';
   bool byEmail=false;





  LoginBloc({
    required this.loginUseCase,
    required this.sharedPreferences,

  }) : super(LoginInitial()) {
    on<LoginEvent>((event, emit)async {
      ///
      /// here for login event
      ///
      if(event is LoginButtonEvent){
        emit(LoadingLoginState());
        await sharedPreferences.setString('password', event.loginEntity.password);
        await sharedPreferences.setString('email', emailText.text.toString());
        await sharedPreferences.setString('phone', phoneText.text.toString());


        final failureOrLogin=await loginUseCase(event.loginEntity);

        failureOrLogin.fold(
                (failure)async {
                  emit(ErrorLoginState(error: _mapFailureToMessage(failure)));
                },
                (login)async {





                  emit(LoadedLoginState());
                }
        );


      }



      ///
      /// // change obSecure of password
      ///
      if(event is ChangeObSecurePasswordEvent){
        obSecure= !obSecure;
        emit(ChangeObSecurePasswordState(obSecure: obSecure));
      }
      ///
      /// here for get token
      ///

      if(event is GetTokenEvent){
         token=sharedPreferences.getString('token').toString();
         email=sharedPreferences.getString('email').toString();
         password=sharedPreferences.getString('password').toString();
         notes=sharedPreferences.getString('notes').toString();
         emailText.text=sharedPreferences.getString('email')==null?'':sharedPreferences.getString('email').toString();
         passwordText.text=sharedPreferences.getString('password')==null?'':sharedPreferences.getString('password').toString();
         byEmail=sharedPreferences.getBool('byEmail')!;
         phoneText.text=sharedPreferences.getString('phone')==null?'':sharedPreferences.getString('phone').toString();
          emit(GetTokenState());

      }



    });
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case OfflineFailure:
        return offlineFailureMessage;
      case InvalidEmailAndPasswordFailure:
        return invalidEmailAndPasswordFailureMessage;
      case AccountNotVerificationFailure:
        return accountNotVerificationFailureMessage;
      case UnAcceptedAccountFailure:
        return unAcceptedAccountFailureMessage;
      case GoToProfileFailure:
        return goToProfileFailureMessage;

      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
