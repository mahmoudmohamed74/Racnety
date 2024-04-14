import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

class ServerFailure extends Failure {
  const ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure("Connection Time Out With Api Server");
      case DioExceptionType.sendTimeout:
        return const ServerFailure("Send Time Out With Api Server");

      case DioExceptionType.receiveTimeout:
        return const ServerFailure("Receive Time Out With Api Server");
      case DioExceptionType.badCertificate:
        return const ServerFailure("Bad Certificate Exception");

      case DioExceptionType.badResponse:
        {
          if (kDebugMode) {
            print(dioError.response!.data);
          }
          return ServerFailure.fromResponse(
            dioError.response!.statusCode,
            dioError.response!.data,
          );
        }
      case DioExceptionType.cancel:
        return const ServerFailure("Cancel Exception");

      case DioExceptionType.connectionError:
        return const ServerFailure("No Internet Connection");

      case DioExceptionType.unknown:
        return const ServerFailure("unknown Exception");
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 402) {
      return ServerFailure("Authentication Error: ${response['title']}");
    } else if (statusCode == 404) {
      return const ServerFailure(
          "The requested resource was not found. Please try again later.");
    } else if (statusCode == 500) {
      return const ServerFailure(
          "Server Error: Something went wrong on our end. Please try again later.");
    } else {
      return const ServerFailure(
          "An unexpected error occurred. Please try again later.");
    }
  }
}

class LocalDataDataBaseFailure extends Failure {
  const LocalDataDataBaseFailure(super.errorMessage);
}
