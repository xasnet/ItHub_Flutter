import '../../models/fake_user.dart';

List<FakeUser> fakeUsers = [
  FakeUser(
    name: "Иван Петров",
    city: "Москва",
    avatarPath: "assets/avatar1.png",
    posts: [
      PostWithWeather(
        post: "Сегодня в Москве отличная погода, солнечно!",
        weather: WeatherData(
          city: "Москва",
          temperature: "+18°C",
          description: "Солнечно",
        ),
      ),
      PostWithWeather(
        post: "Немного прохладно, но приятно гулять.",
        weather: WeatherData(
          city: "Москва",
          temperature: "+12°C",
          description: "Облачно",
        ),
      ),
    ],
  ),
  FakeUser(
    name: "Анастасия Смирнова",
    city: "Санкт-Петербург",
    avatarPath: "assets/avatar2.png",
    posts: [
      PostWithWeather(
        post: "В Питере как всегда дождь...",
        weather: WeatherData(
          city: "Санкт-Петербург",
          temperature: "+9°C",
          description: "Дождь",
        ),
      ),
      PostWithWeather(
        post: "Надеюсь, завтра будет солнце!",
        weather: WeatherData(
          city: "Санкт-Петербург",
          temperature: "+10°C",
          description: "Пасмурно",
        ),
      ),
    ],
  ),
  FakeUser(
    name: "Алексей Козлов",
    city: "Казань",
    avatarPath: "assets/avatar3.png",
    posts: [
      PostWithWeather(
        post: "Жаркий день, пришлось спрятаться в тени.",
        weather: WeatherData(
          city: "Казань",
          temperature: "+27°C",
          description: "Солнечно",
        ),
      ),
      PostWithWeather(
        post: "Жду прохлады вечером.",
        weather: WeatherData(
          city: "Казань",
          temperature: "+20°C",
          description: "Тепло",
        ),
      ),
    ],
  ),
  FakeUser(
    name: "Мария Иванова",
    city: "Новосибирск",
    avatarPath: "assets/avatar4.png",
    posts: [
      PostWithWeather(
        post: "Снегопад, но красиво!",
        weather: WeatherData(
          city: "Новосибирск",
          temperature: "-5°C",
          description: "Снег",
        ),
      ),
      PostWithWeather(
        post: "Тепло оделась, не замерзаю.",
        weather: WeatherData(
          city: "Новосибирск",
          temperature: "-3°C",
          description: "Пасмурно",
        ),
      ),
    ],
  ),
];