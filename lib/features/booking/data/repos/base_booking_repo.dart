import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parking_app/core/errors/failure.dart';
import 'package:parking_app/core/requests/book_ticket_request.dart';
import 'package:parking_app/features/booking/data/models/area_model.dart';
import 'package:parking_app/features/booking/data/models/garage_model.dart';
import 'package:parking_app/features/booking/data/models/service_model.dart';
import 'package:parking_app/features/booking/data/models/ticket_model.dart';

abstract class BaseBookingRepo {
  // Garages
  Future<Either<Failure, List<GarageModel>>> getGarages();
  Future<Either<Failure, List<GarageModel>>> getGaragesInfo();
  Future<Either<Failure, List<GarageModel>>> getAreasByGarage({
    required int garageId,
  });

  // areas & slots
  Future<Either<Failure, List<AreaModel>>> getSlotsByArea({
    required int areaId,
  });
  Future<Either<Failure, List<AreaModel>>> getSlotsByAreasDis({
    required int areaId,
  });
  Future<Either<Failure, List<TicketModel>>> getBookingHist({
    required int accountId,
  });
  Future<Either<Failure, List<TicketModel>>> getTicketQRCode({
    required int accountId,
    required int ticketId,
  });
  Future<Either<Failure, List<ServiceModel>>> getServices();
  Future<Either<Failure, Response<dynamic>>> bookTicket({
    required BookRequest bookRequest,
  });
  Future<Either<Failure, Response<dynamic>>> deleteTicket({
    required int accountId,
    required int ticketId,
  });
}
