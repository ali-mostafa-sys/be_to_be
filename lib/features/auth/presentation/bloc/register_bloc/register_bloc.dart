import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/auth/domain/entity/register_entity/register_entity.dart';
import 'package:be_to_be/features/auth/domain/usecase/register_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  static RegisterBloc get(context) => BlocProvider.of(context);

  final RegisterUseCase registerUseCase;


  TextEditingController phone = TextEditingController();
  var formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController birthDate = TextEditingController();

   bool hasPhone = true;
   bool isPop=false;
   bool obSecure1=true;
   String gender = "Male";
   String date='';

  RegisterBloc({
    required this.registerUseCase
}) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit)async {
      ///
      /// here for obSecure password and confirm password
      ///
      if(event is ChangeObSecurePasswordEvent){
        obSecure1= !obSecure1;
        emit(ChangeObSecurePasswordState(obSecure: obSecure1));
      }




      ///
      /// on phone text form field tap to show alert dialog
      ///
      if (event is OnPhoneFieldTapEvent) {
        isPop= !isPop;
        emit(ShowPhoneDialogState(isPop: isPop));
      }
      ///
      /// on popup next button pressed
      ///
      if (event is OnPhoneNextButtonEvent) {
        emit(OnPhoneNextButtonState(phoneValue: event.phoneNumber));
      }
      ///
      /// here for choose gender
      ///
      if(event is ChooseGenderEvent){
        gender=event.gender;
        emit(ChooseGenderState(gender: gender));
      }
      ///
      /// here for choose has phone and has phone
      ///
      if(event is ChooseHasPhoneEvent){
        hasPhone=event.hasPhone;
        emit(ChooseHasPhoneState(hasPhone: hasPhone));
      }
      ///
      /// here for register event
      ///
      if(event is RegisterButtonEvent){
        emit(LoadingRegisterState());
        final failureOrRegister=await registerUseCase(event.registerEntity);

        failureOrRegister.fold(
                (failure) {
                  emit(ErrorRegisterState(error: _mapFailureToMessage(failure)));
                },
                (register) {
                  emit(LoadedRegisterState());
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
      case DuplicateUserFailure:
        return duplicateUserFailureMessage;
      case InvalidEmailFailure:
        return invalidEmailFailureMessage;
      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
