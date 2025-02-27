import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    emit(LoginLoading());
    final result = await authRepo.loginUserWithEmailAndPassword(
      email,
      password,
    );
    result.fold(
      (failure) => emit(
        LoginFailure(message: failure.message),
      ),
      (userEntity) => emit(
        LoginSuccess(userEntity: userEntity),
      ),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.loginWithGoogle();
    result.fold(
      (failure) => emit(
        LoginFailure(message: failure.message),
      ),
      (userEntity) => emit(
        LoginSuccess(userEntity: userEntity),
      ),
    );
  }

  Future<void> loginWithfacebook() async {
    emit(LoginLoading());
    final result = await authRepo.loginWithFacebook();
    result.fold(
      (failure) => emit(
        LoginFailure(message: failure.message),
      ),
      (userEntity) => emit(
        LoginSuccess(userEntity: userEntity),
      ),
    );
  }
}
