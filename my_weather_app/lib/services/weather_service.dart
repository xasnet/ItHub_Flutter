import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherService {
  static const String apiKey = "d2105e55f9194da9a30201158252903";
  static const String baseUrl = "http://api.weatherapi.com/v1/current.json";

  Future<Weather?> fetchWeather(double latitude, double longitude) async {
    final url = Uri.parse("$baseUrl?key=$apiKey&q=$latitude,$longitude&lang=ru");
    
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Weather.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      // Обработка ошибок сети и парсинга
      print("Ошибка получения данных: $e");
      return null;
    }
  }
}