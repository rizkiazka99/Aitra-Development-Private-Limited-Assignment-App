import 'package:aitradevelopmentprivateltdassignmentapp/modules/controller/controllers/krishi_bazaar_controller.dart';
import 'package:get/get.dart';

class KrishiBazaarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KrishiBazaarController>(() => KrishiBazaarController());
  }
}