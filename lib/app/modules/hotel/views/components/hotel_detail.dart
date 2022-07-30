import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:property_app/app/modules/hotel/hotel_booking/view/hotel_booking_view.dart';
import 'package:property_app/app/modules/login/controllers/login_controller.dart';
import 'package:property_app/app/modules/register/views/register_view.dart';
import 'package:property_app/app/contants/app_colors.dart';
import 'package:share_plus/share_plus.dart';

class HotelDetailScreen extends StatelessWidget {
  HotelDetailScreen({
    Key? key,
    this.propertydocId,
    this.propertyName,
    this.propertyLocation,
    this.rooms,
    this.area,
    this.areaType,
    this.rentPrice,
    this.rating,
    this.ratingCount,
    this.contactPerson,
    this.contactNumber,
    this.propertyFurnishing,
    this.propertyAvailable,
    this.propertyFacing,
    this.propertyBathrooms,
    this.propertyBalcony,
    this.propertyImage1,
    this.propertyImage2,
    this.propertyImage3,
    this.propertyImage4,
    this.propertyImage5,
    this.propertyImage6,
    this.propertyImage7,
    this.propertyImage8,
    this.propertyVideo1,
    this.propertyHighlights,
  }) : super(key: key);

  HotelDetailScreenController controller =
      Get.put(HotelDetailScreenController());

  final String? propertydocId;
  final String? propertyName;
  final String? propertyLocation;
  final int? rooms;
  final String? area;
  final String? areaType;
  final String? rentPrice;
  final String? rating;
  final String? ratingCount;
  final String? contactPerson;
  final String? contactNumber;
  final String? propertyFurnishing;
  final String? propertyAvailable;
  final String? propertyFacing;
  final int? propertyBathrooms;
  final int? propertyBalcony;
  final String? propertyImage1;
  final String? propertyImage2;
  final String? propertyImage3;
  final String? propertyImage4;
  final String? propertyImage5;
  final String? propertyImage6;
  final String? propertyImage7;
  final String? propertyImage8;
  final String? propertyVideo1;
  final String? propertyHighlights;

  void _shareContent(String subject, String content) async {
    Share.share(content, subject: subject);
  }

  void _callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    var propertyImages = [
      propertyImage1!.isNotEmpty
          ? propertyImage1
          : 'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-13.png',
      propertyImage2!.isNotEmpty
          ? propertyImage2
          : 'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-13.png',
      propertyImage3!.isNotEmpty
          ? propertyImage3
          : 'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-13.png',
      propertyImage4!.isNotEmpty
          ? propertyImage4
          : 'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-13.png',
      propertyImage5!.isNotEmpty
          ? propertyImage5
          : 'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-13.png',
      propertyImage6!.isNotEmpty
          ? propertyImage6
          : 'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-13.png',
      propertyImage7!.isNotEmpty
          ? propertyImage7
          : 'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-13.png',
      propertyImage8!.isNotEmpty
          ? propertyImage8
          : 'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-13.png',
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        rent: rentPrice.toString(),
        hotelController: controller,
        propertyImage1: propertyImage1,
        propertyLocation: propertyLocation,
        propertyName: propertyName,
        propertydocId: propertydocId,
        rating: rating,
        ratingCount: ratingCount,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CarouselSlider(
                  items: propertyImages.map((image) {
                    return Container(
                      // margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(image!),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 269.0,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      controller.carouselCurrentIndex.value = index;
                    },
                  ),
                ),
                Positioned(
                  bottom: 17,
                  right: 16,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 4,
                    ),
                    height: 24,
                    width: 58,
                    decoration: BoxDecoration(
                      color: bgColorLight,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Obx(
                      () => Text(
                        '${controller.carouselCurrentIndex.value + 1}/${propertyImages.length}',
                        style: TextStyle(
                          fontSize: 14,
                          color: textColorDark,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 56,
                  left: 16,
                  child: Container(
                    alignment: Alignment.center,
                    // padding: const EdgeInsets.symmetric(
                    //   horizontal: 11,
                    //   vertical: 4,
                    // ),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: bgColorLight,
                      // borderRadius: BorderRadius.circular(40),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 14,
                        color: textColorDark,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 56,
                  right: 16,
                  child: Container(
                    alignment: Alignment.center,
                    // padding: const EdgeInsets.symmetric(
                    //   horizontal: 11,
                    //   vertical: 4,
                    // ),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: bgColorLight,
                      // borderRadius: BorderRadius.circular(40),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () async {
                        final url = Uri.parse(propertyImage1!);
                        final response = await http.get(url);
                        final bytes = response.bodyBytes;
                        final temp = await getTemporaryDirectory();
                        final path = '${temp.path}/image.jpg';
                        File(path).writeAsBytes(bytes);
                        await Share.shareFiles(
                          [path],
                          text:
                              'Hey! look out this Home once\nHotel Name & Address: $propertyName, $propertyLocation',
                        );
                      },
                      icon: Icon(
                        Icons.share_rounded,
                        size: 14,
                        color: textColorDark,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: propertyName,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.favorite_border_rounded,
                        size: 24,
                        color: Color(0xFF7D7F88),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: Color(0xFFFFBF75),
                            size: 19,
                          ),
                          const SizedBox(width: 8),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: rating,
                                  style: TextStyle(

                                    fontSize: 16,
                                    letterSpacing: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: '(${ratingCount} reviews)',
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.meeting_room_rounded,
                            size: 19,
                            color: Color(0xFF7D7F88),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${rooms} room',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 13.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: Color(0xFF7D7F88),
                            size: 19,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${propertyLocation}',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.aspect_ratio_rounded,
                            size: 19,
                            color: Color(0xFF7D7F88),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${area} ${areaType}',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  const Divider(
                    color: Color(0xFFD6D6D6),
                    thickness: 0.6,
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 42,
                            width: 42,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/app/photo.jpeg'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '$contactPerson\n',
                                  style: TextStyle(

                                    fontSize: 16,
                                    letterSpacing: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Property owner',
                                  style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: borderColor,
                              width: 0.5,
                              style: BorderStyle.solid), //Border.all

                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: borderColor,
                              offset: const Offset(
                                0.0,
                                4.0,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 0.2,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            _callNumber('${contactNumber}');
                          },
                          icon: Icon(
                            Icons.whatsapp_rounded,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  Text(
                    'Hotel facilites',
                    style: TextStyle(
                      fontSize: 18,

                      letterSpacing: 2,
                    ),
                  ),
                  // Text(
                  //   'See all facilities',
                  //   style: TextStyle(
                  //     fontSize: 13,
                  //     color: Color(0xFF7AA721),
                  //     letterSpacing: 2,
                  //   ),
                  // ),
                  //   ],
                  // ),
                  const SizedBox(height: 24),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.air_rounded,
                            color: Color(0xFF7D7F88),
                            size: 18,
                          ),
                          const SizedBox(width: 13),
                          Text(
                            '${propertyFurnishing}',
                            style: TextStyle(
                              fontSize: 16,

                              letterSpacing: 2,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Icon(
                            Icons.soup_kitchen_rounded,
                            color: Color(0xFF7D7F88),
                            size: 18,
                          ),
                          const SizedBox(width: 13),
                          Text(
                            '${propertyAvailable}',
                            style: TextStyle(
                              fontSize: 16,

                              letterSpacing: 2,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Icon(
                            Icons.local_parking_rounded,
                            color: Color(0xFF7D7F88),
                            size: 18,
                          ),
                          const SizedBox(width: 13),
                          Text(
                            'No of Balcony: ${propertyBalcony.toString()}',
                            style: TextStyle(
                              fontSize: 16,

                              letterSpacing: 2,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Icon(
                            Icons.wifi,
                            color: Color(0xFF7D7F88),
                            size: 18,
                          ),
                          const SizedBox(width: 13),
                          Text(
                            'No of Bathroom: ${propertyBathrooms.toString()}',
                            style: TextStyle(
                              fontSize: 16,

                              letterSpacing: 2,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 42),
                  SizedBox(
                    height: 209,
                    child: Obx(
                      () => GoogleMap(
                        mapType: MapType.normal,
                        onMapCreated: (mapController) {
                          if (!controller.mapController.isCompleted) {
                            controller.mapController.complete(mapController);
                          }
                          controller.showMarker(
                              '${propertyName},${propertyLocation}');
                        },
                        initialCameraPosition: CameraPosition(
                          target: LatLng(controller.latitude.value,
                              controller.longitude.value),
                          zoom: 14.0,
                        ),
                        markers: Set<Marker>.from(controller.markers),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Nearest public facilities',
                    style: TextStyle(
                      fontSize: 18,

                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.shopping_bag_rounded,
                                    color: Color(0xFF7D7F88),
                                    size: 20,
                                  ),
                                  const SizedBox(width: 13),
                                  Text(
                                    'Minimarket',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF222831),
                                      letterSpacing: 2,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12),
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: Text(
                                  '200m',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF7D7F88),
                                    letterSpacing: 2,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.restaurant_rounded,
                                    color: Color(0xFF7D7F88),
                                    size: 20,
                                  ),
                                  const SizedBox(width: 13),
                                  Text(
                                    'Public canteen',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF222831),
                                      letterSpacing: 2,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12),
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: Text(
                                  '400m',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF7D7F88),
                                    letterSpacing: 2,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.local_hospital_rounded,
                                    color: Color(0xFF7D7F88),
                                    size: 20,
                                  ),
                                  const SizedBox(width: 13),
                                  Text(
                                    'Hospital',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF222831),
                                      letterSpacing: 2,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12),
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: Text(
                                  '130m',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF7D7F88),
                                    letterSpacing: 2,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.train_rounded,
                                    color: Color(0xFF7D7F88),
                                    size: 20,
                                  ),
                                  const SizedBox(width: 13),
                                  Text(
                                    'Train station',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF222831),
                                      letterSpacing: 2,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12),
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: Text(
                                  '500m',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF7D7F88),
                                    letterSpacing: 2,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "About location's neighborhood",
                    style: TextStyle(
                      fontSize: 18,

                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    propertyHighlights ??
                        '''This cabin comes with Smart Home System and beautiful viking style. You can see sunrise in the morning with City View from full Glass Window. This unit is surrounded by business district of West Surabaya that offers you the city life as well as wide range of culinary. This apartment equipped with Washing Machine, Electric Stove, Microwave, Refrigerator, Cutlery.''',
                    style: TextStyle(
                      color: Color(0xFF7D7F88),
                      fontSize: 16,
                      letterSpacing: 1.3,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Text(
                  //   'Testimonials',
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //
                  //     letterSpacing: 2,
                  //   ),
                  // ),
                  // const SizedBox(height: 24),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     SizedBox(
                  //       height: 42,
                  //       width: 42,
                  //       child: CircleAvatar(
                  //         backgroundImage: AssetImage('assets/app/photo.jpeg'),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 10),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         SizedBox(
                  //           height: 16,
                  //           child: Text(
                  //             'Sans Jose',
                  //             style: TextStyle(
                  //
                  //               fontSize: 16,
                  //               letterSpacing: 2,
                  //             ),
                  //             textHeightBehavior: TextHeightBehavior(
                  //               applyHeightToFirstAscent: false,
                  //             ),
                  //           ),
                  //         ),
                  //         const SizedBox(height: 10),
                  //         SizedBox(
                  //           height: 14,
                  //           child: Row(
                  //             children: [
                  //               Icon(
                  //                 Icons.star_rate_rounded,
                  //                 color: Color(0xFFFFBF75),
                  //                 size: 14,
                  //               ),
                  //               Icon(
                  //                 Icons.star_rate_rounded,
                  //                 color: Color(0xFFFFBF75),
                  //                 size: 14,
                  //               ),
                  //               Icon(
                  //                 Icons.star_rate_rounded,
                  //                 color: Color(0xFFFFBF75),
                  //                 size: 14,
                  //               ),
                  //               Icon(
                  //                 Icons.star_rate_rounded,
                  //                 color: Color(0xFFFFBF75),
                  //                 size: 14,
                  //               ),
                  //               Icon(
                  //                 Icons.star_rate_rounded,
                  //                 color: Color(0xFFFFBF75),
                  //                 size: 14,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 18),
                  // RichText(
                  //   text: TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text:
                  //             '''My wife and I had a dream of downsizing from our house in Cape Elizabeth into a small condo closer to where we work and play in Portland. David and his skilled team helped make that dream a reality. The sale went smoothly, and we just closed on an ideal new place we're excited to call home...  ''',
                  //         style: TextStyle(
                  //           color: Color(0xFF7D7F88),
                  //           fontSize: 14,
                  //           letterSpacing: 2,
                  //         ),
                  //       ),
                  //       TextSpan(
                  //         text: 'Read more',
                  //         style: TextStyle(
                  //           color: Color(0xFF7AA721),
                  //           fontSize: 14,
                  //           letterSpacing: 2,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(height: 32),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     SizedBox(
                  //       height: 42,
                  //       width: 42,
                  //       child: CircleAvatar(
                  //         backgroundImage: AssetImage('assets/app/photo.jpeg'),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 10),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         SizedBox(
                  //           height: 16,
                  //           child: Text(
                  //             'Anita Cruz',
                  //             style: TextStyle(
                  //
                  //               fontSize: 16,
                  //               letterSpacing: 2,
                  //             ),
                  //             textHeightBehavior: TextHeightBehavior(
                  //               applyHeightToFirstAscent: false,
                  //             ),
                  //           ),
                  //         ),
                  //         const SizedBox(height: 10),
                  //         SizedBox(
                  //           height: 14,
                  //           child: Row(
                  //             children: [
                  //               Icon(
                  //                 Icons.star_rate_rounded,
                  //                 color: Color(0xFFFFBF75),
                  //                 size: 14,
                  //               ),
                  //               Icon(
                  //                 Icons.star_rate_rounded,
                  //                 color: Color(0xFFFFBF75),
                  //                 size: 14,
                  //               ),
                  //               Icon(
                  //                 Icons.star_rate_rounded,
                  //                 color: Color(0xFFFFBF75),
                  //                 size: 14,
                  //               ),
                  //               Icon(
                  //                 Icons.star_rate_rounded,
                  //                 color: Color(0xFFFFBF75),
                  //                 size: 14,
                  //               ),
                  //               Icon(
                  //                 Icons.star_rate_rounded,
                  //                 color: Color(0xFFFFBF75),
                  //                 size: 14,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 18),
                  // RichText(
                  //   text: TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text:
                  //             '''My wife & I have moved 6 times in the last 25 years. Obviously, we've dealt with many realtors both on the buying and selling side. I have to say that David is by far the BEST realtor we've ever worked with, his professionalism, personality, attention to detail, responsiveness and... ''',
                  //         style: TextStyle(
                  //           color: Color(0xFF7D7F88),
                  //           fontSize: 14,
                  //           letterSpacing: 2,
                  //         ),
                  //       ),
                  //       TextSpan(
                  //         text: 'Read more',
                  //         style: TextStyle(
                  //           color: Color(0xFF7AA721),
                  //           fontSize: 14,
                  //           letterSpacing: 2,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class HotelDetailScreenController extends GetxController {
  var carouselCurrentIndex = 0.obs;

  // Google Map box part
  RxList<Marker> markers = RxList<Marker>([]);
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  late Completer<GoogleMapController> mapController;
  TextEditingController bookingDateRange = TextEditingController();
  var noOfDays = 0.obs;
  var noOfGuests = 0.obs;
  var countAdults = 0.obs;
  var countChildren = 0.obs;
  var countInfants = 0.obs;
  RxList<Location> locations = RxList<Location>([]);

  @override
  void onInit() {
    mapController = Completer();
    super.onInit();
  }

  void incrementAdults() {
    countAdults++;
  }

  void decrementAdults() {
    if (countAdults > 0) {
      countAdults--;
    } else {
      countAdults == 0;
    }
  }

  void incrementChildren() {
    countChildren++;
  }

  void decrementChildren() {
    if (countChildren > 0) {
      countChildren--;
    } else {
      countChildren == 0;
    }
  }

  void incrementInfants() {
    countInfants++;
  }

  void decrementInfants() {
    if (countInfants > 0) {
      countInfants--;
    } else {
      countInfants == 0;
    }
  }

  void showMarker(String value) async {
    try {
      locations.value = await locationFromAddress(value).catchError((e) {
        GetSnackBar(
          title: 'Google Map',
          message: 'Error: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
      });
      latitude.value = locations[0].latitude;
      longitude.value = locations[0].longitude;
      markers.add(
        Marker(
          markerId: const MarkerId('Property Location'),
          position: LatLng(latitude.value, longitude.value),
          infoWindow: const InfoWindow(
            title: 'Property Location',
            snippet: 'property location will be displayed here.',
          ),
        ),
      );
    } catch (e) {
      GetSnackBar(
        title: 'Google Map',
        message: 'Error: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }
}

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    Key? key,
    required this.rent,
    required this.hotelController,
    this.propertydocId,
    this.propertyName,
    this.propertyLocation,
    this.propertyImage1,
    this.rating,
    this.ratingCount,
  }) : super(key: key);

  final String rent;
  final String? propertydocId;
  final String? propertyName;
  final String? propertyLocation;
  final String? propertyImage1;
  final String? rating;
  final String? ratingCount;
  HotelDetailScreenController hotelController;
  // LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 27.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            '₹${rent.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} ',
                        style: TextStyle(
                          fontSize: 18,

                          letterSpacing: 1.3,
                        ),
                      ),
                      TextSpan(
                        text: '/ Day',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF7D7F88),
                          letterSpacing: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    var baseAmount = (int.parse(rent) - 350).toInt();
                    var taxAmount = 350;
                    var finalAmount = baseAmount + taxAmount;
                    Get.defaultDialog(
                      title: 'Payment Estimation',
                      content: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Base Amount:'),
                                Text(
                                    '₹${baseAmount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}'),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Tax Amount:'),
                                Text(
                                    '₹${taxAmount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}'),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Total Amount:'),
                                Text(
                                    '₹${finalAmount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Payment estimation',
                    style: TextStyle(
                      fontSize: 14,

                      letterSpacing: 1.3,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                if (LoginController().isGuest.value) {
                  Get.defaultDialog(
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Please register with us to avail this feature.',
                          style: TextStyle(
                            fontSize: 16,

                            letterSpacing: 1.3,
                          ),
                          maxLines: 5,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 48,
                                width: 156,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: const LinearGradient(
                                    begin: Alignment(1.0, 1.0),
                                    end: Alignment(1.0, -1.0),
                                    colors: [
                                      Color(0xFFB5EB49),
                                      Color(0xFF7AA721),
                                    ],
                                  ),
                                ),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                LoginController().isGuest(false);
                                Get.to(
                                  RegisterView(),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 48,
                                width: 156,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: const LinearGradient(
                                    begin: Alignment(1.0, 1.0),
                                    end: Alignment(1.0, -1.0),
                                    colors: [
                                      Color(0xFFB5EB49),
                                      Color(0xFF7AA721),
                                    ],
                                  ),
                                ),
                                child: const Text(
                                  "Let's Register",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  Get.defaultDialog(
                    title: 'Let us know some details',
                    content: Column(
                      children: [
                        Text(
                          'How long do you want to stay?',
                          style: TextStyle(
                            fontSize: 18,

                            letterSpacing: 1.3,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: hotelController.bookingDateRange,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: '11 Nov - 12 Nov',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: borderColor,
                                width: 0.8,
                              ),
                              borderRadius: BorderRadius.circular(94),
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
                            prefixIcon:
                                const Icon(Icons.calendar_month_rounded),
                          ),
                          onTap: () async {
                            final DateFormat formater = DateFormat('d MMM');
                            FocusScope.of(context).requestFocus(FocusNode());

                            DateTimeRange? date = await showDateRangePicker(
                                context: context,
                                initialDateRange: DateTimeRange(
                                  start: DateTime.now(),
                                  end: DateTime.now().add(
                                    const Duration(days: 1),
                                  ),
                                ),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));

                            hotelController.bookingDateRange.text =
                                '${(formater.format(date!.start).toString())} - ${(formater.format(date.end).toString())}';
                            hotelController.noOfDays.value =
                                date.end.difference(date.start).inDays;
                          },
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'How many guests coming?',
                          style: TextStyle(
                            fontSize: 18,

                            letterSpacing: 1.3,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 23.5),
                        Column(
                          children: [
                            Obx(
                              () => buildCounterRow(
                                itemName: 'Adults',
                                countVal: hotelController.countAdults.value,
                                incrementFun: () =>
                                    hotelController.incrementAdults(),
                                decrementFun: () =>
                                    hotelController.decrementAdults(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Obx(
                              () => buildCounterRow(
                                itemName: 'Children',
                                countVal: hotelController.countChildren.value,
                                incrementFun: () =>
                                    hotelController.incrementChildren(),
                                decrementFun: () =>
                                    hotelController.decrementChildren(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Obx(
                              () => buildCounterRow(
                                itemName: 'Infants',
                                countVal: hotelController.countInfants.value,
                                incrementFun: () =>
                                    hotelController.incrementInfants(),
                                decrementFun: () =>
                                    hotelController.decrementInfants(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 48,
                                width: 156,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: const LinearGradient(
                                    begin: Alignment(1.0, 1.0),
                                    end: Alignment(1.0, -1.0),
                                    colors: [
                                      Color(0xFFB5EB49),
                                      Color(0xFF7AA721),
                                    ],
                                  ),
                                ),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                hotelController.noOfGuests.value =
                                    hotelController.countAdults.value +
                                        hotelController.countChildren.value +
                                        hotelController.countInfants.value;
                                Get.to(
                                  HotelBookingView(
                                    propertyImage1: propertyImage1,
                                    propertyLocation: propertyLocation,
                                    propertyName: propertyName,
                                    propertydocId: propertydocId,
                                    rentPrice: rent,
                                    noOfDays: hotelController.noOfDays.value,
                                    noOfGuests:
                                        hotelController.noOfGuests.value,
                                    rating: rating,
                                    ratingCount: ratingCount,
                                    bookingDateRange:
                                        hotelController.bookingDateRange.text,
                                  ),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 48,
                                width: 156,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: const LinearGradient(
                                    begin: Alignment(1.0, 1.0),
                                    end: Alignment(1.0, -1.0),
                                    colors: [
                                      Color(0xFFB5EB49),
                                      Color(0xFF7AA721),
                                    ],
                                  ),
                                ),
                                child: const Text(
                                  'Proceed',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 48,
                width: 156,
                child: Text(
                  'Book now',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    begin: Alignment(1.0, 1.0),
                    end: Alignment(1.0, -1.0),
                    colors: [
                      Color(0xFFB5EB49),
                      Color(0xFF7AA721),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildCounterRow(
      {required String itemName,
      required int countVal,
      required VoidCallback incrementFun,
      required var decrementFun}) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 13.5),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              itemName,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF7D7F88),
                letterSpacing: 2,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: decrementFun,
                  child: Container(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                        'assets/filter/ic_remove_circle_outline.png'),
                  ),
                ),
                Spacer(),
                Text(
                  '$countVal',
                  style: TextStyle(
                    fontSize: 18,

                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: incrementFun,
                  child: Container(
                    height: 35,
                    width: 35,
                    child:
                        Image.asset('assets/filter/ic_add_circle_outline.png'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
