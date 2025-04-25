import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:spotifyclone/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:spotifyclone/features/authentication/data/repository/auth_repo_implementation.dart';
import 'package:spotifyclone/features/authentication/domain/repository/auth_repo.dart';
import 'package:spotifyclone/features/authentication/domain/usecases/curret_user.dart';
import 'package:spotifyclone/features/authentication/domain/usecases/login_google.dart';
import 'package:spotifyclone/features/authentication/domain/usecases/user_login.dart';
import 'package:spotifyclone/features/authentication/domain/usecases/user_signout.dart';
import 'package:spotifyclone/features/authentication/domain/usecases/user_signup.dart';
import 'package:spotifyclone/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:spotifyclone/features/home/data/datasource/song_remote_data_source.dart';
import 'package:spotifyclone/features/home/data/repo/fetch_song_repo_imple.dart';
import 'package:spotifyclone/features/home/domain/repo/fetch_song_repo.dart';
import 'package:spotifyclone/features/home/domain/usecases/fetch_song_usecase.dart';
import 'package:spotifyclone/features/home/presentation/bloc/song_bloc.dart';

GetIt serviceLocater = GetIt.instance;
Future<void> initDependecies() async {
  serviceLocater.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
  serviceLocater.registerLazySingleton(() => FirebaseAuth.instance);

  _initAuth();
  _initTask();
}

void _initAuth() {
  //remote data source
  serviceLocater
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocater<FirebaseAuth>(),
        serviceLocater<FirebaseFirestore>(),
      ),
    )
    //auth repositories
    ..registerFactory<AuthRepo>(
      () => AuthRepoImple(
        serviceLocater<AuthRemoteDataSource>(),
        serviceLocater<FirebaseAuth>(),
        serviceLocater<FirebaseFirestore>(),
      ),
    )
    //usecases auth
    ..registerFactory(() => UserSignUp(serviceLocater()))
    ..registerFactory(() => UserLogin(serviceLocater()))
    ..registerFactory(() => UserCurrent(serviceLocater()))
    ..registerFactory(() => UserLogout(serviceLocater()))
    ..registerFactory(() => LoginGoogle(serviceLocater()))
    //auth BLOC
    ..registerLazySingleton(
      () => AuthBloc(
        userSignup: serviceLocater(),
        userLogin: serviceLocater(),
        userLogout: serviceLocater(),
        googleLogin: serviceLocater(),
      ),
    );
}

void _initTask() {
  //remote data source
  serviceLocater
    ..registerFactory<SongRemoteDataSource>(
      () => SongDataSource(serviceLocater<FirebaseFirestore>()),
    )
    //song repo
    ..registerFactory<SongRepo>(
      () => FetchSongRepoImple(serviceLocater<SongRemoteDataSource>()),
    )
    //Song usecases
    ..registerFactory(() => GetSongs(serviceLocater()))
    //song bloc
    ..registerFactory(() => SongBloc(getSongs: serviceLocater()));
}
