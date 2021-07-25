import 'dart:convert';
import 'package:dictionary/utils/constants.dart';
import 'package:flutter/services.dart';

abstract class EnvReader{
  static Map<String, dynamic> _config = {};
  static Future<void> initialize(String env) async {
    String configFile = "$key_app_secret";
    final configString = await rootBundle.loadString(configFile);
    final appConfig = json.decode(configString) as Map<String, dynamic>;
    _config = appConfig[env];
  }

  static String baseURL = _config['base_url'] as String;
}