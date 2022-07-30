import 'package:get/get.dart';

import '../controllers/owner_all_property_controller.dart';

class OwnerAllPropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwnerAllPropertyController>(
      () => OwnerAllPropertyController(),
    );
  }
}
