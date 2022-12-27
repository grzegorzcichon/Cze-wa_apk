class WeatherModel {
  const WeatherModel(
      {required this.temperature,
      required this.city,
      required this.wind,
      required this.localtime,
      required this.lastupdated,
      required this.winddir,
      required this.pressure,
      required this.pm25,
      required this.pm10,
      required this.co});

  final double temperature;
  final String city;
  final double wind;
  final String winddir;
  final double pressure;
  final String localtime;
  final String lastupdated;
  final double pm25;
  final double pm10;
  final double co;
}
