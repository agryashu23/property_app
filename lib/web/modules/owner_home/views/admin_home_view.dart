import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/login/views/login_view.dart';
import 'package:property_app/app/modules/owner_home/views/profile/components/personal_details.dart';
import 'package:property_app/app/modules/register/views/register_view.dart';
import 'package:property_app/web/modules/profile/admin_profile_view.dart';
import 'package:property_app/app/contants/app_colors.dart';
import 'package:property_app/app/modules/owner_add_property/views/owner_add_property_view.dart';
import 'package:property_app/web/modules/owner_home/views/property_detail/property_detail.dart';
import 'package:property_app/web/modules/profile/components/owner_change_personal_details.dart';
import '../../login/views/login_view.dart';
import '../../profile/components/personal_details.dart';
import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  AdminHomeView({Key? key}) : super(key: key);

  AdminHomeController controller = Get.put(AdminHomeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/app/Image-4.png'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 100),
                  const Flexible(
                    fit: FlexFit.tight,
                    child: TabBar(
                      indicatorColor: Colors.green,
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.green,
                      tabs: [
                        Tab(
                          text: 'Home',
                        ),
                        Tab(
                          text: 'Hotel',
                        ),
                        Tab(
                          text: 'Owners',
                        ),
                        Tab(
                          text: 'Users',
                        ),
                        // Tab(
                        //   text: 'Profile',
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              Flexible(
                child: TabBarView(
                  children: [
                    AdminPropertiesBody(controller: controller),
                    AdminHotelBody(controller: controller),
                    AdminOwnersBody(controller: controller),
                    AdminUsersBody(controller: controller),
                    // AdminProfileView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminPropertiesBody extends StatelessWidget {
  const AdminPropertiesBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AdminHomeController controller;

  @override
  Widget build(BuildContext context) {

    controller.getListOfOwners();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          child: Text("LOg out"),
          onPressed: (){
            controller.signOut();
            Get.to(AdminLoginView());
          },
        ),
        const SizedBox(height: 26),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // InkWell(
            //   onTap: () {
            //     //print('OnTap: ${controller.propertyOwnersData.length}');
            //     //print('OnTap: ${controller.propertyOwnersData[0].userName}');
            //     //print('OnTap2: ${controller.propertyOwners.length}');
            //     //print('OnTap2: ${controller.propertyOwners}');
            //     // controller.getListOfOwners();
            //     print('OnTap: ${controller.owners}');
            //   },
            //   child: Text(
            //     'Select Property Owner',
            //     style: TextStyle(
            //       color: textColorDark,
            //       fontSize: 16,
            //       letterSpacing: 1.3,
            //     ),
            //   ),
            // ),
            const SizedBox(width: 20),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width / 4,
            //   child: DropdownButtonFormField<String>(
            //     alignment: AlignmentDirectional.center,
            //     items: controller.propertyOwners.map((owner) {
            //       return DropdownMenuItem<String>(
            //         value: owner['user_name'],
            //         child: Text(owner['user_name']),
            //       );
            //     }).toList(),
            //     onChanged: (String? newValue) {
            //       controller.selectedOwner.value = newValue!;
            //     },
            //     isDense: true,
            //     style: const TextStyle(
            //       color: Color(0xFF7D7F88),
            //     ),
            //     value: controller.selectedOwner.value,
            //     decoration: InputDecoration(
            //       hintText: 'Select Property Owner',
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(
            //           color: Color(0xFF7AA721),
            //           width: 0.8,
            //         ),
            //         borderRadius: BorderRadius.circular(25.0),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(
            //           color: Color(0xFF7AA721),
            //           width: 0.8,
            //         ),
            //         borderRadius: BorderRadius.circular(25.0),
            //       ),
            //       fillColor: const Color(0xFFF2F2F3),
            //       filled: true,
            //     ),
            //   ),
            // ),
            const SizedBox(width: 20),
            Text(
              'Total Properties: ',
              style: TextStyle(
                color: textColorDark,
                fontSize: 16,
                letterSpacing: 1.3,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              controller.properties.length.toString(),
              style: TextStyle(
                color: textColorDark,
                fontSize: 16,
                letterSpacing: 1.3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 26),
        Padding(
          padding: const EdgeInsets.only(left: 32.5),
          child: Text(
            'Owners Active Properties',
            style: TextStyle(
              color: textColorDark,
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
    return GetX<AdminHomeController>(
        init: Get.put<AdminHomeController>(AdminHomeController()),
        builder: (controller) {
          return Flexible(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
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
                                horizontal: 25, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xFFFFFFFF),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF434343),
                                  offset: Offset.zero,
                                ),
                              ],
                            ),
                            height: 150,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // controller.properties[index].image!.isNotEmpty
                                //     ? Image.network(
                                //         '${controller.properties[index].image!}',
                                //         fit: BoxFit.fill,
                                //         height: 189,
                                //         width: 108,
                                //       )
                                //     :
                              Image.asset(
                                        'assets/app/Image-1.png',
                                        fit: BoxFit.fill,
                                        height: 189,
                                        width: 108,
                                      ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
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
                                              OwnerAddPropertyView(
                                                update: controller
                                                    .isUpdate.value,
                                                propertyNo: controller
                                                    .properties[index]
                                                    .propertyNo,
                                                propertyStreet: controller
                                                    .properties[index]
                                                    .propertyStreet,
                                                propertyLandmark: controller
                                                    .properties[index]
                                                    .propertyLandmark,
                                                propertyType: controller
                                                    .properties[index]
                                                    .propertyType,
                                                propertyCity: controller
                                                    .properties[index]
                                                    .propertyCity,
                                                propertyState: controller
                                                    .properties[index]
                                                    .propertyState,
                                                propertyPincode: controller
                                                    .properties[index]
                                                    .propertyPincode,
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
                                                propertydocId: controller
                                                    .properties[index]
                                                    .propertydocId,
                                                isHotel: controller
                                                    .properties[index]
                                                    .isHotel,
                                                contactPerson: controller
                                                    .properties[index]
                                                    .contactPerson,
                                                contactNumber: controller
                                                    .properties[index]
                                                    .contactNumber,
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
                                          const TextSpan(
                                            text: '/month',
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

class AdminHotelBody extends StatelessWidget {
  const AdminHotelBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AdminHomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 26),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   'Select Hotel Owner',
            //   style: TextStyle(
            //     color: textColorDark,
            //     fontSize: 16,
            //     letterSpacing: 1.3,
            //   ),
            // ),
            const SizedBox(width: 20),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width / 4,
            //   child: DropdownButtonFormField<String>(
            //     alignment: AlignmentDirectional.center,
            //     items: controller.propertyOwners.map((owner) {
            //       return DropdownMenuItem<String>(
            //         value: owner['user_name'],
            //         child: Text(owner['user_name']),
            //       );
            //     }).toList(),
            //     onChanged: (String? newValue) {
            //       controller.selectedOwner.value = newValue!;
            //     },
            //     isDense: true,
            //     style: const TextStyle(
            //       color: Color(0xFF7D7F88),
            //     ),
            //     value: controller.selectedOwner.value,
            //     decoration: InputDecoration(
            //       hintText: 'Select Hotel Owner',
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(
            //           color: Color(0xFF7AA721),
            //           width: 0.8,
            //         ),
            //         borderRadius: BorderRadius.circular(25.0),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(
            //           color: Color(0xFF7AA721),
            //           width: 0.8,
            //         ),
            //         borderRadius: BorderRadius.circular(25.0),
            //       ),
            //       fillColor: const Color(0xFFF2F2F3),
            //       filled: true,
            //     ),
            //   ),
            // ),
            const SizedBox(width: 20),
            Text(
              'Total Hotels: ',
              style: TextStyle(
                color: textColorDark,
                fontSize: 16,
                letterSpacing: 1.3,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              controller.properties2.length.toString(),
              style: TextStyle(
                color: textColorDark,
                fontSize: 16,
                letterSpacing: 1.3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 26),
        Padding(
          padding: const EdgeInsets.only(left: 32.5),
          child: Text(
            'Owners Active Hotels',
            style: TextStyle(
              color: textColorDark,
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
    return GetX<AdminHomeController>(
        init: Get.put<AdminHomeController>(AdminHomeController()),
        builder: (controller) {
          return Flexible(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.properties2.length,
                itemBuilder: (context, index) {
                  return controller.properties2.isNotEmpty
                      ? InkWell(
                          onTap: () async {
                            controller.tappedPropertyId.value =
                                controller.properties[index].propertydocId!;
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
                              color: const Color(0xFFFFFFFF),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF434343),
                                  offset: Offset.zero,
                                ),
                              ],
                            ),
                            height: 150,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                controller.properties[index].image!.isNotEmpty
                                    ? Image.network(
                                        '${controller.properties[index].image!}',
                                        fit: BoxFit.fill,
                                        height: 189,
                                        width: 108,
                                      )
                                    : Image.asset(
                                        'assets/app/Image-1.png',
                                        fit: BoxFit.fill,
                                        height: 189,
                                        width: 108,
                                      ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
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
                                              OwnerAddPropertyView(
                                                update: controller
                                                    .isUpdate.value,
                                                propertyNo: controller
                                                    .properties[index]
                                                    .propertyNo,
                                                propertyStreet: controller
                                                    .properties[index]
                                                    .propertyStreet,
                                                propertyLandmark: controller
                                                    .properties[index]
                                                    .propertyLandmark,
                                                propertyType: controller
                                                    .properties[index]
                                                    .propertyType,
                                                propertyCity: controller
                                                    .properties[index]
                                                    .propertyCity,
                                                propertyState: controller
                                                    .properties[index]
                                                    .propertyState,
                                                propertyPincode: controller
                                                    .properties[index]
                                                    .propertyPincode,
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
                                                propertydocId: controller
                                                    .properties[index]
                                                    .propertydocId,
                                                isHotel: controller
                                                    .properties[index]
                                                    .isHotel,
                                                contactPerson: controller
                                                    .properties[index]
                                                    .contactPerson,
                                                contactNumber: controller
                                                    .properties[index]
                                                    .contactNumber,
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
                                          const TextSpan(
                                            text: '/month',
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

class AdminOwnersBody extends StatelessWidget {
  const AdminOwnersBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AdminHomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 26),
        Padding(
          padding: const EdgeInsets.only(left: 32.5),
          child: Text(
            'Active Owners',
            style: TextStyle(
              color: textColorDark,
              fontSize: 18,
              letterSpacing: 1.3,
            ),
          ),
        ),
        const SizedBox(height: 15),
        userDetailListFirestore(),
        const SizedBox(height: 27),
      ],
    );
  }

  Widget userDetailListFirestore() {
    return GetX<AdminHomeController>(
        init: Get.put<AdminHomeController>(AdminHomeController()),
        builder: (controller) {
          return Flexible(
            fit: FlexFit.loose,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.propertyOwnersData.length,
                itemBuilder: (context, index) {
                  return controller.propertyOwnersData.isNotEmpty
                      ? InkWell(
                          onTap: () async {
                           controller.tappedUserId.value =
                                controller.propertyOwnersData[index].userId!;
                            print(controller.tappedUserId.value);
                            await controller.getTappedUserData(
                                controller.tappedUserId.value);
                            print(controller.userDetail.length);
                            if (controller.userDetail.length > 0) {
                              Get.to(OwnerPersonalDetails2());
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 29, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xFFFFFFFF),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF434343),
                                  offset: Offset.zero,
                                ),
                              ],
                            ),
                            height: 150,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                controller.propertyOwnersData[index].profileImage!.isNotEmpty
                                    ? Image.network(
                                        '${controller.propertyOwnersData[index].profileImage!}',
                                        fit: BoxFit.fill,
                                        height: 189,
                                        width: 108,
                                      )
                                    : Image.asset(
                                        'assets/app/photo.jpeg',
                                        fit: BoxFit.fill,
                                        height: 189,
                                        width: 108,
                                      ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            controller.isUpdate.value =
                                                true;
                                            controller.tappedUserId.value =
                                            controller.propertyOwnersData[index].userId!;
                                            print(controller.tappedUserId.value);
                                            await controller.getTappedUserData(
                                                controller.tappedUserId.value);
                                            Get.to(OwnerChangePersonalDetails2());
                                          },
                                          icon: const Icon(
                                            Icons.edit_rounded,
                                            size: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                '${controller.propertyOwnersData[index].userName}\n',
                                            style: TextStyle(
                                              color: textColorDark,
                                              fontSize: 16,
                                            ),
                                          ),
                                          TextSpan(
                                            text: controller.propertyOwnersData[index]
                                                .userEmail,
                                            style: const TextStyle(
                                              color: Color(0xFF7D7F88),
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                '${controller.propertyOwnersData[index].phoneNo}',
                                            style: TextStyle(
                                              color: textColorDark,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),const SizedBox(height: 10),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : const Center(
                          child: Text('No Owners Found'),
                        );
                }),
          );
        });
  }
}

class AdminUsersBody extends StatelessWidget {
  const AdminUsersBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AdminHomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 26),
        Padding(
          padding: const EdgeInsets.only(left: 32.5),
          child: Text(
            'Active Users',
            style: TextStyle(
              color: textColorDark,
              fontSize: 18,
              letterSpacing: 1.3,
            ),
          ),
        ),
        const SizedBox(height: 15),
        userDetailListFirestore(),
        const SizedBox(height: 27),
      ],
    );
  }
  Widget userDetailListFirestore() {
    return GetX<AdminHomeController>(
        init: Get.put<AdminHomeController>(AdminHomeController()),
        builder: (controller) {
          return Flexible(
            fit: FlexFit.loose,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.propertyOwnersData.length,
                itemBuilder: (context, index) {
                  return controller.propertyOwnersData.isNotEmpty
                      ? InkWell(
                    onTap: () async {
                      controller.tappedUserId.value =
                      controller.propertyOwnersData[index].userId!;
                      print(controller.tappedUserId.value);
                      await controller.getTappedUserData(
                          controller.tappedUserId.value);
                      print(controller.userDetail.length);
                      if (controller.userDetail.length > 0) {
                        Get.to(OwnerPersonalDetails2());
                      }
                    },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 29, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xFFFFFFFF),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF434343),
                                  offset: Offset.zero,
                                ),
                              ],
                            ),
                            height: 200,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                controller.propertyOwnersData[index].profileImage!.isNotEmpty
                                    ? Image.network(
                                        '${controller.propertyOwnersData[index].profileImage!}',
                                        fit: BoxFit.fill,
                                        height: 189,
                                        width: 108,
                                      )
                                    : Image.asset(
                                        'assets/app/photo.jpeg',
                                        fit: BoxFit.fill,
                                        height: 189,
                                        width: 108,
                                      ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            controller.isUpdate.value =
                                            true;
                                            controller.tappedUserId.value =
                                            controller.propertyOwnersData[index].userId!;
                                            print(controller.tappedUserId.value);
                                            await controller.getTappedUserData(
                                                controller.tappedUserId.value);
                                            Get.to(OwnerChangePersonalDetails2());
                                          },
                                          icon: const Icon(
                                            Icons.edit_rounded,
                                            size: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                '${controller.propertyOwnersData[index].userName}\n',
                                            style: TextStyle(
                                              color: textColorDark,
                                              fontSize: 16,
                                            ),
                                          ),
                                          TextSpan(
                                            text: controller.propertyOwnersData[index]
                                                .userEmail,
                                            style: const TextStyle(
                                              color: Color(0xFF7D7F88),
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                '${controller.propertyOwnersData[index].phoneNo}',
                                            style: TextStyle(
                                              color: textColorDark,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),const SizedBox(height: 10),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : const Center(
                          child: Text('No Users Found'),
                        );
                }),
          );
        });
  }
}
