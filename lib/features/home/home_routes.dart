import 'package:flutter_task/features/home/presentation/pages/search_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_task/config/routes/router_transition.dart';
import 'package:flutter_task/features/home/presentation/pages/home_page.dart';


class HomeRouter {
  HomeRouter._();

  static final List<GoRoute> routes = [


    /// Home Page Route
    GoRoute(
      path: HomePage.path,
      name: HomePage.name,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
            key: state.pageKey,
            child: HomePage(),
            transitionsBuilder: routerTransition
        );
      },
      routes: [
        GoRoute(
          path: SearchPage.path,
          name: SearchPage.name,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                key: state.pageKey,
                child: SearchPage(),
                transitionsBuilder: routerTransition
            );
          },
        )
      ]
    ),



  ];

}