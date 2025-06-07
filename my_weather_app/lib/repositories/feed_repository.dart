import '../../models/post.dart';

abstract class FeedRepository {
  Future<List<Post>> getFakePosts();
}

class FakeFeedRepository implements FeedRepository {
  @override
  Future<List<Post>> getFakePosts() async {
    // Имитация сетевой задержки
    await Future.delayed(const Duration(seconds: 2));

    // Создаем фейковые данные
    return [
      Post(
        id: 1,
        title: 'Погода в Москве',
        content: 'Сегодня ожидается переменная облачность и небольшой дождь.',
        author: 'Иван Петров',
        date: DateTime(2025, 4, 4),
      ),
      Post(
        id: 2,
        title: 'Прогноз на выходные',
        content: 'Температура поднимется до +12°C. Без осадков.',
        author: 'Мария Смирнова',
        date: DateTime(2025, 4, 3),
      ),
      Post(
        id: 3,
        title: 'Совет дня: как одеваться весной',
        content: 'Несколько практичных советов по выбору одежды в переходный период.',
        author: 'Александр Кузнецов',
        date: DateTime(2025, 4, 2),
      ),
    ];
  }
}