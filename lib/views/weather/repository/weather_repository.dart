import 'package:czestochowa_app/views/weather/model/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    return const WeatherModel(temperature: -10, city: 'Czestochowa');
  }
}
