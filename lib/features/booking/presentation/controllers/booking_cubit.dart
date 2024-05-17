import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/requests/book_ticket_request.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/utils/app_pref.dart';
import 'package:parking_app/core/utils/service_locator.dart';
import 'package:parking_app/features/booking/data/models/area_model.dart';
import 'package:parking_app/features/booking/data/models/garage_model.dart';
import 'package:parking_app/features/booking/data/repos/base_booking_repo.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BaseBookingRepo _baseBookingRepo;
  BookingCubit(this._baseBookingRepo) : super(BookingState.empty());
  static BookingCubit get(context) => BlocProvider.of(context);

  Future<void> getGarages() async {
    sl<AppPreferences>().getUserId().then((value) {
      log("userId $value");
      return _userID = int.tryParse(value!);
    });
    emit(state.copyWith(
      isLoading: true,
      error: "",
    ));
    final result = await _baseBookingRepo.getGaragesInfo();

    result.fold(
      (l) => emit(
        state.copyWith(
          isLoading: false,
          error: l.errorMessage,
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
      selGarage: garageId,
      isLoading: true,
      error: "",
    ));

    final result = await _baseBookingRepo.getSlotsByArea(areaId: garageId);

    result.fold(
      (l) => emit(
        state.copyWith(
          selGarage: garageId,
          isLoading: false,
          error: l.errorMessage,
          areasList: [],
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            selGarage: garageId,
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
      selArea: areaId,
      isLoading: true,
      error: "",
    ));
    final result = await _baseBookingRepo.getSlotsByArea(areaId: areaId);

    result.fold(
      (l) => emit(
        state.copyWith(
          isLoading: false,
          error: l.errorMessage,
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

  void selectSlot(int? slotId) {
    emit(
      state.copyWith(
        selSlot: slotId,
        error: "",
        isLoading: false,
      ),
    );
  }

// booking
  void selectPaymentType(int? paymentId) {
    emit(state.copyWith(
      isLoading: false,
      error: "",
      paymentId: paymentId,
    ));
  }

  void selectBookTime(
    bool isDuration, {
    required TextEditingController controller,
    context,
  }) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            primaryColor: ColorManager.primary,
            hintColor: ColorManager.primary,
            colorScheme: ColorScheme.light(
              primary: ColorManager.primary,
            ),
          ),
          child: child!,
        );
      },
    ).then((value) {
      if (isDuration) {
        emit(
          state.copyWith(
            duration: value!.format(context).toString(),
          ),
        );
      } else {
        emit(
          state.copyWith(
            startTime: value!.format(context).toString(),
          ),
        );
      }
      controller.text = value.format(context).toString();
    });
  }

  int? _userID;
  Future<void> bookTicket({
    required String? notes,
  }) async {
    if (state.duration == null || state.duration!.isEmpty) {
      emit(state.copyWith(
        isLoading: false,
        error: "",
      ));
      emit(state.copyWith(
        isLoading: false,
        error: '* Please Select Duration Time ',
      ));
      log("duration error");

      return;
    }
    if (state.startTime == null || state.startTime!.isEmpty) {
      emit(state.copyWith(
        isLoading: false,
        error: "",
      ));
      emit(state.copyWith(
        isLoading: false,
        error: '* Please Select Start Time ',
      ));
      log("start time error");
      return;
    }
    if (state.paymentId == null) {
      emit(state.copyWith(
        isLoading: false,
        error: "",
      ));
      emit(state.copyWith(
        isLoading: false,
        error: '* Please Select Payment Way ',
      ));
      log("paymentTypeId error");
      return;
    }
    emit(state.copyWith(
      isLoading: true,
      error: "",
    ));

    final bookRequest = BookRequest(
      garageId: state.selGarage ?? 2,
      slotId: state.selSlot ?? 2,
      areaId: state.selArea ?? 2,
      bookTime: state.startTime ?? "",
      bookDuration: state.duration ?? "",
      note: notes ?? "",
      accountId: _userID ?? 0,
      paymentTypeId: state.paymentId ?? 3,
      bookingDate: DateTime.now(),
    );
    final result = await _baseBookingRepo.bookTicket(
      bookRequest: bookRequest,
    );

    result.fold(
      (l) => emit(
        state.copyWith(
          isLoading: false,
          error: l.errorMessage,
        ),
      ),
      (r) {
        log("${r.statusCode}");

        emit(
          state.copyWith(
            isLoading: false,
            error: "${r.statusCode}",
            duration: null,
            selGarage: null,
            selArea: null,
            selSlot: null,
            startTime: null,
            paymentId: null,
          ),
        );
      },
    );
  }

  // void select() {}
}