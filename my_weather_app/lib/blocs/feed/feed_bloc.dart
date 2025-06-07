import 'package:flutter_bloc/flutter_bloc.dart';
import 'feed_event.dart';
import 'feed_state.dart';
import '../../repositories/feed_repository.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final FeedRepository feedRepository;

  FeedBloc(this.feedRepository) : super(FeedInitial()) {
    on<LoadFeed>((event, emit) async {
      emit(FeedLoading());
      try {
        final posts = await feedRepository.getFakePosts();
        emit(FeedLoaded(posts));
      } catch (e) {
        emit(FeedError("Ошибка загрузки постов"));
      }
    });
  }
}
