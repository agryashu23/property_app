import 'package:get/get.dart';

import '../controllers/owner_add_details_controller.dart';

class OwnerAddDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwnerAddDetailsController>(
      () => OwnerAddDetailsController(),
    );
  }
}
