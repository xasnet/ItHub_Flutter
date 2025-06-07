import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadUser extends UserEvent {}

class UpdateUser extends UserEvent {
  final String firstName;
  final String lastName;
  final String location;

  UpdateUser({required this.firstName, required this.lastName, required this.location});

  @override
  List<Object?> get props => [firstName, lastName, location];
}

class UpdateUserPhoto extends UserEvent {
  final File photo;

  UpdateUserPhoto(this.photo);

  @override
  List<Object?> get props => [photo];
}
