import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:racnety/core/network/api_service.dart';
import 'package:racnety/core/network/connectivity_service.dart';
import 'package:racnety/core/network/dio_factory.dart';
import 'package:racnety/features/auth/data/repos/auth_repo.dart';
import 'package:racnety/features/auth/data/repos/auth_repo_impl.dart';

final sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerLazySingleton<ApiService>(() => ApiService(Dio()));
  sl.registerLazySingleton<DioFactory>(() => DioFactory());
  sl.registerLazySingleton<BaseTestApi>(() => TestApiImpl(sl()));
  sl.registerLazySingleton<BaseAuthRepo>(() => AuthRepoImpl(sl()));
  sl.registerFactory<ConnectivityService>(() => ConnectivityService());

  // sl.registerLazySingleton<HomeRepoImpl>(() => HomeRepoImpl(
  //       sl.get<ApiService>(),
  //       sl.get<DatabaseHelper>(),
  //     ));
  // sl.registerSingleton<SearchRepoImpl>(SearchRepoImpl(sl.get<ApiService>()));
}
