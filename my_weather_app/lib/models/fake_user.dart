class FakeUser {
  final String name;
  final String city;
  final String avatarPath;
  final List<PostWithWeather> posts;

  FakeUser({
    required this.name,
    required this.city,
    required this.avatarPath,
    required this.posts,
  });
}

class PostWithWeather {
  final String post;
  final WeatherData weather;

  PostWithWeather({
    required this.post,
    required this.weather,
  });
}

class WeatherData {
  final String city;
  final String temperature;
  final String description;

  WeatherData({
    required this.city,
    required this.temperature,
    required this.description,
  });
}
