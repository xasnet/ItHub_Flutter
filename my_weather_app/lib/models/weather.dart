class Weather {
  final String city;
  final double temperature;
  final String description;

  Weather({required this.city, required this.temperature, required this.description});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['location']?['name'] ?? 'Неизвестный город',
      temperature: (json['current']?['temp_c'] as num?)?.toDouble() ?? 0.0,
      description: json['current']?['condition']?['text'] ?? 'Нет данных'
    );
  }
}
