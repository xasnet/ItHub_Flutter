import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/weather_repository.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<FetchWeather>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getWeather(event.latitude, event.longitude);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError("Ошибка загрузки погоды: ${e.toString()}"));
    }
  }
}
