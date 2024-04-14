class EndPoints {
  static const String registerEndPoint = "api/Auth/Register";
  static const String loginEndPoint = "api/Auth/Login";
  static const String forgetPasswordEndPoint = "api/Auth/Forget";
  static const String getGaragesEndPoint = "api/Garages/GetGarages";
  static const String getGaragesInfoEndPoint = "api/Garages/GetGaragesInfo";
  static const String getSlotsByGarageEndPoint =
      "api/Garages/GetSlotsByGarage/";
  static const String getAreasBySlotEndPoint = "api/Slots/GetAreasBySlot";
  static const String getAreasBySlotByDisEndPoint =
      "api/Slots/GetAreasBySlotDis";
  static const String getBookingHistEndPoint =
      "api/BookGarageTickets/GetHistoryBooking";
  static const String getBookingQRcodeEndPoint =
      "api/BookGarageTickets/GetQrCodeReservation";
  static const String bookTicketEndPoint = "api/BookGarageTickets/BookTicket";
  static const String deleteBookEndPoint =
      "api/BookGarageTickets/CancelBooking";
}
