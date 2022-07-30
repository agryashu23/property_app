import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:property_app/web/modules/login/bindings/login_binding.dart';
import 'package:property_app/web/modules/login/controllers/login_controller.dart';
import 'package:property_app/web/modules/login/views/login_view.dart';
import 'package:property_app/web/modules/owner_home/bindings/admin_home_binding.dart';
import 'package:property_app/web/modules/owner_home/views/admin_home_view.dart';
import '../modules/filter/bindings/filter_binding.dart';
import '../modules/filter/views/filter_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/hotel/bindings/hotel_binding.dart';
import '../modules/hotel/views/hotel_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/owner_add_details/bindings/owner_add_details_binding.dart';
import '../modules/owner_add_details/views/owner_add_details_view.dart';
import '../modules/owner_add_location/bindings/owner_add_location_binding.dart';
import '../modules/owner_add_location/views/owner_add_location_view.dart';
import '../modules/owner_add_pricing/bindings/owner_add_pricing_binding.dart';
import '../modules/owner_add_pricing/views/owner_add_pricing_view.dart';
import '../modules/owner_add_property/bindings/owner_add_property_binding.dart';
import '../modules/owner_add_property/views/owner_add_property_view.dart';
import '../modules/owner_all_property/bindings/owner_all_property_binding.dart';
import '../modules/owner_all_property/views/owner_all_property_view.dart';
import '../modules/owner_home/bindings/owner_home_binding.dart';
import '../modules/owner_home/views/owner_home_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/save/bindings/save_binding.dart';
import '../modules/save/views/save_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = kIsWeb?Routes.ADMIN_HOME:Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_LOGIN,
      page: () => AdminLoginView(),
      binding: AdminLoginBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SAVE,
      page: () => SaveView(),
      binding: SaveBinding(),
    ),
    GetPage(
      name: _Paths.HOTEL,
      page: () => HotelView(),
      binding: HotelBinding(),
    ),
    GetPage(
      name: _Paths.FILTER,
      page: () => FilterView(),
      binding: FilterBinding(),
    ),
    GetPage(
      name: _Paths.OWNER_HOME,
      page: () => OwnerHomeView(),
      binding: OwnerHomeBinding(),
    ),
    GetPage(
      name: _Paths.OWNER_ALL_PROPERTY,
      page: () => OwnerAllPropertyView(),
      binding: OwnerAllPropertyBinding(),
    ),
    GetPage(
      name: _Paths.OWNER_ADD_PROPERTY,
      page: () => OwnerAddPropertyView(),
      binding: OwnerAddPropertyBinding(),
    ),
    GetPage(
      name: _Paths.OWNER_ADD_LOCATION,
      page: () => OwnerAddLocationView(),
      binding: OwnerAddLocationBinding(),
    ),
    GetPage(
      name: _Paths.OWNER_ADD_DETAILS,
      page: () => OwnerAddDetailsView(),
      binding: OwnerAddDetailsBinding(),
    ),
    GetPage(
      name: _Paths.OWNER_ADD_PRICING,
      page: () => OwnerAddPricingView(),
      binding: OwnerAddPricingBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_HOME,
      page: () => AdminHomeView(),
      binding: AdminHomeBinding(),
    ),
  ];
}
