import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parking_app/features/booking/data/models/area_model.dart';
import 'package:parking_app/features/booking/data/models/garage_model.dart';
import 'package:parking_app/features/booking/data/repos/base_booking_repo.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BaseBookingRepo _baseBookingRepo;
  BookingCubit(this._baseBookingRepo) : super(BookingState.empty());
}
