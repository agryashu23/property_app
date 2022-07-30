import 'package:get/get.dart';

import '../controllers/hotel_filter_controller.dart';

class HotelFilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HotelFilterController>(
      () => HotelFilterController(),
    );
  }
}
