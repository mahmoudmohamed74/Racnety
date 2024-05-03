import 'package:dartz/dartz.dart';
import 'package:parking_app/core/errors/failure.dart';
import 'package:parking_app/core/requests/book_ticket_request.dart';
import 'package:parking_app/features/booking/data/models/area_model.dart';
import 'package:parking_app/features/booking/data/models/ticket_model.dart';

abstract class BaseBookingRepo {
  Future<Either<Failure, List<AreaModel>>> getAreaBySlot({
    required int areaId,
  });
  Future<Either<Failure, List<AreaModel>>> getAreaBySlotDis({
    required int areaId,
  });
  Future<Either<Failure, List<TicketModel>>> getBookingHist({
    required int accountId,
  });
  Future<Either<Failure, List<TicketModel>>> getTicketQRCode({
    required int accountId,
    required int ticketId,
  });
  Future<Either<Failure, void>> bookTicket({
    required BookRequest bookRequest,
  });
  Future<Either<Failure, void>> deleteTicket({
    required int accountId,
    required int ticketId,
  });
}
