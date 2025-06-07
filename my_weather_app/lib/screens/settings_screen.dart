import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  bool soundEnabled = true;

  // Логика выхода из профиля
  void _logout() async {
    // Очистка данных пользователя из SharedPreferences или другого хранилища
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Очистка всех данных в SharedPreferences

    // После очистки данных, перенаправляем на экран пользователя
    Navigator.pushReplacementNamed(context, '/user');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Настройки")),
      body: Column(
        children: [
          // Переключатели для уведомлений и звука
          SwitchListTile(
            title: const Text("Уведомления"),
            value: notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text("Звук"),
            value: soundEnabled,
            onChanged: (bool value) {
              setState(() {
                soundEnabled = value;
              });
            },
          ),
          const SizedBox(height: 20),
          // Кнопка для выхода из профиля
          ElevatedButton(
            onPressed: _logout,
            child: const Text("Выйти из профиля"),
          ),
        ],
      ),
    );
  }
}
