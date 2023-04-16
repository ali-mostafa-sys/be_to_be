

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/auth/domain/entity/login_entity/login_entity.dart';
import 'package:be_to_be/features/auth/domain/entity/login_entity/login_response_entity.dart';
import 'package:be_to_be/features/auth/domain/entity/register_entity/register_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepositories {
Future <Either<Failure,LoginResponseEntity>> postLogin(LoginEntity loginEntity);

Future <Either<Failure,Unit>> postRegister(RegisterEntity registerEntity);
///  here for forget password
Future<Either<Failure,Unit>>getForgerPasswordCode(String email);
Future<Either<Failure,Unit>>postNewPassword({required String email,required String password,required String code});

}