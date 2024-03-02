import 'package:dartz/dartz.dart';
import 'package:racnety/core/requests/forget_password_request.dart';
import 'package:racnety/core/requests/login_request.dart';
import 'package:racnety/core/requests/register_request.dart';
import 'package:racnety/features/auth/data/models/user_model.dart';

import '../../../../core/errors/failure.dart';

abstract class BaseAuthRepo {
  Future<Either<Failure, void>> register(RegisterRequest registerRequest);
  Future<Either<Failure, UserModel>> login(LoginRequest loginRequest);
  Future<Either<Failure, void>> forgerPassword(
    ForgotPasswordRequest forgotPasswordRequest,
  );
}
