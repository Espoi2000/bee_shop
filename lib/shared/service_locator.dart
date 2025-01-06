import 'package:beep_shop/features/auth/data/repository/auth_repository.dart';
import 'package:beep_shop/features/auth/data/service/auth_service.dart';
import 'package:beep_shop/features/auth/logic/bloc/auth_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio(
        BaseOptions(
          baseUrl: "https://dummyjson.com",
          sendTimeout: const Duration(microseconds: 500),
          connectTimeout: const Duration(microseconds: 500),
          receiveTimeout: const Duration(microseconds: 500),
        ),
      ));
  // register auth

  getIt.registerLazySingleton<AuthService>(
      () => AuthService(dio: getIt.get<Dio>()));

  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepository(authService: getIt<AuthService>()));

  getIt.registerLazySingleton<AuthBloc>(
      () => AuthBloc(repository: getIt.get<AuthRepository>()));
}
