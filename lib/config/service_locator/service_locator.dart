
import 'package:flutter_task/core/network/dio_client.dart';
import 'package:flutter_task/features/home/data/datasource/remote_datasource/home_remote_datasource.dart';
import 'package:flutter_task/features/home/data/repositories/home_repositories_impl.dart';
import 'package:flutter_task/features/home/domain/repositories/home_repositories.dart';
import 'package:flutter_task/features/home/domain/usecases/get_products_usecase.dart';
import 'package:flutter_task/features/onboarding/data/datasource/local_datasource/onboarding_local_datasource.dart';
import 'package:flutter_task/features/onboarding/data/repositories/onboarding_repositories_impl.dart';
import 'package:flutter_task/features/onboarding/domain/repositories/onboarding_repositories.dart';
import 'package:flutter_task/features/onboarding/domain/usecases/already_onboarded_usecase.dart';
import 'package:flutter_task/features/onboarding/domain/usecases/user_onboarded_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initServiceLocator(){

  sl.registerSingleton<DioClient>(DioClient());

  /// Remote DataSource
  sl.registerLazySingleton<HomeRemoteDatasource>(()=> HomeRemoteDatasourceImpl());

  /// Local DataSource
  sl.registerSingleton<OnboardingLocalDatasource>(OnboardingLocalDatasourceImpl());

  /// Repositories
  sl.registerLazySingleton<OnboardingRepositories>(()=> OnboardingRepositoriesImpl());
  sl.registerLazySingleton<HomeRepositories>(()=> HomeRepositoriesImpl());

  /// UseCases
  /// Onboarding UseCases
  sl.registerLazySingleton<AlreadyOnboardedUseCase>(()=> AlreadyOnboardedUseCase());
  sl.registerLazySingleton<UserOnboardedUseCase>(()=> UserOnboardedUseCase());

  /// Home UseCases
  sl.registerLazySingleton<GetProductsUseCase>(()=> GetProductsUseCase());


}