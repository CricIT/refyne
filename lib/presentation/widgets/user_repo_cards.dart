import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(item.owner?.avatarUrl??"https://png.pngtree.com/png-vector/20190917/ourmid/pngtree-not-found-circle-icon-vectors-png-image_1737851.jpg",
              height: MediaQuery.of(Get.context!).size.height*0.1,width: MediaQuery.of(Get.context!).size.height*0.1,),
              const SizedBox(
                width: Dimensions.PADDING_SIZE_SMALL,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: ${item.fullName ?? " "}"),
                    const SizedBox(
                      height: Dimensions.PADDING_SIZE_SMALL,
                    ),
                    Text("Description ${item.description ?? " "}",maxLines: 10,overflow: TextOverflow.visible,),
                    const SizedBox(
                      height: Dimensions.PADDING_SIZE_DEFAULT,
                    ),
                    Text("Count: ${item.forksCount.toString() ?? " "}"),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Dimensions.PADDING_SIZE_SMALL,
          ),
          Text("login: ${item.owner?.login ?? " "}"),
          const SizedBox(
            height: Dimensions.PADDING_SIZE_SMALL,
          ),
          Text("Owner Type: ${item.owner?.type ?? " "}"),
        ],
      ),
    );
  }
}