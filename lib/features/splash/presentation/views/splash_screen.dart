import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/utils/app_pref.dart';
import 'package:parking_app/core/utils/app_router.dart';
import 'package:parking_app/core/utils/service_locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  final AppPreferences _appPreferences = sl<AppPreferences>();

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    // Navigator.pushReplacementNamed(context, Routes.homeView);
    _appPreferences.isUserLoggedIn().then(
      (isUserLoggedIn) {
        if (isUserLoggedIn) {
          Navigator.pushReplacementNamed(context, Routes.homeView);
        } else {
          Navigator.pushReplacementNamed(context, Routes.loginView);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: const Center(
        child: Image(
          image: AssetImage(
            ImageAssets.appLogo,
          ),
        ),
      ),
    );
  }
}
