import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:parking_app/core/errors/failure.dart';
import 'package:parking_app/core/network/connectivity_service.dart';
import 'package:parking_app/core/network/dio_factory.dart';
import 'package:parking_app/core/network/end_points.dart';
import 'package:parking_app/core/requests/forget_password_request.dart';
import 'package:parking_app/core/requests/login_request.dart';
import 'package:parking_app/core/requests/register_request.dart';
import 'package:parking_app/features/auth/data/models/user_model.dart';
import 'package:parking_app/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements BaseAuthRepo {
  final DioFactory dioFactory;
  final ConnectivityService connectivityService;

  AuthRepoImpl(this.dioFactory, this.connectivityService);
  @override
  Future<Either<Failure, Response<dynamic>>> register(
    RegisterRequest registerRequest,
  ) async {
    if (await connectivityService.isOnline()) {
      try {
        final result = await dioFactory.postReq(
          endPoint: EndPoints.registerEndPoint,
          data: registerRequest.toJson(),
        );

        return right(result);
      } on Exception catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
      }
    } else {
      return left(const ServerFailure("No internet connection"));
    }
  }

  @override
  Future<Either<Failure, UserModel>> login(
    LoginRequest loginRequest,
  ) async {
    if (await connectivityService.isOnline()) {
      try {
        final response = await dioFactory.postReq(
          endPoint: EndPoints.loginEndPoint,
          data: loginRequest.toJson(),
        );
        final userData = UserModel.fromJson(response.data);
        if (kDebugMode) {
          print("userData${userData.toString()}");
        }
        return right(userData);
      } on Exception catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
      }
    } else {
      return left(const ServerFailure("No internet connection"));
    }
  }

  @override
  Future<Either<Failure, Response<dynamic>>> forgerPassword(
    ForgotPasswordRequest forgotPasswordRequest,
  ) async {
    if (await connectivityService.isOnline()) {
      try {
        final result = await dioFactory.putReq(
          endPoint: EndPoints.forgetPasswordEndPoint,
          data: forgotPasswordRequest.toJson(),
        );

        return right(result);
      } on Exception catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
      }
    } else {
      return left(const ServerFailure("No internet connection"));
    }
  }
}
