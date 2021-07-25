import 'package:dictionary/api_services.dart';
import 'package:dictionary/home/model/dictionary.dart';

class DictionaryApiService{
  final String _baseURL = 'https://api.dictionaryapi.dev';
  ApiServices _apiServices = ApiServices();

  Future<List<Dictionary>> getDictionaryResponse(String word) async {
    String responseQuery = _baseURL + "/api/v2/entries/en_US/$word";
    final response = await _apiServices.getApiCall(responseQuery);
    final Iterable json = response;
    return json.map((e) => Dictionary.fromJson(e)).toList();
  }
}