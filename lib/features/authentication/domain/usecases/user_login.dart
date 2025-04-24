import 'package:fpdart/fpdart.dart';

import 'package:spotifyclone/core/error/failure.dart';
import 'package:spotifyclone/core/usecase/usecases.dart';
import 'package:spotifyclone/features/authentication/domain/entities/user_entity.dart';
import 'package:spotifyclone/features/authentication/domain/repository/auth_repo.dart';

class UserLogin implements UseCase<User, UserLoginParams> {
  final AuthRepo authRepo;
  UserLogin(this.authRepo);

  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return await authRepo.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({required this.password, required this.email});
}
