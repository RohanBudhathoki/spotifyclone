import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotifyclone/core/router/app_route.dart';
import 'package:spotifyclone/dependecy_injection.dart';
import 'package:spotifyclone/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:spotifyclone/features/choose_theme/presentation/bloc/theme_choose_cubit.dart';
import 'package:spotifyclone/features/home/presentation/audio_player_screen/cubit/audio_player_cubit.dart';

import 'package:spotifyclone/features/home/presentation/bloc/song_bloc.dart';
import 'package:spotifyclone/spotify.dart';

final _appRouter = AppRouter();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initDependecies();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  runApp(
    (MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeChooseCubit()),
        BlocProvider(create: (_) => AudioPlayerCubit()),
        BlocProvider(create: (_) => serviceLocater<AuthBloc>()),
        BlocProvider(create: (_) => serviceLocater<SongBloc>()),
      ],
      child: SpotifyApp(appRouter: _appRouter),
    )),
  );
}
