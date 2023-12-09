


import 'package:get/get.dart';
import 'package:refyne_task/domain/usedcase/user_repo_usecase.dart';
import 'package:refyne_task/presentation/controller/landing_page/landing_page_controller.dart';

import '../../../data/repositories/user_repo_repositoryi_ml.dart';

class LandingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRepoUseCase(Get.find<UserRepoRepositoryIml>()));
    Get.lazyPut<LandingPageController>(() => LandingPageController(Get.find()));
  }
}