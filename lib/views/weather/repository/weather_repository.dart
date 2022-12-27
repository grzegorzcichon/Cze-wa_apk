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
    final winddir = (responseData['current']['wind_dir']);
    final pressure = (responseData['current']['pressure_mb']);
    final lastupdated = (responseData['current']['last_updated']);
    final pm25 = (responseData['current']['air_quality']['pm2_5']);
    final pm10 = (responseData['current']['air_quality']['pm10']);
    final co = (responseData['current']['air_quality']['co']);

    return WeatherModel(
      temperature: temperature,
      city: name,
      wind: wind,
      localtime: localtime,
      lastupdated: lastupdated,
      pressure: pressure,
      winddir: winddir,
      pm25: pm25,
      pm10: pm10,
      co: co,
    );
  }
}
