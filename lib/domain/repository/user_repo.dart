




import 'package:dartz/dartz.dart';
import 'package:refyne_task/domain/entity/user_repo.dart';

abstract class UserRepoRepository {

  Future<Either<String, UserRepo>> getUserRepo();


}