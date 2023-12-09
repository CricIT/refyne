import 'package:get/get.dart';
import 'package:refyne_task/presentation/controller/detailed_repo/detailed-repo_binding.dart';
import 'package:refyne_task/presentation/landing_page.dart';

import '../../presentation/controller/landing_page/landing_page_binding.dart';
import '../../presentation/detailed_user_repo.dart';
import 'app_route.dart';

class Routes {
  static List<GetPage> getAllPages() {
    return [
      GetPage(
        name: AppRoutes.LANDING_PAGE,
        page: () => const LandingPage(),
        binding: LandingPageBinding(),
      ),

      GetPage(
        name: AppRoutes.DETAILED_REPO_PAGE,
        page: () => const DetailedUserRepoPage(),
        binding: DetailedRepoBinding(),
      ),

    ];
  }
}
