// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/features/auth/presentation/views/screens/login_screen.dart';
import 'package:parking_app/features/booking/presentation/views/screens/home.dart';
import 'package:parking_app/features/splash/presentation/views/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String homeView = "/homeView";
  static const String loginView = "/loginView";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => const UserLoginScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "No Route Found",
          ),
        ),
        body: const Center(
          child: Text(
            "No Route Found",
          ),
        ),
      ),
    );
  }
}
