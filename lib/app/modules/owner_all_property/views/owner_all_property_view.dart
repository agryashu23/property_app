import 'package:flutter/material.dart';
import 'package:property_app/app/contants/app_colors.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/owner_home/views/components/owner_home_app_bar.dart';
import 'package:property_app/app/modules/owner_home/views/owner_home_view.dart';
import '../../owner_home/controllers/owner_home_controller.dart';
import '../controllers/owner_all_property_controller.dart';

class OwnerAllPropertyView extends GetView<OwnerAllPropertyController> {
  OwnerAllPropertyView({Key? key}) : super(key: key);

  @override
  final OwnerAllPropertyController controller =
      Get.put(OwnerAllPropertyController());
  final OwnerHomeController controller2 = Get.put(OwnerHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: OwnerHomeBottomNavBar(),
      body: AllPropertyOwnerBody(controller: controller,controller2:controller2),
    );
  }
}

class AllPropertyOwnerBody extends StatelessWidget {
  const AllPropertyOwnerBody({
    Key? key,
    required this.controller,required this.controller2
  }) : super(key: key);

  final OwnerAllPropertyController controller;
  final OwnerHomeController controller2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const OwnerHomeAppBar(),
        const SizedBox(height: 26),
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
        // allPropertyDetailList(),
        allPropertyDetailListFirestore(),
        const SizedBox(height: 27),
      ],
    );
  }

  Widget allPropertyDetailListFirestore() {
    return GetX<OwnerAllPropertyController>(
      init: Get.put<OwnerAllPropertyController>(OwnerAllPropertyController()),
      builder: (controller) {
        return Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: controller.properties.length,
            itemBuilder: (context, index) {
              return controller.properties.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 29,vertical: 5),
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
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 225,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                  .properties[index].rating,
                                              style: TextStyle(
                                                color: textColorDark,
                                                fontSize: 12,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  ' (${controller.properties[index].ratingCount})',
                                              style: const TextStyle(
                                                color: Color(0xFF7D7F88),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
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
                                        text: controller
                                            .properties[index].propertyLocation,
                                        style: const TextStyle(
                                          color: Color(0xFF7D7F88),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
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
                                ),
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
                                      // TextSpan(
                                      //   text: controller2.properties[index].isHotel==1?'/day':'/month',
                                      //   style: TextStyle(
                                      //     color: Color(0xFF7D7F88),
                                      //     fontSize: 12,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.updatePropertyData(
                                            controller.properties[index]
                                                .propertydocId!,
                                            true);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 23,
                                        width: 52,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xFF7AA721),
                                            width: controller
                                                    .properties[index].isActive!
                                                ? 0
                                                : 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          gradient: controller
                                                  .properties[index].isActive!
                                              ? const LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  stops: [0.1, 1.0],
                                                  colors: [
                                                    Color(0xFFB5EB49),
                                                    Color(0xFF7AA721),
                                                  ],
                                                )
                                              : const LinearGradient(
                                                  colors: [
                                                    Color(0xFFFFFFFF),
                                                    Color(0xFFFFFFFF),
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
                                    ),
                                    const SizedBox(width: 16),
                                    InkWell(
                                      onTap: () {
                                        controller.updatePropertyData(
                                            controller.properties[index]
                                                .propertydocId!,
                                            false);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 23,
                                        width: 52,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xFFFF0000),
                                            width: controller
                                                    .properties[index].isActive!
                                                ? 1
                                                : 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          gradient: controller
                                                  .properties[index].isActive!
                                              ? const LinearGradient(
                                                  colors: [
                                                    Color(0xFFFFFFFF),
                                                    Color(0xFFFFFFFF),
                                                  ],
                                                )
                                              : const LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  stops: [1.0, 0.1],
                                                  colors: [
                                                    Color(0xFFFF4242),
                                                    Color(0xFFFF0000),
                                                  ],
                                                ),
                                        ),
                                        child: const Text(
                                          'Disable',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF000000),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : const Center(
                      child: Text('No Properties Found'),
                    );
            },
          ),
        );
      },
    );
  }
}
