// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = "/homeView";
  static const kLayoutView = "/layoutView";
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      // GoRoute(
      //   path: '/',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const SplashView();
      //   },
      // ),
      // GoRoute(
      //   path: kLayoutView,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const LayoutView();
      //   },
      // ),
      // GoRoute(
      //   path: kHomeView,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const HomeView();
      //   },
      // ),
    ],
  );
}
