import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/auth/domain/entity/login_entity/login_entity.dart';
import 'package:be_to_be/features/auth/domain/usecase/login_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/strings/const.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static LoginBloc get(context)=>BlocProvider.of(context);
  final LoginUseCase loginUseCase;

   bool obSecure=true;

  LoginBloc({required this.loginUseCase,}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit)async {
      ///
      /// here for login event
      ///
      if(event is LoginButtonEvent){
        emit(LoadingLoginState());

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

      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
