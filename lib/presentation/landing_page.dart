import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:refyne_task/app/my_strings.dart';
import 'package:refyne_task/app/routes/app_route.dart';
import 'package:refyne_task/presentation/widgets/error_widget.dart';
import 'package:refyne_task/presentation/widgets/user_repo_cards.dart';

import '../app/app_colors.dart';
import '../app/dimensions.dart';
import '../app/enum.dart';
import 'controller/landing_page/landing_page_controller.dart';

class LandingPage extends GetView<LandingPageController> {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          title: const Text(MyStrings.appBarHeader),
        ),
        body: SafeArea(
          child: WillPopScope(
              onWillPop: () async {
                // You can do some work here.
                // Returning true allows the pop to happen, returning false prevents it.
                return true;
              },
              child: GetX(
                  init: controller,
                  builder: (context) {
                    return renderUI();
                  })),
        ));
  }

  renderUI() {
    switch (controller.viewState.value) {
      case NetworkUsedCase.loading:
        return SizedBox(
          height: MediaQuery.of(Get.context!).size.height,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      case NetworkUsedCase.error:
        return SizedBox(
          height: MediaQuery.of(Get.context!).size.height,
          child: Center(
            child: ErrorWidgetView(
              buttonAction: () {},
            ),
          ),
        );
      case NetworkUsedCase.userNotFound:
        return SizedBox(
          height: MediaQuery.of(Get.context!).size.height,
          child: const Center(
            child: Text(MyStrings.userNotFound),
          ),
        );
      case NetworkUsedCase.success:
        return SizedBox(
          height: MediaQuery.of(Get.context!).size.height,
          child: ListView.builder(
              itemCount: controller.userData.items?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.DETAILED_REPO_PAGE,
                          arguments: [controller.userData.items?[index]]);
                    },
                    child: BasicUserRepoCard(controller.userData, index));
              }),
        );
    }
  }
}
