import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/comment.dart';


abstract class ProfileEvent {}

class AddCommentEvent extends ProfileEvent {
  final String text;

  AddCommentEvent(this.text);
}

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final List<Comment> comments;

  ProfileLoaded(this.comments);
}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final List<Comment> _comments = [];

  ProfileBloc() : super(ProfileInitial()) {
    on<AddCommentEvent>((event, emit) {
      _comments.insert(0, Comment(text: event.text, date: DateTime.now()));
      if (_comments.length > 6) {
        _comments.removeLast();
      }
      emit(ProfileLoaded(List.from(_comments)));
    });
  }
}
