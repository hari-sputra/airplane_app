import 'package:air_plane/models/user_model.dart';
import 'package:air_plane/services/auth_service.dart';
import 'package:air_plane/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel user =
          await AuthService().signIn(email: email, password: password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signUp({
    required String name,
    required String email,
    required String password,
    String hobby = '',
  }) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthService().signUp(
        name: name,
        email: email,
        password: password,
        hobby: hobby,
      );

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUserById(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void updateCurrentUser(String name, String email, String hobby) async {
    try {
      emit(AuthLoading());
      await UserService()
          .updateUserById(UserModel(email: email, name: name, hobby: hobby));
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
