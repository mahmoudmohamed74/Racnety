import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:parking_app/core/network/api_service.dart';
import 'package:parking_app/core/network/connectivity_service.dart';
import 'package:parking_app/core/network/dio_factory.dart';
import 'package:parking_app/features/auth/data/repos/auth_repo.dart';
import 'package:parking_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:parking_app/features/garages/data/repo/base_garage_repo.dart';
import 'package:parking_app/features/garages/data/repo/garage_repo_impl.dart';

final sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerLazySingleton<ApiService>(() => ApiService(Dio()));
  sl.registerLazySingleton<DioFactory>(() => DioFactory());
  sl.registerLazySingleton<BaseTestApi>(() => TestApiImpl(sl()));
  // sl.registerLazySingleton<BaseAuthRepo>(() => AuthRepoImpl(sl()));
  sl.registerLazySingleton<BaseGarageRepo>(() => GarageRepoImpl(sl()));
  sl.registerFactory<ConnectivityService>(() => ConnectivityService());

  // sl.registerLazySingleton<HomeRepoImpl>(() => HomeRepoImpl(
  //       sl.get<ApiService>(),
  //       sl.get<DatabaseHelper>(),
  //     ));
  // sl.registerSingleton<SearchRepoImpl>(SearchRepoImpl(sl.get<ApiService>()));
}
