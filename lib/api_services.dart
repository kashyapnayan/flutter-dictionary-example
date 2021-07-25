import 'dart:convert';
import 'dart:io';

import 'package:dictionary/utils/custom_exceptions.dart';
import 'package:http/http.dart' as http;

class ApiServices{

  Future<Map<String, String>> getHeaders() async {
    Map<String, String> header = new Map();
    header['Content-Type'] = 'application/json';
    return header;
  }

  ///Get API
  Future<dynamic> getApiCall(String endPoint) async {
    var responseJson;
    try {
      final response = await http.get(
        Uri.parse(endPoint),
        headers: await getHeaders(),
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  ///Similarly define POST,PUT & DELETE API

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      default:
        Map<String, dynamic> responseJson = json.decode(response.body);
        return responseJson;
    }
  }

}