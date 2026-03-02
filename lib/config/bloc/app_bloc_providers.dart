
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_task/features/onboarding/presentation/cubit/onboarding_cubit.dart';

/// Provides a centralized list of all BLoC/Cubit providers for the app.
class AppBlocProviders {
  const AppBlocProviders._();

  /// The list of all [BlocProvider]s used in the application.
  static List<BlocProvider> get providers => [

    BlocProvider<OnboardingCubit>(create: (context)=> OnboardingCubit()..userAlreadyOnboarded()),
    BlocProvider<HomeBloc>(create: (context)=> HomeBloc()),

  ];

}
