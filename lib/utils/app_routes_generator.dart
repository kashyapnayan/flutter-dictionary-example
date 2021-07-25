import 'package:dictionary/detail/view/detail_screen.dart';
import 'package:dictionary/home/view/home_screen.dart';
import 'package:dictionary/home/view_model/dictionary_view_model.dart';
import 'package:dictionary/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
              create: (context) => DictionaryViewModel(),
              child: HomeScreen()),
        );
      case AppRoutes.detailScreen:
        return MaterialPageRoute(
          builder: (_) => DetailScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
    }
  }
}

class AppRoutes {
  static const String splashScreen = 'splash_screen';
  static const String homeScreen = 'home_screen';
  static const String detailScreen = 'detail_screen';
}