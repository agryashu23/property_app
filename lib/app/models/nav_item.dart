import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/home/views/home_view.dart';
import 'package:property_app/app/modules/hotel/views/hotel_view.dart';
import 'package:property_app/app/modules/save/views/save_view.dart';

class NavItem {
  final int? id;
  final IconData icon;
  final String name;
  final Widget? destination;
  NavItem({
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

class NavItems extends GetxController {
  var selectedIndex = 1.obs;

  void changeNavIndex({required int index}) {
    selectedIndex.value = index;
  }

  static List<NavItem> items = [
    NavItem(
        id: 1,
        icon: Icons.local_hotel_outlined,
        name: 'Hotel',
        destination: HotelView()),
    NavItem(
      id: 2,
      icon: Icons.home_outlined,
      name: 'Home',
      destination: HomeView(),
    ),
    NavItem(
      id: 3,
      icon: Icons.favorite_border_rounded,
      name: 'Saved',
      destination: SaveView(),
    ),
  ];
}
