import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/weather/weather_bloc.dart';
import '../blocs/weather/weather_event.dart';
import '../blocs/weather/weather_state.dart';
import '../utils/location_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    final locationService = LocationService();
    try {
      final position = await locationService.getCurrentLocation();
      if (position == null) {
        setState(() {
          _errorMessage = "Не удалось получить местоположение";
        });
        return;
      }

      context.read<WeatherBloc>().add(FetchWeather(
          latitude: position.latitude, longitude: position.longitude));
    } catch (e) {
      setState(() {
        _errorMessage = "Ошибка определения местоположения: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Погода"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: _errorMessage != null
            ? Text(_errorMessage!, style: const TextStyle(color: Colors.red))
            : BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is WeatherLoaded) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icon.png', width: 100),
                        Text(state.weather.city,
                            style: const TextStyle(fontSize: 24)),
                        Text('${state.weather.temperature}°C',
                            style: const TextStyle(fontSize: 40)),
                        Text(state.weather.description,
                            style: const TextStyle(fontSize: 20)),
                      ],
                    );
                  } else if (state is WeatherError) {
                    return Text(state.message,
                        style: const TextStyle(color: Colors.red));
                  }
                  return const Text("Загрузка...");
                },
              ),
      ),
    );
  }
}
