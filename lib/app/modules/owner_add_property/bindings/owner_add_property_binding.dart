import 'package:get/get.dart';

import '../controllers/owner_add_property_controller.dart';

class OwnerAddPropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwnerAddPropertyController>(
      () => OwnerAddPropertyController(),
    );
  }
}
