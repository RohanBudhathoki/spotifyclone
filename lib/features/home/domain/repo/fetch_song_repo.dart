import 'package:fpdart/fpdart.dart';
import 'package:spotifyclone/core/error/failure.dart';

import '../entity/songs_entity.dart';

abstract class SongRepo {
  Stream<Either<Failure, List<Song>>> getSong();
  Future<Either<Failure, void>> playAudio({required String songUrl});
  Future<Either<Failure, void>> pauseAudio({required String songUrl});
  Future<Either<Failure, void>> stopAudio();
  Future<Either<Failure, void>> resumeAudio();
  Future<Either<Failure, void>> seekAudio({required Duration postiton});
}
