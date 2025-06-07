# ItHub_Flutter
[3ИТД.22].[2025_4_семестр].Flutter

# Weather App

Мобильное приложение на Flutter My Weather App для отображения текущей погоды с возможностью комментирования и просмотра ленты постов других пользователей.
Использует https://www.weatherapi.com/

## Автор
Храмцев Алексей

## Функциональность

- Отображение текущей погоды по геолокации
- Профиль пользователя с аватаром и комментариями
- Лента постов других пользователей и погодными условиями в их городах
- Экран настроек
- Выбор и загрузка аватара из галереи
- Сохранение данных пользователя и комментариев
- Использование архитектуры BLoC
- Интеграция с Firebase для хранения данных

## Технологии

- **Flutter (Dart)**
- **BLoC (flutter_bloc)**
- **Firebase (Cloud Firestore)**
- **HTTP (API запросы к weatherapi.com)**
- **SharedPreferences (локальное сохранение данных)**
- **image_picker (выбор аватара)**

## Установка и запуск

### 1. Установка зависимостей (Загружает зависимости из pubspec.yaml и создаёт pubspec.lock)

flutter pub get

### 2. Запуск приложения (Запускает Flutter-приложение на подключённом устройстве или эмуляторе/симуляторе)

flutter run

## Требования

Установленный Flutter SDK
Настроенный эмулятор

## Настройка API

Настройки Firebase configuration для запуска в Google Chrome в файле
lib/main.dart

Приложение использует weatherapi.com для получения данных о погоде
API-ключ указан в файле:
lib/services/weather_service.dart

# my_weather_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
