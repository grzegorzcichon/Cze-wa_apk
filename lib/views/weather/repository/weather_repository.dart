import 'package:czestochowa_app/views/weather/model/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherRepository {
  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final response = await Dio().get(
        'http://api.weatherapi.com/v1/current.json?key=bad6992f8a184659840180617222012 &q=Czestochowa&aqi=yes');
    print(response.data);
    return const WeatherModel(temperature: -100, city: 'Czestochwa');
  }
}
