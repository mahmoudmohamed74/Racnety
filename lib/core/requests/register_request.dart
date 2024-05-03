class RegisterRequest {
  final int id;
  final String fullName;
  final String userName;
  final String email;
  final String address;
  final String phoneNumber;
  final String password;
  final String longitude;
  final String latitude;

  RegisterRequest({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.password,
    required this.longitude,
    required this.latitude,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "fullName": fullName,
      "userName": userName,
      "email": email,
      "address": address,
      "phoneNumber": phoneNumber,
      "password": password,
      "longitude": longitude,
      "latitude": latitude,
    };
  }
}
