import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/features/booking/data/models/area_model.dart';
import 'package:parking_app/features/booking/data/models/garage_model.dart';
import 'package:parking_app/features/booking/data/repos/base_booking_repo.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BaseBookingRepo _baseBookingRepo;
  BookingCubit(this._baseBookingRepo) : super(BookingState.empty());
  static BookingCubit get(context) => BlocProvider.of(context);

  Future<void> getGarages() async {
    emit(state.copyWith(
      isLoading: true,
      error: "",
    ));
    final result = await _baseBookingRepo.getGaragesInfo();

    result.fold(
      (l) => emit(
        state.copyWith(
          isLoading: false,
          error: "4",
          garagesList: [],
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            isLoading: false,
            garagesList: r,
            error: "",
          ),
        );
      },
    );
  }

  Future<void> getAreas({required int garageId}) async {
    emit(state.copyWith(
      isLoading: true,
      error: "",
    ));
    final result = await _baseBookingRepo.getSlotsByArea(areaId: garageId);

    result.fold(
      (l) => emit(
        state.copyWith(
          isLoading: false,
          error: "5",
          areasList: [],
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            isLoading: false,
            areasList: r,
            error: "",
          ),
        );
      },
    );
  }

  Future<void> getSlots({required int areaId}) async {
    emit(state.copyWith(
      isLoading: true,
      error: "",
    ));
    final result = await _baseBookingRepo.getSlotsByArea(areaId: areaId);

    result.fold(
      (l) => emit(
        state.copyWith(
          isLoading: false,
          error: "6",
          slotsList: [],
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            isLoading: false,
            slotsList: r,
            error: "",
          ),
        );
      },
    );
  }
}
