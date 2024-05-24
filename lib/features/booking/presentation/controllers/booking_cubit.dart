import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/requests/book_ticket_request.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/utils/app_pref.dart';
import 'package:parking_app/core/utils/service_locator.dart';
import 'package:parking_app/features/booking/data/models/area_model.dart';
import 'package:parking_app/features/booking/data/models/garage_model.dart';
import 'package:parking_app/features/booking/data/models/service_model.dart';
import 'package:parking_app/features/booking/data/models/ticket_model.dart';
import 'package:parking_app/features/booking/data/repos/base_booking_repo.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BaseBookingRepo _baseBookingRepo;
  final AppPreferences _appPreferences;
  BookingCubit(this._baseBookingRepo, this._appPreferences)
      : super(BookingState.empty());
  static BookingCubit get(context) => BlocProvider.of(context);

//
  Future<void> loadNumbers() async {
    List<int> numbers = await _appPreferences.loadNumbers();

    emit(state.copyWith(localSlots: numbers));
  }

  Future<void> addNumber(int number) async {
    await _appPreferences.addNumber(number);
    loadNumbers();
  }

  Future<void> deleteNumber(int number) async {
    await _appPreferences.deleteNumber(number);
    loadNumbers();
  }

  Future<void> clearNumbers() async {
    await _appPreferences.clearNumbers();
    emit(state.copyWith(localSlots: []));
  }

//

  void onToggleHistoryScreen(index) async {
    emit(state.copyWith(isLoading: true, selHistIndex: index));
    if (index != 0) {
      await loadServices(userId: _userID.toString());
    }
    emit(state.copyWith(isLoading: false, selHistIndex: index));
  }

  Future<void> getTicketsHist() async {
    await sl<AppPreferences>().getUserId().then((value) {
      log("userId $value");
      return _userID = int.tryParse(value!);
    });
    emit(state.copyWith(
      isLoading: true,
      error: "",
    ));
    final result = await _baseBookingRepo.getBookingHist(
      accountId: _userID ?? 1,
    );

    result.fold(
      (l) => emit(
        state.copyWith(
          isLoading: false,
          error: l.errorMessage,
          ticketHistList: [],
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            isLoading: false,
            ticketHistList: r,
            error: "",
          ),
        );
      },
    );
  }

  Future<void> getServices() async {
    emit(state.copyWith(
      isLoading: true,
      error: "",
    ));
    final result = await _baseBookingRepo.getServices();

    result.fold(
      (l) => emit(
        state.copyWith(
          isLoading: false,
          error: l.errorMessage,
          servicesList: [],
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            isLoading: false,
            servicesList: r,
            error: "",
          ),
        );
      },
    );
  }

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

    // loadNumbers();
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
    await loadSlots();

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
      final int hour = value!.hour;
      final int minute = value.minute;
      final int formattedHour = hour % 12 == 0 ? 12 : hour % 12;
      final String minuteStr = minute.toString().padLeft(2, '0');
      if (isDuration) {
        emit(
          state.copyWith(
            duration: '$formattedHour : $minuteStr',
            error: "",
          ),
        );
      } else {
        emit(
          state.copyWith(
            startTime: '$formattedHour : $minuteStr',
            error: "",
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
    // addNumber(state.selSlot ?? 2);
    await addSlot(slot: state.selSlot ?? 2);
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

  // delete ticket

  Future<void> deleteTicket({required int ticketId}) async {
    emit(
      state.copyWith(
        isLoading: true,
        error: "",
      ),
    );
    await sl<AppPreferences>().getUserId().then((value) {
      log("userId $value");
      return _userID = int.tryParse(value!);
    });
    final result = await _baseBookingRepo.deleteTicket(
      ticketId: ticketId,
      accountId: _userID ?? 1,
    );
    // deleteNumber(3);
    await deleteSlot(
      slot: ticketId,
    );

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
            error: "${r.statusCode}",
          ),
        );
        getTicketsHist();
      },
    );
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addSlot({
    required int slot,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        error: "",
      ),
    );
    DocumentReference userDoc = users.doc("0");
    DocumentSnapshot docSnapshot = await userDoc.get();

    if (docSnapshot.exists) {
      List<dynamic> currentSlots = docSnapshot['bookedSlots'];
      currentSlots.add(slot);
      await userDoc
          .update({'bookedSlots': currentSlots})
          .then((value) => emit(
                state.copyWith(
                  isLoading: false,
                  error: "",
                ),
              ))
          .catchError((onError) {
            emit(
              state.copyWith(
                isLoading: false,
                error: onError.toString(),
              ),
            );
          });
    } else {
      await userDoc
          .set({
            'bookedSlots': [slot],
            'bookedServices': []
          })
          .then((value) => emit(
                state.copyWith(
                  isLoading: false,
                  error: "",
                ),
              ))
          .catchError((onError) {
            emit(
              state.copyWith(
                isLoading: false,
                error: onError.toString(),
              ),
            );
          });
    }
  }

  Future<void> addService({
    required ServiceModel service,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        error: "",
      ),
    );
    print("ssssssssssssssadadasdada $_userID");

    DocumentReference userDoc = users.doc(_userID.toString());
    DocumentSnapshot docSnapshot = await userDoc.get();

    if (docSnapshot.exists) {
      List<dynamic> currentServices = docSnapshot['bookedServices'];
      currentServices.add(service.toJson());
      await userDoc
          .update({'bookedServices': currentServices})
          .then((value) => emit(
                state.copyWith(
                  isLoading: false,
                  error: "",
                ),
              ))
          .catchError((onError) {
            emit(
              state.copyWith(
                isLoading: false,
                error: onError.toString(),
              ),
            );
          });
    } else {
      await userDoc
          .set({
            'bookedSlots': [],
            'bookedServices': [service]
          })
          .then((value) => emit(
                state.copyWith(
                  isLoading: false,
                  error: "",
                ),
              ))
          .catchError((onError) {
            emit(
              state.copyWith(
                isLoading: false,
                error: onError.toString(),
              ),
            );
          });
    }
  }

  Future<void> loadSlots() async {
    DocumentSnapshot docSnapshot = await users.doc("0").get();
    if (docSnapshot.exists) {
      List<dynamic> slots = docSnapshot['bookedSlots'];
      var result = slots.map((slot) => slot as int).toList();
      emit(state.copyWith(localSlots: result));
    } else {
      emit(state.copyWith(localSlots: []));
    }
  }

  Future<void> loadServices({
    required String userId,
  }) async {
    print("ssssssssssssssadadasdada $userId");
    emit(
      state.copyWith(
        isLoading: true,
        error: "",
      ),
    );
    DocumentSnapshot docSnapshot = await users.doc(userId).get();
    if (docSnapshot.exists) {
      List<dynamic> services = docSnapshot['bookedServices'];
      final List<ServiceModel> servicesList = services
          .map((json) => ServiceModel.fromJson(
                json,
              ))
          .toList();
      print("asdadadadasdadsa $servicesList");

      emit(state.copyWith(isLoading: false, bookedServices: servicesList));
      print("asdad;la;sdadadasdadsa $servicesList");
    } else {
      emit(state.copyWith(isLoading: false, bookedServices: []));
    }
  }

  Future<void> deleteSlot({
    required int slot,
  }) async {
    emit(state.copyWith(isLoading: true, error: ""));

    DocumentReference userDoc = users.doc("0");
    DocumentSnapshot docSnapshot = await userDoc.get();

    if (docSnapshot.exists) {
      List<dynamic> slots = docSnapshot['bookedSlots'];
      var result = slots.map((slot) => slot as int).toList();
      result.remove(slot);
      await userDoc.update({'bookedSlots': result});
      emit(state.copyWith(
        isLoading: false,
        error: "",
        localSlots: result,
      ));
    }
  }

  Future<void> deleteService({
    required String userId,
    required String service,
  }) async {
    DocumentReference userDoc = users.doc(userId);
    DocumentSnapshot docSnapshot = await userDoc.get();

    if (docSnapshot.exists) {
      List<dynamic> currentServices = docSnapshot['bookedServices'];
      currentServices.remove(service);
      await userDoc.update({'bookedServices': currentServices});
    }
  }
}
