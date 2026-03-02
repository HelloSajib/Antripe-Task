
import 'package:flutter/material.dart';
import 'package:flutter_task/config/routes/route_error_page.dart';
import 'package:flutter_task/features/home/home_routes.dart';
import 'package:flutter_task/features/home/presentation/pages/home_page.dart';
import 'package:flutter_task/features/onboarding/presentation/onboarding_routes.dart';
import 'package:flutter_task/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter_task/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter_task/features/splash/splash_routes.dart';
import 'package:go_router/go_router.dart';

// Global navigator key to access the navigator state from anywhere in the app.
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


/// A class that holds the application's routing configuration.
class AppRouter {
  // Private constructor to prevent instantiation.
  AppRouter._(); 

  /// The main GoRouter instance for the application.
  static final GoRouter routes = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: SplashPage.path,
    debugLogDiagnostics: true,
    errorBuilder: (context,state)=> ErrorPage(state: state),
    redirect: (BuildContext context, GoRouterState state){
      return null;
    },
    routes: [

      /// Splash Routes
      ...SplashRouter.routes,

      /// Onboarding Routes
      ...OnboardingRouter.routes,

      /// Home Routes
      ...HomeRouter.routes,

    ]
  );
}
