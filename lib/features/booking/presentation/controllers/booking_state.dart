part of 'booking_cubit.dart';

class BookingState extends Equatable {
  final bool isLoading;
  final List<AreaModel> slotsList;
  final List<AreaModel> areasList;
  final List<GarageModel> garagesList;
  final int? selGarage;
  final int? selArea;
  final int? selSlot;
  final int? paymentId;
  final String? duration;
  final String? startTime;
  final String? error;

  const BookingState({
    required this.selGarage,
    required this.selArea,
    required this.selSlot,
    required this.isLoading,
    required this.error,
    required this.startTime,
    required this.paymentId,
    required this.slotsList,
    required this.areasList,
    required this.garagesList,
    required this.duration,
  });

  BookingState.empty()
      : isLoading = false,
        error = null,
        selGarage = null,
        selArea = null,
        selSlot = null,
        startTime = null,
        duration = null,
        paymentId = null,
        slotsList = [],
        areasList = [],
        garagesList = [];

  BookingState copyWith({
    bool? isLoading,
    String? error,
    String? duration,
    String? startTime,
    List<AreaModel>? slotsList,
    List<AreaModel>? areasList,
    List<GarageModel>? garagesList,
    int? selGarage,
    int? paymentId,
    int? selArea,
    int? selSlot,
  }) {
    return BookingState(
      isLoading: isLoading ?? this.isLoading,
      selGarage: selGarage ?? this.selGarage,
      selArea: selArea ?? this.selArea,
      selSlot: selSlot ?? this.selSlot,
      error: error ?? this.error,
      paymentId: paymentId ?? this.paymentId,
      duration: duration ?? this.duration,
      startTime: startTime ?? this.startTime,
      slotsList: slotsList ?? this.slotsList,
      areasList: areasList ?? this.areasList,
      garagesList: garagesList ?? this.garagesList,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        paymentId,
        duration,
        startTime,
        slotsList,
        areasList,
        garagesList,
        selGarage,
        selArea,
        selSlot,
      ];
}
