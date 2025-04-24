import 'package:fpdart/fpdart.dart';
import 'package:spotifyclone/core/error/failure.dart';

abstract interface class UseCase<SucessType, Params> {
  Future<Either<Failure, SucessType>> call(Params params);
}

class NoParams {}
