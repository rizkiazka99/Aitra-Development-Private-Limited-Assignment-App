import 'package:aitradevelopmentprivateltdassignmentapp/modules/controller/controllers/detail_controller.dart';
import 'package:get/get.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
  }
}