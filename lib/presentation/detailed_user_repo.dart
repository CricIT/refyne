



import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:refyne_task/app/my_strings.dart';
import 'package:refyne_task/presentation/widgets/user_repo_cards.dart';
import '../app/app_colors.dart';
import 'controller/detailed_repo/detailed_repo_contoroller.dart';

class DetailedUserRepoPage extends GetView<DetailedRepoController>{

  const DetailedUserRepoPage({super.key});

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
              child: SingleChildScrollView(
                child:DetailedUserRepoCard(controller.items),
              )),
        ));
  }


}
