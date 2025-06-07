import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../blocs/profile/profile_bloc.dart';
import '../blocs/weather/weather_state.dart';
import '../models/comment.dart';
import '../blocs/weather/weather_bloc.dart';
import 'profile_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  File? _avatar;

  void _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _avatar = File(pickedFile.path);
      });
    }
  }

  void _showCommentDialog(BuildContext context) {
    TextEditingController commentController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Опубликовать комментарий"),
          content: TextField(
            controller: commentController,
            maxLength: 120,
            decoration: const InputDecoration(hintText: "Введите комментарий..."),
          ),
          actions: [
            TextButton(
              child: const Text("Отмена"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("Опубликовать"),
              onPressed: () {
                if (commentController.text.isNotEmpty) {
                  context.read<ProfileBloc>().add(AddCommentEvent(commentController.text));
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, weatherState) {
        String city = "Неизвестно";
        String temperature = "--°C";
        String description = "Нет данных";

        if (weatherState is WeatherLoaded) {
          city = weatherState.weather.city;
          temperature = "${weatherState.weather.temperature}°C";
          description = weatherState.weather.description;
        }

        return Scaffold(
          appBar: AppBar(title: const Text("Профиль")),
          body: Column(
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _avatar != null ? FileImage(_avatar!) : null,
                  child: _avatar == null ? const Icon(Icons.person, size: 50) : null,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _showCommentDialog(context),
                child: const Text("Опубликовать комментарий о погоде"),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, profileState) {
                    if (profileState is ProfileLoaded) {
                      int displayedComments = profileState.comments.length > 6 ? 6 : profileState.comments.length;

                      return ListView.builder(
                        itemCount: displayedComments,
                        itemBuilder: (context, index) {
                          Comment comment = profileState.comments[index];
                          return Card(
                            child: ListTile(
                              title: Text(comment.text),
                              subtitle: Text("$city, $temperature, $description"),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(child: Text("Нет комментариев"));
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Кнопка "Посмотреть профиль"
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfileScreen()),
                      );
                    },
                    child: const Text("Посмотреть профиль"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
