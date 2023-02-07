import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/verification_account/domain/usecase/get_verification_usecase/get_verification_usecase.dart';
import 'package:be_to_be/features/verification_account/domain/usecase/post_verification_code_usecase/post_verification_code_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  static VerificationBloc get(context)=>BlocProvider.of(context);
  final PostVerificationCodeUseCase verificationCodeUseCase;
  final GetVerificationCodeUseCase getVerificationCodeUseCase;

final  SharedPreferences sharedPreferences;
 bool? byPhone;
 String?email;
 String?phone;
  String? loginName;

  VerificationBloc({
    required this.sharedPreferences,
    required this.verificationCodeUseCase,
    required this.getVerificationCodeUseCase,

  }) : super(VerificationInitial()) {
    on<VerificationEvent>((event, emit)async {

      ///
      /// here for get verification code
      ///
      if(event is GetOTPCodeEvent){
        byPhone= sharedPreferences.getBool('byPhone');
        email= sharedPreferences.getString('email');
        phone= sharedPreferences.getString('phone');

        if(byPhone==true){
          loginName=phone!;
        }else{
          loginName=email;
        }
        emit(LoadingGetOTPCodeState());
        final failureOrGetCode=await verificationCodeUseCase(loginName??'');
        failureOrGetCode.fold
          ((failure) {
          emit(ErrorGetOTPCodeState(error: _mapFailureToMessage(failure)));
        },
                (code) {
                  emit(LoadedGetOTPCodeState());


                });



        emit(OnOpenVerificationPageState());
      }

      ///
      /// here for send OTP code
      ///
      if(event is SendOTPMessageEvent){
        emit(LoadingSendOTPCodeState());
        final failureOrSent=await getVerificationCodeUseCase(loginName: event.loginName,code: event.code);
        failureOrSent.fold(
                (failure) {
                  emit(ErrorSendOTPCodeState(error: _mapFailureToMessage(failure)));
                },
                (sent) {
                  emit(LoadedSendOTPCodeState());
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
      case VerificationConflictFailure:
        return verificationConflictMessage;


      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
