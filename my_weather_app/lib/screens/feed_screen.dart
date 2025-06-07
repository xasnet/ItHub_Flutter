import 'package:flutter/material.dart';
import '../repositories/fake_data.dart';
import '../models/fake_user.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Лента")),
      body: ListView.builder(
        itemCount: fakeUsers.length,
        itemBuilder: (context, index) {
          FakeUser user = fakeUsers[index];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/fakeUser',
                arguments: user, // Передаем объект FakeUser
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(user.avatarPath),
                      radius: 30,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: user.posts.map((postWithWeather) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 3.0),
                                child: Text(
                                  "${postWithWeather.weather.city} - ${postWithWeather.weather.temperature} - ${postWithWeather.weather.description}",
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
