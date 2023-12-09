

import 'package:get/get.dart';

import '../../../domain/entity/user_repo.dart';

class DetailedRepoController extends GetxController{

  late final Items items;
  dynamic argumentData = Get.arguments;

  //just show case passing data i am using seperate controller and this, there r other ways to implement the same

  @override
  void onInit() {
    items  = argumentData[0];
    super.onInit();
  }

}