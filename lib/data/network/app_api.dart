import 'package:dio/dio.dart';
import 'package:sky_watch/data/database/database_helper.dart';
import 'package:sky_watch/data/network/dio_factory.dart';
import 'package:sky_watch/domain/models/models.dart';

class WeatherService {
  DioFactory dioFactory = DioFactory();

  Future<WeatherData> getWeather(double latitude, double longitude) async {
    final databaseHelper = DatabaseHelper();

    try {
      Response response =
          await dioFactory.sendRequest.get("lat=$latitude&lon=$longitude");
      final weatherData = WeatherData.fromJson(response.data);
      await databaseHelper.insertWeatherData(weatherData);
      return WeatherData.fromJson(response.data);
    } catch (ex) {
      rethrow;
    }
  }
}

class WeatherCityService {
  DioFactory dioFactory = DioFactory();

  Future<CityModel> getCityWeather(String city) async {
    try {
      Response response = await dioFactory.sendRequest.get("city=$city");
      return CityModel.fromJson(response.data);
    } catch (ex) {
      rethrow;
    }
  }
}
