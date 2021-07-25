import 'package:dictionary/home/api/dictionary_api_service.dart';
import 'package:dictionary/home/model/dictionary.dart';
import 'package:flutter/material.dart';

class DictionaryViewModel extends ChangeNotifier{
  final DictionaryApiService _dictionaryApiService = DictionaryApiService();
  List<Dictionary>? getDictionaries;
  bool isRunning = false;

  Future<void> fetchDictionaries(String word) async {
    isRunning = true;
    final results = await _dictionaryApiService.getDictionaryResponse(word);
    this.getDictionaries = results;
    isRunning = false;
    notifyListeners();
  }
}