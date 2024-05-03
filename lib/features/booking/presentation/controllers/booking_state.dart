part of 'booking_cubit.dart';

class BookingState extends Equatable {
  final bool isLoading;
  final List<AreaModel> communitiesList;
  final List<AreaModel> unitsList;
  final List<GarageModel> gendersList;
  final String? error;

  const BookingState({
    required this.isLoading,
    required this.error,
    required this.communitiesList,
    required this.unitsList,
    required this.gendersList,
  });

  BookingState.empty()
      : isLoading = false,
        error = null,
        communitiesList = [],
        unitsList = [],
        gendersList = [];

  BookingState copyWith({
    bool? isLoading,
    String? error,
    List<AreaModel>? communitiesList,
    List<AreaModel>? unitsList,
    List<GarageModel>? gendersList,
  }) {
    return BookingState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      communitiesList: communitiesList ?? this.communitiesList,
      unitsList: unitsList ?? this.unitsList,
      gendersList: gendersList ?? this.gendersList,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        communitiesList,
        unitsList,
        gendersList,
      ];
}
