class BookRequest {
  final int garageId;
  final int slotId;
  final int areaId;
  final String bookTime;
  final String bookDuration;
  final String note;
  final int accountId;
  final int paymentTypeId;
  final DateTime bookingDate;

  BookRequest({
    required this.garageId,
    required this.slotId,
    required this.areaId,
    required this.bookTime,
    required this.bookDuration,
    required this.note,
    required this.accountId,
    required this.paymentTypeId,
    required this.bookingDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'garageId': garageId,
      'slotId': slotId,
      'areaId': areaId,
      'bookTime': bookTime,
      'bookDuration': bookDuration,
      'note': note,
      'accountId': accountId,
      'paymentTypeId': paymentTypeId,
      'bookingDate': bookingDate.toIso8601String(),
    };
  }
}
