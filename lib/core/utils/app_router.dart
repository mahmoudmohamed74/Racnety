import 'package:flutter/material.dart';
import 'package:parking_app/features/auth/presentation/views/screens/login_screen.dart';
import 'package:parking_app/features/booking/presentation/views/screens/booking_class_screen.dart';
import 'package:parking_app/features/booking/presentation/views/screens/booking_details_screen.dart';
import 'package:parking_app/features/booking/presentation/views/screens/booking_solts_screen.dart';
import 'package:parking_app/features/booking/presentation/views/screens/confirm_booking_screen.dart';
import 'package:parking_app/features/booking/presentation/views/screens/contact_us.dart';
import 'package:parking_app/features/booking/presentation/views/screens/home.dart';
import 'package:parking_app/features/booking/presentation/views/screens/new_booking.dart';
import 'package:parking_app/features/booking/presentation/views/screens/order_history_screen.dart';
import 'package:parking_app/features/booking/presentation/views/screens/services_screen.dart';
import 'package:parking_app/features/splash/presentation/views/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String homeView = "/homeView";
  static const String loginView = "/loginView";
  static const String newBooking = "/newBooking";
  static const String bookingSlots = "/bookingSlots";
  static const String bookingClass = "/bookingClass";

  static const String confirmBooking = "/confirmBooking";
  static const String orderHistory = "/orderHistory";
  static const String bookingDetails = "/bookingDetails";
  static const String contactUs = "/contactUs";
  static const String services = "/services";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => UserLoginScreen());
      case Routes.newBooking:
        return MaterialPageRoute(
          builder: (_) => const NewBookingScreen(),
        );
      case Routes.bookingSlots:
        return MaterialPageRoute(builder: (_) => const BookingSlotsScreen());
      case Routes.bookingClass:
        return MaterialPageRoute(builder: (_) => const BookingClassScreen());
      case Routes.confirmBooking:
        return MaterialPageRoute(builder: (_) => ConfirmBookingScreen());
      case Routes.orderHistory:
        return MaterialPageRoute(builder: (_) => const OrderHistoryScreen());
      case Routes.bookingDetails:
        return MaterialPageRoute(builder: (_) => const BookingDetailsScreen());
      case Routes.contactUs:
        return MaterialPageRoute(builder: (_) => ContactUsScreen());
      case Routes.services:
        return MaterialPageRoute(builder: (_) => ServicesScreen());

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
