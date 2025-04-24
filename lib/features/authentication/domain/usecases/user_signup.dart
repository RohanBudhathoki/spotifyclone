import 'package:fpdart/fpdart.dart';
import 'package:spotifyclone/core/error/failure.dart';
import 'package:spotifyclone/core/usecase/usecases.dart';
import 'package:spotifyclone/features/authentication/domain/entities/user_entity.dart';
import 'package:spotifyclone/features/authentication/domain/repository/auth_repo.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepo authRepo;

  UserSignUp(this.authRepo);
  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepo.signupWitchEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String password;

  final String name;

  UserSignUpParams({
    required this.password,
    required this.name,
    required this.email,
  });
}
