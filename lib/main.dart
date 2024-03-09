import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/bloc_observer.dart';
import 'package:parking_app/core/utils/app_router.dart';
import 'package:parking_app/core/utils/service_locator.dart';
import 'package:parking_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
import 'package:parking_app/features/booking/presentation/controllers/booking_cubit.dart';
import 'package:parking_app/firebase_options.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:parking_app/.env';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ServicesLocator().init();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<BookingCubit>()..loadNumbers(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
      ),
    );
  }
}
