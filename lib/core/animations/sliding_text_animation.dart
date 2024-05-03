import 'package:flutter/material.dart';

import '../themes/color_manager.dart';
import '../utils/app_strings.dart';

class SlidingTextAnimation extends StatelessWidget {
  const SlidingTextAnimation({
    Key? key,
    required Animation<Offset> slidingAnimation,
  })  : _slidingAnimation = slidingAnimation,
        super(key: key);

  final Animation<Offset> _slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _slidingAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: _slidingAnimation,
          child: Text(
            AppStrings.splashText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorManager.primary,
            ),
          ),
        );
      },
    );
  }
}
