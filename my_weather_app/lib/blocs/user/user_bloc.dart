import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_event.dart';
import 'user_state.dart';
import '../../models/user.dart';
import '../../services/firebase_service.dart';
import '../../repositories/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FirebaseService firebaseService;
  final UserRepository userRepository;

  UserBloc(this.firebaseService, this.userRepository) : super(UserInitial()) {
    on<LoadUser>((event, emit) async {
      emit(UserLoading());
      try {
        // Сначала загружаем из локального хранилища
        User? user = await userRepository.loadUser();
        
        // Если данных нет, загружаем из Firebase
        if (user == null) {
          final data = await firebaseService.getUserData();
          if (data != null) {
            user = User.fromMap(data);
            await userRepository.saveUser(user); // Сохраняем локально
          } else {
            user = User(id: '', firstName: '', lastName: '', location: '', avatarUrl: '');
          }
        }
        emit(UserLoaded(user));
      } catch (e) {
        emit(UserError("Ошибка загрузки пользователя"));
      }
    });

    on<UpdateUser>((event, emit) async {
      if (state is UserLoaded) {
        final user = (state as UserLoaded).user.copyWith(
          firstName: event.firstName,
          lastName: event.lastName,
          location: event.location,
        );

        // Сохраняем в Firestore и локально
        await firebaseService.saveUserData(user.toMap());
        await userRepository.saveUser(user);

        emit(UserLoaded(user));
      }
    });

    on<UpdateUserPhoto>((event, emit) async {
      if (state is UserLoaded) {
        final avatarUrl = await firebaseService.uploadUserPhoto(event.photo);
        if (avatarUrl != null) {
          final user = (state as UserLoaded).user.copyWith(avatarUrl: avatarUrl);
          
          await firebaseService.saveUserData(user.toMap());
          await userRepository.saveUser(user);

          emit(UserLoaded(user));
        }
      }
    });
  }
}
