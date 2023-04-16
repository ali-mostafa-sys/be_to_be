import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/auth/domain/usecase/get_code_forget_password_usecase.dart';
import 'package:be_to_be/features/auth/domain/usecase/post_new_password_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  static ForgetPasswordBloc get(context)=>BlocProvider.of(context);
  final GetForgetPasswordUseCase getForgetPasswordUseCase;
  final PostNewPasswordUseCase postNewPasswordUseCase;





  ForgetPasswordBloc({
    required this.postNewPasswordUseCase,
    required this.getForgetPasswordUseCase,
}) : super(ForgetPasswordInitial()) {
    on<ForgetPasswordEvent>((event, emit)async {
      ///
      /// here for get code event
      ///
      if(event is GetCodeEvent){
        emit(LoadingGetCodeState());
        final failureOrAliMostafa=await getForgetPasswordUseCase(event.email);
        failureOrAliMostafa.fold(
                (failure) {
                  emit(ErrorGetCodeState(error: _mapFailureToMessage(failure)));
                },
                (getCode) {
                  emit(LoadedGetCodeState());
                });

      }
      ///
      /// here for post new password
      ///

      if(event is PostNewPasswordEvent){
        emit(LoadingPostNewPasswordState());
        final failureOrPostPassword=await postNewPasswordUseCase(password: event.password,email: event.email,code: event.code);
        failureOrPostPassword.fold(
                (failure) {
                  emit(ErrorPostNewPasswordState(error: _mapFailureToMessage(failure)));
                },
                (newPassword) {
                  emit(LoadedPostNewPasswordState());
                });
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
