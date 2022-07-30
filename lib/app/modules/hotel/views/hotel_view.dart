
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:property_app/app/modules/home/views/home_view.dart';
import 'package:property_app/app/modules/hotel/views/components/hotel_app_bar.dart';
import 'package:property_app/app/modules/hotel/views/components/hotel_detail.dart';
import 'package:property_app/app/modules/hotel/views/search/search_delegate.dart';
import 'package:property_app/app/contants/app_colors.dart';
import '../controllers/hotel_controller.dart';

class HotelView extends GetView<HotelController> {
  HotelView({Key? key}) : super(key: key);

  HotelController controller = Get.put(HotelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: HomeBottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            HotelAppBar(),
            const SizedBox(height: 26),
            hotelSearchBar(context),
            const SizedBox(height: 38),
            Padding(
              padding: const EdgeInsets.only(left: 32.5),
              child: Obx(
                () => RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hotel Near You\n',
                        style: TextStyle(
                          fontSize: 18,
                          color: Get.isDarkMode?Colors.white:Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Hotels in ${controller.currentAddress.value}',
                        style: TextStyle(
                          fontSize: 13,
                          color: Get.isDarkMode?Colors.white:Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(child: propertyDetailListFirestore()),
            const SizedBox(height: 38),
          ],
        ),
      ),
    );
  }

  Widget propertyDetailListFirestore() {
    return GetX<HotelController>(
        init: Get.put<HotelController>(HotelController()),
        builder: (controller) {
          if (controller.filterProperties.isNotEmpty) {
            // controller.filterProperties.value = filteredHotels!;
            print('FilterPropertyList: ${controller.filterProperties.length}');
            return Flexible(
              fit: FlexFit.loose,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.filterProperties.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(HotelDetailScreen(
                          propertydocId:
                              controller.filterProperties[index].propertydocId,
                          propertyName:
                              controller.filterProperties[index].propertyName,
                          propertyLocation: controller
                              .filterProperties[index].propertyLocation,
                          rooms: controller.filterProperties[index].rooms,
                          area: controller.filterProperties[index].area,
                          areaType: controller.filterProperties[index].areaType,
                          rentPrice:
                              controller.filterProperties[index].rentPrice,
                          rating: controller.filterProperties[index].rating,
                          ratingCount:
                              controller.filterProperties[index].ratingCount,
                          contactPerson:
                              controller.filterProperties[index].contactPerson,
                          contactNumber:
                              controller.filterProperties[index].contactNumber,
                          propertyFurnishing: controller
                              .filterProperties[index].propertyFurnishing,
                          propertyAvailable: controller
                              .filterProperties[index].propertyAvailable,
                          propertyFacing:
                              controller.filterProperties[index].propertyFacing,
                          propertyBathrooms: controller
                              .filterProperties[index].propertyBathrooms,
                          propertyBalcony: controller
                              .filterProperties[index].propertyBalcony,
                          propertyImage1:
                              controller.filterProperties[index].propertyImage1,
                          propertyImage2:
                              controller.filterProperties[index].propertyImage2,
                          propertyImage3:
                              controller.filterProperties[index].propertyImage3,
                          propertyImage4:
                              controller.filterProperties[index].propertyImage4,
                          propertyImage5:
                              controller.filterProperties[index].propertyImage5,
                          propertyImage6:
                              controller.filterProperties[index].propertyImage6,
                          propertyImage7:
                              controller.filterProperties[index].propertyImage7,
                          propertyImage8:
                              controller.filterProperties[index].propertyImage8,
                          propertyVideo1:
                              controller.filterProperties[index].propertyVideo1,
                          propertyHighlights: controller
                              .filterProperties[index].propertyHighlights,
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
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
                        height: 190,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            controller.filterProperties[index].propertyImage1!
                                    .isNotEmpty
                                ? Image.network(
                                    '${controller.filterProperties[index].propertyImage1!}',
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
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 18),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_rate_rounded,
                                        color: Color(0xFFFFBF75),
                                        size: 12,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: controller
                                                  .filterProperties[index]
                                                  .rating,
                                              style: TextStyle(
                                                color: textColorDark,
                                                fontSize: 12,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '(${controller.filterProperties[index].ratingCount})',
                                              style: TextStyle(
                                                color: Color(0xFF7D7F88),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    width: 220,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                '${controller.filterProperties[index].propertyName}\n',
                                            style: TextStyle(
                                              color: textColorDark,
                                              fontSize: 16,
                                            ),
                                          ),
                                          TextSpan(
                                            text: controller
                                                .filterProperties[index]
                                                .propertyLocation,
                                            style: TextStyle(
                                              color: Color(0xFF7D7F88),
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 13.5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.meeting_room_rounded,
                                        size: 14,
                                        color: Color(0xFF7D7F88),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        '${controller.filterProperties[index].rooms} room',
                                        style: TextStyle(
                                          color: Color(0xFF7D7F88),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  '₹${controller.filterProperties[index].rentPrice} ',
                                              style: TextStyle(
                                                color: textColorDark,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '/ Day',
                                              style: TextStyle(
                                                color: Color(0xFF7D7F88),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 50.5),
                                      IconButton(
                                        onPressed: () {
                                          controller.updateFavProperty(
                                              controller.filterProperties[index]
                                                  .propertydocId!,
                                              !controller
                                                  .filterProperties[index]
                                                  .isFavorate!);
                                        },
                                        icon: controller.filterProperties[index]
                                                .isFavorate!
                                            ? Icon(
                                                Icons.favorite,
                                                size: 25,
                                                color: Color(0xFF7AA721),
                                              )
                                            : Icon(
                                                Icons.favorite_border_rounded,
                                                size: 25,
                                                color: Color(0xFF7D7F88),
                                              ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return Center(child: Text('No data filtered.'));
          }
        });
  }

  Container hotelSearchBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        autofocus: false,
        style: TextStyle(color: Colors.black),
        onTap: () {
          showSearch(
              context: context,
              delegate: HotelDataSearch(controller.properties));
        },
        decoration: InputDecoration(
          hintText: 'Search address, city, location',
          hintStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(25.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(25.0),
          ),
          fillColor: const Color(0xFFF2F2F3),
          filled: true,
          prefixIcon: Image.asset('assets/home/search-normal.png'),
        ),
      ),
    );
  }
}
