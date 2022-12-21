import 'package:czestochowa_app/views/weather/model/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherRepository {
  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final response = await Dio().get<Map<String, dynamic>>(
        'http://api.weatherapi.com/v1/current.json?key=bad6992f8a184659840180617222012 &q=$city&aqi=yes');
    final responseData = response.data;

    if (responseData == null) {
      return null;
    }

    final name = responseData['location']['name'] as String;
    final localtime = responseData['location']['localtime'] as String;
    final temperature = (responseData['current']['temp_c']);
    final wind = (responseData['current']['wind_kph']);
    final lastupdated = (responseData['current']['last_updated']);

    return WeatherModel(
      temperature: temperature,
      city: name,
      wind: wind,
      localtime: localtime,
      lastupdated: lastupdated,
    );
  }
}
