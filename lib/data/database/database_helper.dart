import 'package:sky_watch/domain/models/models.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String databaseName = 'weather.db';
  static const int databaseVersion = 1;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await openDatabase(
      databaseName,
      version: databaseVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE weather (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            wind_speed REAL NOT NULL,
            wind_degrees INTEGER NOT NULL,
            temp REAL NOT NULL,
            humidity INTEGER NOT NULL,
            sunset INTEGER NOT NULL,
            min_temp REAL NOT NULL,
            cloud_pct INTEGER NOT NULL,
            feels_like REAL NOT NULL,
            sunrise INTEGER NOT NULL,
            max_temp REAL NOT NULL
          )
        ''');
      },
    );

    return _database!;
  }

  Future<void> insertWeatherData(WeatherData weatherResponse) async {
    final db = await database;

    await db.insert('weather', weatherResponse.toMap());
  }

  Future<WeatherData?> getLatestWeatherData() async {
    final db = await database;

    final List<Map<String, dynamic>> results =
        await db.query('weather', orderBy: 'id DESC', limit: 1);

    if (results.isEmpty) {
      return null;
    }

    return WeatherData.fromJson(results.first);
  }
}
