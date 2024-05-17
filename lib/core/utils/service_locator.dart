import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:parking_app/core/network/api_service.dart';
import 'package:parking_app/core/network/connectivity_service.dart';
import 'package:parking_app/core/network/dio_factory.dart';
import 'package:parking_app/core/utils/app_pref.dart';
import 'package:parking_app/features/auth/data/repos/auth_repo.dart';
import 'package:parking_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:parking_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
import 'package:parking_app/features/booking/data/repos/base_booking_repo.dart';
import 'package:parking_app/features/booking/data/repos/booking_repo_impl.dart';
import 'package:parking_app/features/booking/presentation/controllers/booking_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    final sharedPref = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPref);
    sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));

    sl.registerLazySingleton<ApiService>(() => ApiService(Dio()));
    sl.registerLazySingleton<DioFactory>(() => DioFactory());
    sl.registerLazySingleton<BaseTestApi>(() => TestApiImpl(sl()));
    sl.registerLazySingleton<BaseAuthRepo>(() => AuthRepoImpl(sl(), sl()));
    sl.registerLazySingleton<BaseBookingRepo>(() => BookingRepoImpl(
          sl(),
          sl(),
        ));
    sl.registerFactory<ConnectivityService>(() => ConnectivityService());

    // cubits
    sl.registerFactory<AuthCubit>(() => AuthCubit(sl()));
    sl.registerFactory<BookingCubit>(() => BookingCubit(sl(), sl()));
  }
}
