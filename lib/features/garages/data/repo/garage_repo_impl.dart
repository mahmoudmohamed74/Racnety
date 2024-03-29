import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:parking_app/core/errors/failure.dart';
import 'package:parking_app/core/network/dio_factory.dart';
import 'package:parking_app/features/garages/data/models/garage_model.dart';
import 'package:parking_app/features/garages/data/repo/base_garage_repo.dart';

import '../../../../core/network/end_points.dart';

class GarageRepoImpl implements BaseGarageRepo {
  final DioFactory dioFactory;

  GarageRepoImpl(this.dioFactory);

  @override
  Future<Either<Failure, List<GarageModel>>> getGarages() async {
    try {
      final response = await dioFactory.getReq(
        endPoint: EndPoints.getGaragesEndPoint,
      );
      final List<dynamic> garagesData = response.data;

      final List<GarageModel> garagesList =
          garagesData.map((json) => GarageModel.fromJson(json)).toList();
      if (kDebugMode) {
        print("garages ${garagesList.first.toString()}");
      }
      return right(garagesList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GarageModel>>> getGaragesInfo() async {
    try {
      final response = await dioFactory.getReq(
        endPoint: EndPoints.getGaragesInfoEndPoint,
      );
      final List<dynamic> garagesInfoData = response.data;

      final List<GarageModel> garagesInfoList =
          garagesInfoData.map((json) => GarageModel.fromJson(json)).toList();
      if (kDebugMode) {
        print("garagesInfo ${garagesInfoList.first.toString()}");
      }
      return right(garagesInfoList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GarageModel>>> getSlotsByGarage({
    required int garageId,
  }) async {
    try {
      final response = await dioFactory.getReq(
        endPoint: '${EndPoints.getSlotsByGarageEndPoint}$garageId',
      );
      final List<dynamic> slotsByGaragesData = response.data;

      final List<GarageModel> slotsByGaragesList =
          slotsByGaragesData.map((json) => GarageModel.fromJson(json)).toList();
      if (kDebugMode) {
        print("slotsByGarages ${slotsByGaragesList.first.toString()}");
      }
      return right(slotsByGaragesList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
