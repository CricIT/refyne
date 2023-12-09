import 'package:flutter/cupertino.dart';
import 'package:refyne_task/app/app_colors.dart';
import 'package:refyne_task/app/dimensions.dart';
import 'package:refyne_task/domain/entity/user_repo.dart';

class BasicUserRepoCard extends StatelessWidget {
  final UserRepo userData;
  final int index;

  const BasicUserRepoCard(this.userData, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:   BoxDecoration(
         boxShadow: const [
        BoxShadow(
            color: AppColors.primary,
            blurRadius: Dimensions.RADIUS_EXTRA_SMALL,
          ),
        ],
          color: AppColors.bgColor,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_SMALL),
          border: Border.all(
            color: AppColors.lightGray,
            width: 1,
          )),
      margin: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name: ${userData.items?[index].fullName ?? " "}"),
          const SizedBox(
            height: Dimensions.PADDING_SIZE_DEFAULT,
          ),
          Text("Description ${userData.items?[index].description ?? " "}"),
          const SizedBox(
            height: Dimensions.PADDING_SIZE_DEFAULT,
          ),
          Text("Count: ${userData.items?[index].forksCount.toString() ?? " "}"),
        ],
      ),
    );
  }
}


class DetailedUserRepoCard extends StatelessWidget {
  final Items item;

  const DetailedUserRepoCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:   BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: AppColors.primary,
              blurRadius: Dimensions.RADIUS_EXTRA_SMALL,
            ),
          ],
          color: AppColors.bgColor,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_SMALL),
          border: Border.all(
            color: AppColors.lightGray,
            width: 1,
          )),
      margin: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name: ${item.fullName ?? " "}"),
          const SizedBox(
            height: Dimensions.PADDING_SIZE_DEFAULT,
          ),
          Text("Description ${item.description ?? " "}"),
          const SizedBox(
            height: Dimensions.PADDING_SIZE_DEFAULT,
          ),
          Text("Count: ${item.forksCount.toString() ?? " "}"),
        ],
      ),
    );
  }
}