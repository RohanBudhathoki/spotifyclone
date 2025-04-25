import 'package:fpdart/fpdart.dart';
import 'package:spotifyclone/core/error/failure.dart';
import 'package:spotifyclone/core/usecase/usecases.dart';
import 'package:spotifyclone/features/authentication/domain/entities/user_entity.dart';
import 'package:spotifyclone/features/authentication/domain/repository/auth_repo.dart';

class LoginGoogle implements UseCase<User, NoParams> {
  final AuthRepo authRepo;

  LoginGoogle(this.authRepo);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepo.googleLogin();
  }
}
