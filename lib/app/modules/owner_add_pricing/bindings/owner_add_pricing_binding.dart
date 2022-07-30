import 'package:get/get.dart';

import '../controllers/owner_add_pricing_controller.dart';

class OwnerAddPricingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwnerAddPricingController>(
      () => OwnerAddPricingController(),
    );
  }
}
