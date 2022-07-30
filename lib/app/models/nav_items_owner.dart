import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/owner_all_property/views/owner_all_property_view.dart';
import 'package:property_app/app/modules/owner_home/views/booked_hotels/booked_hotels.dart';
import 'package:property_app/app/modules/owner_home/views/owner_home_view.dart';

class NavItemOwner {
  final int? id;
  final IconData icon;
  final String name;
  final Widget? destination;
  NavItemOwner({
    this.id,
    required this.icon,
    required this.name,
    this.destination,
  });

  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

class NavItemsOwner extends GetxController {
  var selectedIndex = 1.obs;

  void changeNavIndex({required int index}) {
    selectedIndex.value = index;
  }

  static List<NavItemOwner> items = [
    NavItemOwner(
      id: 1,
      icon: Icons.house_rounded,
      name: 'All Property',
      destination: OwnerAllPropertyView(),
    ),
    NavItemOwner(
      id: 2,
      icon: Icons.home_outlined,
      name: 'Home',
      destination: OwnerHomeView(),
    ),
    NavItemOwner(
      id: 3,
      icon: Icons.hotel_rounded,
      name: 'Booked Hotels',
      destination: BookedHotelView(),
    ),
  ];
}
