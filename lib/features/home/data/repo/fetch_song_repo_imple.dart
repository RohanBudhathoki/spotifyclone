import 'dart:developer';

import 'package:fpdart/fpdart.dart';

import 'package:spotifyclone/core/error/failure.dart';
import 'package:spotifyclone/features/home/data/datasource/song_remote_data_source.dart';
import 'package:spotifyclone/features/home/domain/entity/songs_entity.dart';
import 'package:spotifyclone/features/home/domain/repo/fetch_song_repo.dart';

import 'package:spotifyclone/features/home/presentation/audio_player_screen/logic/audio_player_services.dart';

class FetchSongRepoImple implements SongRepo {
  final SongRemoteDataSource dataSource;
  final AudioPlayerService service;
  FetchSongRepoImple(this.dataSource, this.service);

  @override
  Stream<Either<Failure, List<Song>>> getSong() async* {
    try {
      final stream = dataSource.getSong();

      await for (final songList in stream) {
        yield right(songList);
      }
    } catch (e) {
      yield left(Failure(message: 'Error fetching songs: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> playAudio({required String songUrl}) async {
    try {
      await service.play(songUrl);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> pauseAudio({required String songUrl}) async {
    try {
      await service.pause(songUrl);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resumeAudio() async {
    try {
      debugger();
      await service.resume();
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> stopAudio() async {
    try {
      await service.stop();
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> seekAudio({required Duration postiton}) async {
    try {
      await service.seek(postiton);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
