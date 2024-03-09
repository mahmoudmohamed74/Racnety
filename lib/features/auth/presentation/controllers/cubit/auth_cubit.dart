import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/requests/login_request.dart';
import 'package:parking_app/features/auth/data/models/user_model.dart';

import '../../../../../core/network/connectivity_service.dart';
import '../../../data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final ConnectivityService connectivityService;
  final BaseAuthRepo baseAuthRepo;

  AuthCubit(
    this.connectivityService,
    this.baseAuthRepo,
  ) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  Future<void> fetchProductsCubit() async {
    emit(AuthLogInLoadingState());
    try {
      if (await connectivityService.isOnline()) {
        var result = await baseAuthRepo.login(
          LoginRequest(
            userName: "userName",
            password: "password",
          ),
        );

        result.fold(
          (failure) {},
          (products) async {},
        );
      } else {}
    } catch (e) {
      // emit(ProductsErrorState(errorMessage: e.toString()));
      print(e.toString());
    }
  }
}
