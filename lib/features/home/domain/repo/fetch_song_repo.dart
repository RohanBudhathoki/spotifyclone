import 'package:fpdart/fpdart.dart';
import 'package:spotifyclone/core/error/failure.dart';

import '../entity/songs_entity.dart';

abstract class SongRepo {
  Stream<Either<Failure, List<Song>>> getSong();
}
