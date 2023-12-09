

import 'package:get/get.dart';
import 'package:refyne_task/domain/entity/user_repo.dart';

import '../../../app/enum.dart';
import '../../../domain/usedcase/user_repo_usecase.dart';

class LandingPageController extends GetxController{
  final UserRepoUseCase _usedCase;

  LandingPageController(this._usedCase);

   UserRepo userData = UserRepo();


  var viewState = NetworkUsedCase.loading.obs;

  @override
  onInit() {
    super.onInit();

    loadData();
  }

  loadData() async {
    try {
      final response = await _usedCase.getUserRepo();
      response.fold((error) => _handleUserRepoErrorCase(error: error),
              (success) => _handleUserRepoSuccessCase(success.obs));
    } on Exception catch (e) {
      viewState.value=NetworkUsedCase.success;
      update();
    }
  }

  _handleUserRepoSuccessCase(Rx<UserRepo> result) {
    viewState.value=NetworkUsedCase.success;
    userData=result.value;
    update();
  }

  _handleUserRepoErrorCase({required String error}) {
    viewState.value=NetworkUsedCase.error;
    update();
  }


}