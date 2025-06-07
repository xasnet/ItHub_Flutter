import '../models/weather.dart';
import '../services/weather_service.dart';

class WeatherRepository {
  final WeatherService weatherService;

  WeatherRepository({required this.weatherService});

  Future<Weather> getWeather(double latitude, double longitude) async {
    final weather = await weatherService.fetchWeather(latitude, longitude);

    if (weather == null) {
      throw Exception("Ошибка загрузки погоды: пустой ответ от API");
    }

    return weather;
  }
}
