import 'package:flutter_bloc/flutter_bloc.dart';
import 'settings_event.dart';
import 'settings_state.dart';
import '../../repositories/settings_repository.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository settingsRepository;

  SettingsBloc(this.settingsRepository) : super(SettingsInitial()) {
    on<ToggleNotifications>((event, emit) async {
      final currentState = state is SettingsUpdated
          ? state as SettingsUpdated
          : const SettingsUpdated(true, true);

      final newNotificationsState = !currentState.notificationsEnabled;
      settingsRepository.saveNotifications(newNotificationsState);
      emit(SettingsUpdated(newNotificationsState, currentState.soundEnabled));
    });

    on<ToggleSound>((event, emit) async {
      final currentState = state is SettingsUpdated
          ? state as SettingsUpdated
          : const SettingsUpdated(true, true);

      final newSoundState = !currentState.soundEnabled;
      settingsRepository.saveSound(newSoundState);
      emit(SettingsUpdated(currentState.notificationsEnabled, newSoundState));
    });
  }
}
