class WeatherData {
  final double windSpeed;
  final int windDegrees;
  final double temperature;
  final int humidity;
  final int sunset;
  final double minTemperature;
  final int cloudPercentage;
  final double feelsLike;
  final int sunrise;
  final double maxTemperature;
  final String error;

  WeatherData(
      {required this.error,
      required this.windSpeed,
      required this.windDegrees,
      required this.temperature,
      required this.humidity,
      required this.sunset,
      required this.minTemperature,
      required this.cloudPercentage,
      required this.feelsLike,
      required this.sunrise,
      required this.maxTemperature});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      windSpeed: json['wind_speed'].toDouble(),
      windDegrees: json['wind_degrees'].toInt(),
      temperature: json['temp'].toDouble(),
      humidity: json['humidity'].toInt(),
      sunset: json['sunset'].toInt(),
      minTemperature: json['min_temp'].toDouble(),
      cloudPercentage: json['cloud_pct'].toInt(),
      feelsLike: json['feels_like'].toDouble(),
      sunrise: json['sunrise'].toInt(),
      maxTemperature: json['max_temp'].toDouble(),
      error: json['error'].toString(),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'wind_speed': windSpeed,
      'wind_degrees': windDegrees,
      'temp': temperature,
      'humidity': humidity,
      'sunset': sunset,
      'min_temp': minTemperature,
      'cloud_pct': cloudPercentage,
      'feels_like': feelsLike,
      'sunrise': sunrise,
      'max_temp': maxTemperature,
    };
  }
}

class CityModel {
  final double windSpeed;
  final int windDegrees;
  final double temperature;
  final int humidity;
  final int sunset;
  final double minTemperature;
  final int cloudPercentage;
  final double feelsLike;
  final int sunrise;
  final double maxTemperature;

  CityModel(
      {required this.windSpeed,
      required this.windDegrees,
      required this.temperature,
      required this.humidity,
      required this.sunset,
      required this.minTemperature,
      required this.cloudPercentage,
      required this.feelsLike,
      required this.sunrise,
      required this.maxTemperature});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      windSpeed: json['wind_speed'].toDouble(),
      windDegrees: json['wind_degrees'].toInt(),
      temperature: json['temp'].toDouble(),
      humidity: json['humidity'].toInt(),
      sunset: json['sunset'].toInt(),
      minTemperature: json['min_temp'].toDouble(),
      cloudPercentage: json['cloud_pct'].toInt(),
      feelsLike: json['feels_like'].toDouble(),
      sunrise: json['sunrise'].toInt(),
      maxTemperature: json['max_temp'].toDouble(),
    );
  }
}
