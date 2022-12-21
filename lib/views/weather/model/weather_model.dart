class WeatherModel {
  const WeatherModel({
    required this.temperature,
    required this.city,
    required this.wind,
    required this.localtime,
    required this.lastupdated,
  });
  final double temperature;
  final String city;

  final double wind;

  final String localtime;
  final String lastupdated;
}
