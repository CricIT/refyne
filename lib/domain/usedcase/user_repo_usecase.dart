import 'package:dartz/dartz.dart';
import 'package:refyne_task/domain/entity/user_repo.dart';
import 'package:refyne_task/domain/repository/user_repo.dart';



class UserRepoUseCase  {
  final UserRepoRepository _repo;
  UserRepoUseCase(this._repo);

  @override
  Future<Either<String, UserRepo>> getUserRepo() async {
    return await _repo.getUserRepo();
  }
}
