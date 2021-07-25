import 'package:dictionary/utils/app_routes_generator.dart';
import 'package:dictionary/utils/env.dart';
import 'package:dictionary/utils/env_reader.dart';
import 'package:flutter/material.dart';

void main() async{
  // await EnvReader.initialize(Env.dev);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Color(0xff7CD985),
        colorScheme: ThemeData().colorScheme.copyWith(
          secondary: Color(0xff7CD985),
          primary: Color(0xff7CD985),
        ),
      ),
      // home: MyHomePage(title: 'Dictionary'),
      onGenerateRoute: AppRouteGenerator.generateRoute,
    );
  }
}
