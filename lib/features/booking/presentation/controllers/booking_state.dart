part of 'booking_cubit.dart';

class BookingState extends Equatable {
  final bool isLoading;
  final List<AreaModel> slotsList;
  final List<AreaModel> areasList;
  final List<GarageModel> garagesList;
  final String? error;

  const BookingState({
    required this.isLoading,
    required this.error,
    required this.slotsList,
    required this.areasList,
    required this.garagesList,
  });

  BookingState.empty()
      : isLoading = false,
        error = null,
        slotsList = [],
        areasList = [],
        garagesList = [];

  BookingState copyWith({
    bool? isLoading,
    String? error,
    List<AreaModel>? slotsList,
    List<AreaModel>? areasList,
    List<GarageModel>? garagesList,
  }) {
    return BookingState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      slotsList: slotsList ?? this.slotsList,
      areasList: areasList ?? this.areasList,
      garagesList: garagesList ?? this.garagesList,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        slotsList,
        areasList,
        garagesList,
      ];
}
