import 'package:equatable/equatable.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object?> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsUpdated extends SettingsState {
  final bool notificationsEnabled;
  final bool soundEnabled;

  const SettingsUpdated(this.notificationsEnabled, this.soundEnabled);

  @override
  List<Object?> get props => [notificationsEnabled, soundEnabled];
}
