part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final bool isPasswordVisible;
  final bool isLoading;
  final UserModel? userModel;
  final int? statusCode;
  final String error;

  const AuthState({
    required this.isPasswordVisible,
    required this.isLoading,
    required this.statusCode,
    required this.userModel,
    required this.error,
  });

  const AuthState.empty()
      : isPasswordVisible = false,
        isLoading = false,
        error = "",
        statusCode = null,
        userModel = null;

  AuthState copyWith({
    bool? isPasswordVisible,
    bool? isLoading,
    String? error,
    int? statusCode,
    UserModel? userModel,
  }) {
    return AuthState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      statusCode: statusCode ?? this.statusCode,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [
        isPasswordVisible,
        isLoading,
        statusCode,
        userModel,
        error,
      ];
}
