import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class FetchWeather extends WeatherEvent {
  final double latitude;
  final double longitude;

  const FetchWeather({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}
