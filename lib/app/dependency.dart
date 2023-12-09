import 'package:get/get.dart';
import 'package:refyne_task/data/repositories/user_repo_repositoryi_ml.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => UserRepoRepositoryIml(), fenix: true);

  }
}
