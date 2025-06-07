import 'package:equatable/equatable.dart';
import '../../models/comment.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {}

class AddComment extends ProfileEvent {
  final Comment comment;

  const AddComment(this.comment);

  @override
  List<Object?> get props => [comment];
}
