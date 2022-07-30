import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:property_app/app/modules/home/controllers/property_detail_controller.dart';
import 'package:property_app/app/modules/login/controllers/login_controller.dart';
import 'package:property_app/app/modules/register/views/register_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:property_app/app/contants/app_colors.dart';
import 'package:http/http.dart' as http;

class PropertyDetailScreen extends StatelessWidget {
  PropertyDetailScreen({
    Key? key,
    this.propertydocId,
    this.propertyName,
    this.propertyLocation,
    this.rooms,
    this.area,
    this.areaType,
    this.rentPrice,
    this.security,
    this.maintenance,
    this.maintenanceType,
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

  PropertyDetailController controller = Get.put(PropertyDetailController());
  final String? propertydocId;
  final String? propertyName;
  final String? propertyLocation;
  final int? rooms;
  final String? area;
  final String? areaType;
  final String? rentPrice;
  final String? security;
  final String? maintenance;
  final String? maintenanceType;
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

  void _callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  void _shareContent(String subject, String content) async {
    Share.share(content, subject: subject);
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
        security: security ?? '0',
        maintenance: maintenance ?? '0',
        maintenanceType: maintenanceType!,
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
                      decoration: BoxDecoration(
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
                              'Hey! look out this Home once\nHome Name & Address: $propertyName, $propertyLocation',
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
                  Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6FFE4),
                      border: Border.all(
                        color: Color(0xFF7AA721),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.videocam_rounded,
                          color: Color(0xFF7AA721),
                        ),
                        const SizedBox(width: 13),
                        Text(
                          'Watch 360°',
                          style: TextStyle(
                            color: Color(0xFF7AA721),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
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
                            size: 19,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            propertyLocation!,
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
                            _callNumber(contactNumber!);
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
                    'Home facilites',
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                  ),
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
                            propertyFurnishing!,
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
                            propertyAvailable!,
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
                    propertyHighlights!.isNotEmpty
                        ? propertyHighlights!
                        : '''This cabin comes with Smart Home System and beautiful viking style. You can see sunrise in the morning with City View from full Glass Window. This unit is surrounded by business district of West Surabaya that offers you the city life as well as wide range of culinary. This apartment equipped with Washing Machine, Electric Stove, Microwave, Refrigerator, Cutlery.''',
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1.3,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Text(
                  //   'Testimonials',
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     color: textColorDark,
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
                  //               color: textColorDark,
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
                  //               color: textColorDark,
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

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    Key? key,
    required this.rent,
    required this.security,
    required this.maintenance,
    required this.maintenanceType,
  }) : super(key: key);

  final String rent;
  final String security;
  final String maintenance;
  final String maintenanceType;
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
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            '₹${rent.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} ',
                        style: TextStyle(
                          fontSize: 18,
                          color: textColorDark,
                          letterSpacing: 1.3,
                        ),
                      ),
                      TextSpan(
                        text: '/ month',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF7D7F88),
                          letterSpacing: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    var baseAmount = (int.parse(rent)).toInt();
                    var securityAmount = (int.parse(security)).toInt();
                    var maintenanceAmount = (int.parse(maintenance)).toInt();
                    var finalAmount =
                        baseAmount + securityAmount + maintenanceAmount;
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
                                const Text('Base Amount:',style: TextStyle(color: Colors.black),),
                                Text(
                                  '₹${baseAmount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Security Amount:',style: TextStyle(color: Colors.black),),
                                Text(
                                  '₹${securityAmount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Maintenance Amount($maintenanceType):',style: TextStyle(color: Colors.black),),
                                Text(
                                  '₹${maintenanceAmount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Total Amount:',style: TextStyle(color: Colors.black),),
                                Text(
                                  '₹${finalAmount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                                  style: TextStyle(color: Colors.black),
                                ),
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
                      color: textColorDark,
                      letterSpacing: 1.3,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () async {
                if (LoginController().isGuest.value) {
                  Get.defaultDialog(
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Please register with us to avail this feature.',
                          style: TextStyle(
                            fontSize: 16,
                            color: textColorDark,
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
                  await launchUrl(Uri.parse(
                      "whatsapp://send?phone=+917983448199&text=Hey! I'm inquiring about the property"));
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 48,
                width: 156,
                child: const Text(
                  'Inquiry',
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
}
