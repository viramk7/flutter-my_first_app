import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:myapp/data/weather.dart';

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/weather?q=London&appid=cf33beeb29dd338d45c66bd6254b5b0a
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'cf33beeb29dd338d45c66bd6254b5b0a';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appid': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
