import 'package:flutter/material.dart';
import '../models/fake_user.dart';

class FakeUserScreen extends StatelessWidget {
  const FakeUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as FakeUser?;
    
    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Ошибка")),
        body: const Center(child: Text("Пользователь не найден")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(user.avatarPath),
          ),
          const SizedBox(height: 10),
          Text(user.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(user.city, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: user.posts.length,
              itemBuilder: (context, index) {
                PostWithWeather postWithWeather = user.posts[index];

                return Card(
                  child: ListTile(
                    title: Text(postWithWeather.post),
                    subtitle: Text(
                      "${postWithWeather.weather.city} - ${postWithWeather.weather.temperature} - ${postWithWeather.weather.description}",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
