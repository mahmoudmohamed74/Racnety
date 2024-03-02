part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLogInLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLogInSuccessState extends AuthState {
  final UserModel userData;

  const AuthLogInSuccessState({required this.userData});

  @override
  List<Object> get props => [];
}

class AuthLogInErrorState extends AuthState {
  final String error;

  const AuthLogInErrorState({required this.error});

  @override
  List<Object> get props => [];
}

class ChangePasswordVisibilityState extends AuthState {
  @override
  List<Object> get props => [];
}
