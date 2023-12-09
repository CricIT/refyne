

import 'package:get/get.dart';

import 'detailed_repo_contoroller.dart';

class DetailedRepoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailedRepoController());


  }


}