import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/auth/domain/entity/register_entity/register_entity.dart';
import 'package:be_to_be/features/auth/domain/usecase/register_usecase.dart';
import 'package:be_to_be/features/verification_account/domain/usecase/get_verification_usecase/get_verification_usecase.dart';
import 'package:be_to_be/features/verification_account/domain/usecase/post_verification_code_usecase/post_verification_code_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  static VerificationBloc get(context)=>BlocProvider.of(context);
  final PostVerificationCodeUseCase verificationCodeUseCase;
  final GetVerificationCodeUseCase getVerificationCodeUseCase;
  final RegisterUseCase registerUseCase;

final  SharedPreferences sharedPreferences;
 bool? byPhone;
 String?email;
 String?phone;
  String? loginName;

  ///
  /// here for register
  ///
  Future register(RegisterEntity registerEntity)async{


  final failureOrRegister=  await registerUseCase(registerEntity);

  failureOrRegister.fold(
          (failure) {
            emit(ErrorRegisterVState(error: _mapFailureToMessage(failure)));
      },
          (register) {
            emit(LoadedSendOTPCodeState());
      });
  }


  VerificationBloc({
    required this.sharedPreferences,
    required this.verificationCodeUseCase,
    required this.getVerificationCodeUseCase,
    required this.registerUseCase,

  }) : super(VerificationInitial()) {
    on<VerificationEvent>((event, emit)async {

      ///
      /// here for get verification code
      ///
      if(event is GetOTPCodeEvent){
        byPhone= event.byEmail;
        email= sharedPreferences.getString('email');
        phone= sharedPreferences.getString('phone');
        print(email);
        print(phone);

        if(event.byEmail==false){
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
                  emit(LoadingRegisterVState());
                  if(byPhone==true){
                    register(event.registerEntity);
                  }


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
      case DuplicateUserFailure:
        return duplicateUserFailureMessage;
      case InvalidEmailFailure:
        return invalidEmailFailureMessage;


      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
