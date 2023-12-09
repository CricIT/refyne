

import 'package:dartz/dartz.dart';
import 'package:refyne_task/data/network/apis/user_repo.dart';
import 'package:refyne_task/domain/entity/user_repo.dart';
import 'package:refyne_task/domain/repository/user_repo.dart';

class UserRepoRepositoryIml implements UserRepoRepository{

  @override
  Future<Either<String, UserRepo>> getUserRepo()  async{

    final response =UserRepo.fromJson(await UserRepoApi.fetch().request());

    //usually backend send the status and a message so we can decide to send the object making some small chnages for this response
    if ((response.items?.length??0)>0) {
      return Right(response);
    } else {
      return  Left("Something went wrong..!!");
    }

  }
  }