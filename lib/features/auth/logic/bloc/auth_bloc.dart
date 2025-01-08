import 'package:beep_shop/features/auth/data/model/auth_model.dart';
import 'package:beep_shop/features/auth/data/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc({required this.repository}) : super(AuthInitial()) {
    // login event

    on<LoginEvent>((event, emit) async {
      try {
        emit(AuthIsLoading());
        final data = await repository.loginRepository(
            authLoginModel: event.authLoginModel);
        emit(AuthIsSucces(auth: data));
      } catch (e) {
        emit(AuthIsFailure(error: e.toString()));
      }
    });

    on<GetCurrentUserEvent>((event, emit) async {
      try {
        emit(CurrentAuthUserLoading());
        final data = await repository.getCurrentUser();
        emit(CurrentAuthUserSuccess(auth: data));
      } catch (e) {
        emit(CurrentAuthUserFailure(error: e.toString()));
      }
    });
  }
}
