class ForgotPasswordRequest {
  final String email;
  final String newPassword;

  ForgotPasswordRequest({
    required this.email,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "newPassword": newPassword,
    };
  }
}
