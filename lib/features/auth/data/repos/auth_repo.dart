import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parking_app/core/requests/forget_password_request.dart';
import 'package:parking_app/core/requests/login_request.dart';
import 'package:parking_app/core/requests/register_request.dart';
import 'package:parking_app/features/auth/data/models/user_model.dart';

import '../../../../core/errors/failure.dart';

abstract class BaseAuthRepo {
  Future<Either<Failure, Response<dynamic>>> register(
    RegisterRequest registerRequest,
  );
  Future<Either<Failure, UserModel>> login(LoginRequest loginRequest);
  Future<Either<Failure, Response<dynamic>>> forgerPassword(
    ForgotPasswordRequest forgotPasswordRequest,
  );
}
