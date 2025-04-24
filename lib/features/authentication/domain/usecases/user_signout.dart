import 'package:fpdart/fpdart.dart';
import 'package:spotifyclone/core/error/failure.dart';
import 'package:spotifyclone/core/usecase/usecases.dart';

import 'package:spotifyclone/features/authentication/domain/repository/auth_repo.dart';

class UserLogout implements UseCase<void, NoParams> {
  final AuthRepo authRepo;

  UserLogout(this.authRepo);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await authRepo.logout();
  }
}
