import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/core/usecase/usecases.dart';
import 'package:spotifyclone/features/authentication/domain/usecases/login_google.dart';
import 'package:spotifyclone/features/authentication/domain/usecases/user_login.dart';
import 'package:spotifyclone/features/authentication/domain/usecases/user_signout.dart';
import 'package:spotifyclone/features/authentication/domain/usecases/user_signup.dart';

import '../../domain/entities/user_entity.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final UserLogout _userlogout;
  final LoginGoogle _googleLogin;

  AuthBloc({
    required UserSignUp userSignup,
    required UserLogin userLogin,
    required UserLogout userLogout,
    required LoginGoogle googleLogin,
  }) : _userSignUp = userSignup,
       _userLogin = userLogin,
       _userlogout = userLogout,
       _googleLogin = googleLogin,

       super(AuthInitial()) {
    on<AuthEvent>((_, emit) => AuthLoading());
    on<AuthLogin>(_onAuthLogin);
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogout>(_onAuthLogOut);
    on<AuthGoogleLogin>(_onGoogleAuth);
  }
  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final response = await _userSignUp(
      UserSignUpParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ),
    );
    response.fold(
      (l) => emit(AuthFailure(l.message)),
      (user) => emitSucesss(user, emit),
    );
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final response = await _userLogin(
      UserLoginParams(password: event.password, email: event.email),
    );
    response.fold(
      (l) => emit(AuthFailure(l.message)),
      (user) => emitSucesss(user, emit),
    );
  }

  void emitSucesss(User user, Emitter<AuthState> emit) {
    emit(AuthSucess(user));
  }

  void _onAuthLogOut(AuthLogout event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await _userlogout(NoParams());

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(AuthLogOutSucess()),
    );
  }

  void _onGoogleAuth(AuthGoogleLogin event, Emitter<AuthState> emit) async {
    final response = await _googleLogin(NoParams());

    response.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSucess(user)),
    );
  }
}
