import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:parking_app/core/network/connectivity_service.dart';
import 'package:parking_app/core/network/dio_factory.dart';
import 'package:parking_app/core/network/end_points.dart';
import 'package:parking_app/core/requests/book_ticket_request.dart';
import 'package:parking_app/features/booking/data/models/area_model.dart';
import 'package:parking_app/features/booking/data/models/ticket_model.dart';
import 'package:parking_app/features/booking/data/repos/base_booking_repo.dart';
import 'package:parking_app/features/booking/data/models/garage_model.dart';

import '../../../../core/errors/failure.dart';

class BookingRepoImpl implements BaseBookingRepo {
  final DioFactory dioFactory;
  final ConnectivityService connectivityService;

  BookingRepoImpl(this.dioFactory, this.connectivityService);
  @override
  Future<Either<Failure, List<GarageModel>>> getGarages() async {
    if (await connectivityService.isOnline()) {
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
    } else {
      return left(const ServerFailure("No internet connection"));
    }
  }

  @override
  Future<Either<Failure, List<GarageModel>>> getGaragesInfo() async {
    if (await connectivityService.isOnline()) {
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
    } else {
      return left(const ServerFailure("No internet connection"));
    }
  }

  @override
  Future<Either<Failure, List<GarageModel>>> getSlotsByGarage({
    required int garageId,
  }) async {
    if (await connectivityService.isOnline()) {
      try {
        final response = await dioFactory.getReq(
          endPoint: '${EndPoints.getSlotsByGarageEndPoint}$garageId',
        );
        final List<dynamic> slotsByGaragesData = response.data;

        final List<GarageModel> slotsByGaragesList = slotsByGaragesData
            .map((json) => GarageModel.fromJson(json))
            .toList();
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
    } else {
      return left(const ServerFailure("No internet connection"));
    }
  }

  @override
  Future<Either<Failure, List<AreaModel>>> getAreaBySlot({
    required int areaId,
  }) async {
    if (await connectivityService.isOnline()) {
      try {
        final response = await dioFactory.getReq(
          endPoint: "${EndPoints.getAreasBySlotEndPoint}/$areaId",
        );
        final List<dynamic> areasData = response.data;

        final List<AreaModel> areasList =
            areasData.map((json) => AreaModel.fromJson(json)).toList();
        if (kDebugMode) {
          print("Area by slot ${areasList.first.toString()}");
        }
        return right(areasList);
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
  Future<Either<Failure, List<AreaModel>>> getAreaBySlotDis({
    required int areaId,
  }) async {
    if (await connectivityService.isOnline()) {
      try {
        final response = await dioFactory.getReq(
          endPoint: "${EndPoints.getAreasBySlotByDisEndPoint}/$areaId",
        );
        final List<dynamic> areasData = response.data;

        final List<AreaModel> areasList =
            areasData.map((json) => AreaModel.fromJson(json)).toList();
        if (kDebugMode) {
          print("Area by slot dis ${areasList.first.toString()}");
        }
        return right(areasList);
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
  Future<Either<Failure, List<TicketModel>>> getBookingHist({
    required int accountId,
  }) async {
    if (await connectivityService.isOnline()) {
      try {
        final response = await dioFactory.getReq(
          endPoint: "${EndPoints.getBookingHistEndPoint}/$accountId",
        );
        final List<dynamic> bookingData = response.data;

        final List<TicketModel> bookingHistList =
            bookingData.map((json) => TicketModel.fromJson(json)).toList();
        if (kDebugMode) {
          print("booking history list ${bookingHistList.first.toString()}");
        }
        return right(bookingHistList);
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
  Future<Either<Failure, List<TicketModel>>> getTicketQRCode({
    required int accountId,
    required int ticketId,
  }) async {
    if (await connectivityService.isOnline()) {
      try {
        final response = await dioFactory.getReq(
          endPoint:
              "${EndPoints.getBookingQRcodeEndPoint}/$accountId/$ticketId",
        );

        final List<dynamic> ticketData = response.data;
        final List<TicketModel> ticketModel =
            ticketData.map((json) => TicketModel.fromJson(json)).toList();

        // final TicketModel ticketModel = TicketModel.fromJson(ticketData);
        if (kDebugMode) {
          print("ticketModel QR Code  ${ticketModel.first.toString()}");
        }
        return right(ticketModel);
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
  Future<Either<Failure, Response<dynamic>>> bookTicket({
    required BookRequest bookRequest,
  }) async {
    if (await connectivityService.isOnline()) {
      try {
        final result = await dioFactory.postReq(
          endPoint: EndPoints.bookTicketEndPoint,
          data: bookRequest.toJson(),
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
  Future<Either<Failure, Response<dynamic>>> deleteTicket({
    required int accountId,
    required int ticketId,
  }) async {
    if (await connectivityService.isOnline()) {
      try {
        final result = await dioFactory.deleteReq(
          endPoint: "${EndPoints.deleteBookEndPoint}/$ticketId/$accountId",
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
