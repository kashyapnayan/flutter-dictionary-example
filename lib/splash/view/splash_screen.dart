import 'dart:async';

import 'package:dictionary/utils/app_routes_generator.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 1000), vsync: this)
    ..repeat(reverse: true);
  late Animation<Offset> _animation =
      Tween(begin: Offset.zero, end: Offset(0, 0.08))
          .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

  @override
  void initState() {
    loadNextScreen();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  loadNextScreen() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, () {
      Navigator.pushNamed(context, AppRoutes.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: Image.asset(
            'assets/dictionary-icon.png',
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
