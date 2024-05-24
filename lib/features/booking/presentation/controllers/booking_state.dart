part of 'booking_cubit.dart';

class BookingState extends Equatable {
  final bool isLoading;
  final List<AreaModel> slotsList;
  final List<AreaModel> areasList;
  final List<GarageModel> garagesList;
  final List<ServiceModel> servicesList;
  final List<ServiceModel> bookedServices;
  final List<TicketModel> ticketHistList;
  final List<int> localSlots;
  final int? selGarage;
  final int? selArea;
  final int? selSlot;
  final int? selHistIndex;
  final int? paymentId;
  final String? duration;
  final String? startTime;
  final String? error;

  const BookingState({
    required this.selGarage,
    required this.selArea,
    required this.selSlot,
    required this.selHistIndex,
    required this.isLoading,
    required this.error,
    required this.localSlots,
    required this.startTime,
    required this.paymentId,
    required this.slotsList,
    required this.areasList,
    required this.garagesList,
    required this.servicesList,
    required this.bookedServices,
    required this.ticketHistList,
    required this.duration,
  });

  BookingState.empty()
      : isLoading = false,
        error = null,
        selGarage = null,
        selArea = null,
        selSlot = null,
        selHistIndex = 0,
        startTime = null,
        duration = null,
        paymentId = null,
        slotsList = [],
        bookedServices = [],
        localSlots = [],
        ticketHistList = [],
        servicesList = [],
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
    List<ServiceModel>? servicesList,
    List<ServiceModel>? bookedServices,
    List<TicketModel>? ticketHistList,
    List<int>? localSlots,
    int? selGarage,
    int? paymentId,
    int? selArea,
    int? selSlot,
    int? selHistIndex,
  }) {
    return BookingState(
      isLoading: isLoading ?? this.isLoading,
      selGarage: selGarage ?? this.selGarage,
      localSlots: localSlots ?? this.localSlots,
      selArea: selArea ?? this.selArea,
      selSlot: selSlot ?? this.selSlot,
      selHistIndex: selHistIndex ?? this.selHistIndex,
      error: error ?? this.error,
      paymentId: paymentId ?? this.paymentId,
      ticketHistList: ticketHistList ?? this.ticketHistList,
      bookedServices: bookedServices ?? this.bookedServices,
      duration: duration ?? this.duration,
      startTime: startTime ?? this.startTime,
      servicesList: servicesList ?? this.servicesList,
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
        localSlots,
        servicesList,
        areasList,
        garagesList,
        ticketHistList,
        bookedServices,
        selGarage,
        selArea,
        selSlot,
        selHistIndex,
      ];
}
