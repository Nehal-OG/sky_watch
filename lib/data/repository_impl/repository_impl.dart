import 'package:sky_watch/data/network/app_api.dart';
import 'package:sky_watch/domain/models/models.dart';

class WeatherRepository {
  final WeatherService _weatherService;

  WeatherRepository(this._weatherService);

  Future<WeatherData> getWeather(double latitude, double longitude) async {
    return await _weatherService.getWeather(latitude, longitude);
  }
}

class WeatherCityRepository {
  final WeatherCityService _weatherCityService;

  WeatherCityRepository(this._weatherCityService);

  Future<CityModel> getCityWeather(String city) async {
    return await _weatherCityService.getCityWeather(city);
  }
}
