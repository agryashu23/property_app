import 'package:get/get.dart';

import '../controllers/owner_add_location_controller.dart';

class OwnerAddLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwnerAddLocationController>(
      () => OwnerAddLocationController(),
    );
  }
}
