import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/app_colors.dart';
import '../../app/dimensions.dart';
import 'custom_button.dart';

class ErrorWidgetView extends StatelessWidget {
  final Function() buttonAction;

  const ErrorWidgetView({super.key, required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(Get.context!).size.height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.FONT_SIZE_XLARGE),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(Get.context!).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        'assets/images/error.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                       "${'oops'.tr} ${'wrong'.tr}",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('working'.tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomButton(
                      width:MediaQuery.of(Get.context!).size.width * 0.8,
                      buttonAction: buttonAction,
                      child: Text(
                        'retry'.tr,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
