import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/requests/forget_password_request.dart';
import 'package:parking_app/core/requests/login_request.dart';
import 'package:parking_app/core/requests/register_request.dart';
import 'package:parking_app/core/utils/app_pref.dart';
import 'package:parking_app/core/utils/service_locator.dart';
import 'package:parking_app/features/auth/data/models/user_model.dart';
import 'package:parking_app/features/auth/presentation/views/screens/login_screen.dart';

import '../../../data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final BaseAuthRepo _baseAuthRepo;

  AuthCubit(
    this._baseAuthRepo,
  ) : super(const AuthState.empty());

  static AuthCubit get(context) => BlocProvider.of(context);
  bool isPasswordVisible = false;
  IconData passwordIcon = Icons.visibility;
  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    passwordIcon = isPasswordVisible ? Icons.visibility_off : Icons.visibility;
    emit(
      state.copyWith(
        isPasswordVisible: !state.isPasswordVisible,
        isLoading: false,
        error: "",
        statusCode: 0,
      ),
    );
  }

  UserModel? userModel;
  Future<void> login(LoginRequest loginRequest) async {
    emit(state.copyWith(isLoading: true, error: ""));
    final result = await _baseAuthRepo.login(loginRequest);

    result.fold(
      (l) => emit(
        state.copyWith(
          isLoading: false,
          error: "1",
        ),
      ),
      (r) async {
        userModel = r;
        emit(
          state.copyWith(
            isLoading: false,
            userModel: r,
            error: "",
          ),
        );
      },
    );
  }

  Future<void> register(RegisterRequest registerRequest) async {
    emit(state.copyWith(isLoading: true, error: ""));
    final result = await _baseAuthRepo.register(registerRequest);

    result.fold(
      (l) => emit(
        state.copyWith(
          isLoading: false,
          error: '2',
        ),
      ),
      (r) => emit(
        state.copyWith(
          isLoading: false,
          statusCode: r.statusCode,
          error: "",
        ),
      ),
    );
  }

  Future<void> forgetPassword(
    ForgotPasswordRequest forgotPasswordRequest,
  ) async {
    emit(state.copyWith(isLoading: true, error: ""));
    final result = await _baseAuthRepo.forgerPassword(forgotPasswordRequest);

    result.fold(
      (l) => emit(
        state.copyWith(
          isLoading: false,
          error: '3',
        ),
      ),
      (r) => emit(
        state.copyWith(
          isLoading: false,
          statusCode: r.statusCode,
          error: "",
        ),
      ),
    );
  }

  Future<void> logout(context) async {
    await sl<AppPreferences>().clean();
    emit(const AuthState.empty());
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => UserLoginScreen()),
    );
  }

  void cubitClear() {
    sl<AppPreferences>().clean();
  }
}
