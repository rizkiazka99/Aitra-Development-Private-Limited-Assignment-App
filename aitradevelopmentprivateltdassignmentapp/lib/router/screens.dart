import 'package:aitradevelopmentprivateltdassignmentapp/modules/controller/bindings/dashboard_binding.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/controller/bindings/detail_binding.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/controller/bindings/krishi_bazaar_binding.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/view/dashboard.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/view/detail_screen.dart';
import 'package:get/get.dart';

import '../modules/view/krishi_bazaar_screen.dart';

part 'routes.dart';

class AppScreens {
  static const INITIAL = Routes.DASHBOARD;
  static final SCREENS = [
    GetPage(
      name: Routes.DASHBOARD, 
      page: () => const Dashboard(),
      bindings: [
        DashboardBinding(),
        KrishiBazaarBinding()
      ]
    ),
    GetPage(
      name: Routes.KRISHIBAZAAR,
      page: () => const KrishiBazaarScreen(),
      binding: KrishiBazaarBinding()
    ),
    GetPage(
      name: Routes.DETAIL,
      page: () => const DetailScreen(),
      binding: DetailBinding()
    )
  ];
}