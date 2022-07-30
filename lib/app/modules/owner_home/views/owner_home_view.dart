import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/models/nav_items_owner.dart';
import 'package:property_app/app/contants/app_colors.dart';
import 'package:property_app/app/modules/owner_add_location/views/owner_add_location_view.dart';
import 'package:property_app/app/modules/owner_add_property/views/owner_add_property_view.dart';
import 'package:property_app/app/modules/owner_home/views/components/owner_home_app_bar.dart';
import 'package:property_app/app/modules/owner_home/views/property_detail/property_detail.dart';

import '../../owner_add_details/views/owner_add_details_view.dart';
import '../controllers/owner_home_controller.dart';

class OwnerHomeView extends GetView<OwnerHomeController> {
  OwnerHomeView({Key? key}) : super(key: key);

  @override
  OwnerHomeController controller = Get.put(OwnerHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: OwnerHomeBottomNavBar(),
      body: HomeOwnerBody(
        controller: controller,
      ),
    );
  }
}

class HomeOwnerBody extends StatefulWidget {
  const HomeOwnerBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OwnerHomeController controller;

  @override
  State<HomeOwnerBody> createState() => _HomeOwnerBodyState();
}

class _HomeOwnerBodyState extends State<HomeOwnerBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const OwnerHomeAppBar(),
        const SizedBox(height: 26),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFB5EB49),
                Color(0xFF7AA721),
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF434343),
                offset: Offset.zero,
              ),
            ],
          ),
          height: 142,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Want to host your own place?',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 20,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Earn passive income by renting your properties!',
                style: TextStyle(
                  color: Color(0xFF456309),
                  fontSize: 13,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: 'Please select from below',
                    titleStyle: TextStyle(color: Colors.black),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState((){
                              widget.controller.isHotel.value = 1;
                            });
                            print(widget.controller.isHotel.value);
                            Get.to(OwnerAddPropertyView());
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30.5,
                              vertical: 12.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(49),
                              color: const Color(0xFFFDFDFD),
                              border:Border.all(color: Colors.black,width: 2.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF0C0045),
                                ),
                              ],
                            ),
                            child: const Text(
                              'Add New Hotel',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF333333),
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            setState((){
                              widget.controller.isHotel.value = 0;
                            });
                            Get.to(OwnerAddPropertyView(
                              isHotel: widget.controller.isHotel.value,
                            ));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30.5,
                              vertical: 12.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(49),
                              color: const Color(0xFFFDFDFD),
                              border:Border.all(color: Colors.black,width: 2.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF0C0045),
                                ),
                              ],
                            ),
                            child: const Text(
                              'Add New Home',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF333333),
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.5,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(49),
                    color: const Color(0xFFFDFDFD),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFF0C0045),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Host a Property',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF333333),
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.only(left: 32.5),
          child: Text(
            'Your Active Properties',
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 1.3,
            ),
          ),
        ),
        const SizedBox(height: 15),
        propertyDetailListFirestore(),
        const SizedBox(height: 27),
      ],
    );
  }

  Widget propertyDetailListFirestore() {
    return GetX<OwnerHomeController>(
        init: Get.put<OwnerHomeController>(OwnerHomeController()),
        builder: (controller) {
          return Flexible(
            fit: FlexFit.loose,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.properties.length,
                itemBuilder: (context, index) {
                  return controller.properties.isNotEmpty
                      ? InkWell(
                          onTap: () async {
                            controller.tappedPropertyId.value =
                                controller.properties[index].propertydocId.toString();
                            print(controller.tappedPropertyId.value);
                            await controller.getTappedPropertyData(
                                controller.tappedPropertyId.value);
                            print(controller.propertyDetail.length);
                            if (controller.propertyDetail.length > 0) {
                              Get.to(OwnerPropertyDetailScreen(
                                  controller: controller));
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 29, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(width: 1.0,color: Colors.white),
                              color: const Color(0xFFFFFFFF),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF434343),
                                  offset: Offset.zero,
                                ),
                              ],
                            ),
                            height: 190,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                controller.properties[index].image!.isNotEmpty
                                    ? Image.network(
                                        '${controller.properties[index].image!}',
                                        fit: BoxFit.fill,
                                        height: 190,
                                        width: 108,
                                      )
                                    : Image.asset(
                                        'assets/app/Image-1.png',
                                        fit: BoxFit.fill,
                                        height: 189,
                                        width: 108,
                                      ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star_rate_rounded,
                                                  color: Color(0xFFFFBF75),
                                                  size: 12,
                                                ),
                                                const SizedBox(width: 6),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: controller
                                                            .properties[index]
                                                            .rating,
                                                        style: TextStyle(
                                                          color: textColorDark,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            ' (${controller.properties[index].ratingCount})',
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xFF7D7F88),
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                controller.isUpdate.value =
                                                    true;
                                                Get.to(
                                                  OwnerAddDetailsView(
                                                    update: controller
                                                        .isUpdate.value,
                                                    // propertyNo: controller
                                                    //     .properties[index]
                                                    //     .propertyNo,
                                                    // propertyStreet: controller
                                                    //     .properties[index]
                                                    //     .propertyStreet,
                                                    // propertyLandmark: controller
                                                    //     .properties[index]
                                                    //     .propertyLandmark,
                                                    // // propertyType: controller
                                                    // //     .properties[index]
                                                    // //     .propertyType,
                                                    // propertyCity: controller
                                                    //     .properties[index]
                                                    //     .propertyCity,
                                                    // propertyState: controller
                                                    //     .properties[index]
                                                    //     .propertyState,
                                                    // propertyPincode: controller
                                                    //     .properties[index]
                                                    //     .propertyPincode,
                                                    rooms: controller
                                                        .properties[index]
                                                        .rooms,
                                                    area: controller
                                                        .properties[index].area,
                                                    areaType: controller
                                                        .properties[index]
                                                        .areaType,
                                                    rentPrice: controller
                                                        .properties[index]
                                                        .rentPrice,
                                                    isActive: controller
                                                        .properties[index]
                                                        .isActive,
                                                    rating: controller
                                                        .properties[index]
                                                        .rating,
                                                    ratingCount: controller
                                                        .properties[index]
                                                        .ratingCount,
                                                    propertydocId:  controller.properties[index].propertydocId.toString(),
                                                    isHotel: controller
                                                        .properties[index]
                                                        .isHotel,
                                                    // contactPerson: controller
                                                    //     .properties[index]
                                                    //     .contactPerson,
                                                    // contactNumber: controller
                                                    //     .properties[index]
                                                    //     .contactNumber,
                                                    propertyFurnishing:
                                                        controller
                                                            .properties[index]
                                                            .propertyFurnishing,
                                                    propertyAvailable:
                                                        controller
                                                            .properties[index]
                                                            .propertyAvailable,
                                                    propertyAvailableFrom:
                                                        controller
                                                            .properties[index]
                                                            .propertyAvailableFrom,
                                                    propertyFloors: controller
                                                        .properties[index]
                                                        .propertyFloors,
                                                    propertyFloorNo: controller
                                                        .properties[index]
                                                        .propertyFloorNo,
                                                    propertyFacing: controller
                                                        .properties[index]
                                                        .propertyFacing,
                                                    propertyBathrooms:
                                                        controller
                                                            .properties[index]
                                                            .propertyBathrooms,
                                                    propertyBalcony: controller
                                                        .properties[index]
                                                        .propertyBalcony,
                                                    propertyImage1: controller
                                                        .properties[index]
                                                        .image,
                                                    propertyImage2: controller
                                                        .properties[index]
                                                        .propertyImage2,
                                                    propertyImage3: controller
                                                        .properties[index]
                                                        .propertyImage3,
                                                    propertyImage4: controller
                                                        .properties[index]
                                                        .propertyImage4,
                                                    propertyImage5: controller
                                                        .properties[index]
                                                        .propertyImage5,
                                                    propertyImage6: controller
                                                        .properties[index]
                                                        .propertyImage6,
                                                    propertyImage7: controller
                                                        .properties[index]
                                                        .propertyImage7,
                                                    propertyImage8: controller
                                                        .properties[index]
                                                        .propertyImage8,
                                                    propertyVideo1: controller
                                                        .properties[index]
                                                        .propertyVideo1,
                                                    propertyHighlights:
                                                        controller
                                                            .properties[index]
                                                            .propertyHighlights,
                                                    propertySecurity: controller
                                                        .properties[index]
                                                        .propertySecurity,
                                                    propertyMaintenance:
                                                        controller
                                                            .properties[index]
                                                            .propertyMaintenance,
                                                    propertyMaintenanceType:
                                                        controller
                                                            .properties[index]
                                                            .propertyMaintenanceType,
                                                  ),
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.edit_rounded,
                                                size: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${controller.properties[index].propertyName}\n',
                                              style: TextStyle(
                                                color: textColorDark,
                                                fontSize: 16,
                                              ),
                                            ),
                                            TextSpan(
                                              text: controller.properties[index]
                                                  .propertyLocation,
                                              style: const TextStyle(
                                                color: Color(0xFF7D7F88),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      controller.properties[index].isHotel == 0
                                          ? Row(
                                              children: [
                                                const Icon(
                                                  Icons.meeting_room_rounded,
                                                  size: 14,
                                                  color: Color(0xFF7D7F88),
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  '${controller.properties[index].rooms} room',
                                                  style: const TextStyle(
                                                    color: Color(0xFF7D7F88),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                const SizedBox(width: 13),
                                                const Icon(
                                                  Icons.aspect_ratio_rounded,
                                                  size: 14,
                                                  color: Color(0xFF7D7F88),
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  '${controller.properties[index].area} m²',
                                                  style: const TextStyle(
                                                    color: Color(0xFF7D7F88),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Container(),
                                      const SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  '₹${controller.properties[index].rentPrice}',
                                              style: TextStyle(
                                                color: textColorDark,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          TextSpan(
                                              text: controller.properties[index].isHotel==1?'/day':'/month',
                                              style: TextStyle(
                                                color: Color(0xFF7D7F88),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 23,
                                        width: 52,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            stops: [0.1, 1.0],
                                            colors: [
                                              Color(0xFFB5EB49),
                                              Color(0xFF7AA721),
                                            ],
                                          ),
                                        ),
                                        child: const Text(
                                          'Active',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF000000),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const Center(
                          child: Text('No Properties Found'),
                        );
                }),
          );
        });
  }
}

class OwnerHomeBottomNavBar extends StatelessWidget {
  OwnerHomeBottomNavBar({
    Key? key,
  }) : super(key: key);

  NavItemsOwner _navItemsController = Get.put(NavItemsOwner());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 108,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 27.0),
        decoration: BoxDecoration(
          color: Get.isDarkMode?Colors.black54:Color(0xFFFFFFFF),

          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -1),
              blurRadius: 30,
              color: const Color(0xFF7AA721).withOpacity(0.2),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              NavItemsOwner.items.length,
              (index) => buildNavBarItemIcon(
                isActive:
                    _navItemsController.selectedIndex == index ? true : false,
                icon: NavItemsOwner.items[index].icon,
                name: NavItemsOwner.items[index].name,
                press: () {
                  _navItemsController.changeNavIndex(index: index);
                  if (NavItemsOwner.items[index].destinationChecker()) {
                    Get.to(NavItemsOwner.items[index].destination!);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNavBarItemIcon(
      {IconData? icon,
      String? name,
      VoidCallback? press,
      bool isActive = false}) {
    return InkWell(
      onTap: press,
      child: Container(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          children: [
            Icon(
              icon,
              color:
                  isActive ? const Color(0xFF7AA721) : const Color(0xFF7D7F88),
              size: 24,
            ),
            const SizedBox(height: 6),
            Text(
              name!,
              style: TextStyle(
                fontSize: 12,
                letterSpacing: -0.5,
                color: isActive
                    ? const Color(0xFF7AA721)
                    : const Color(0xFF7D7F88),
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
