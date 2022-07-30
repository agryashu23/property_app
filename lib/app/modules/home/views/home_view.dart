import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/models/nav_item.dart';
import 'package:property_app/app/modules/home/views/components/property_detail.dart';
import 'package:property_app/app/modules/home/views/profile/profile_view.dart';
import 'package:property_app/app/modules/home/views/filter/filter_view.dart';
import 'package:property_app/app/modules/home/views/search/search_delegate.dart';
import 'package:property_app/app/modules/login/controllers/login_controller.dart';
import 'package:property_app/app/contants/app_colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: HomeBottomNavBar(),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeAppBar(),
        const SizedBox(height: 26),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            autofocus: false,
            style: TextStyle(color: Colors.black),

            onTap: () {
              showSearch(
                  context: context,
                  delegate: DataSearch(controller.properties));
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
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 32.5),
          child: Obx(
            () => RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Houses Near You\n',
                    style: TextStyle(
                      fontSize: 18,
                      color: Get.isDarkMode?Colors.white:Colors.black,

                    ),
                  ),
                  TextSpan(
                    text: 'Properties in ${controller.currentAddress.value}',
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
        SizedBox(height: 15,),
        propertyDetailListFirestore(),
      ],
    );
  }

  Widget propertyDetailListFirestore() {
    return GetX<HomeController>(
        init: Get.put<HomeController>(HomeController()),
        builder: (controller) {
          if (controller.filterProperties.isNotEmpty) {
            return Container(
              height: MediaQuery.of(context).size.height*0.54,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.properties.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          PropertyDetailScreen(
                            propertydocId:
                                controller.properties[index].propertydocId,
                            propertyName:
                                controller.properties[index].propertyName,
                            propertyLocation:
                                controller.properties[index].propertyLocation,
                            rooms: controller.properties[index].rooms,
                            area: controller.properties[index].area,
                            areaType: controller.properties[index].areaType,
                            rentPrice: controller.properties[index].rentPrice,
                            security: controller.properties[index].security,
                            maintenance: controller.properties[index].maintenance,
                            maintenanceType: controller.properties[index].maintenanceType,
                            rating: controller.properties[index].rating,
                            ratingCount:
                                controller.properties[index].ratingCount,
                            contactPerson:
                                controller.properties[index].contactPerson,
                            contactNumber:
                                controller.properties[index].contactNumber,
                            propertyFurnishing:
                                controller.properties[index].propertyFurnishing,
                            propertyAvailable:
                                controller.properties[index].propertyAvailable,
                            propertyFacing:
                                controller.properties[index].propertyFacing,
                            propertyBathrooms:
                                controller.properties[index].propertyBathrooms,
                            propertyBalcony:
                                controller.properties[index].propertyBalcony,
                            propertyImage1:
                                controller.properties[index].propertyImage1,
                            propertyImage2:
                                controller.properties[index].propertyImage2,
                            propertyImage3:
                                controller.properties[index].propertyImage3,
                            propertyImage4:
                                controller.properties[index].propertyImage4,
                            propertyImage5:
                                controller.properties[index].propertyImage5,
                            propertyImage6:
                                controller.properties[index].propertyImage6,
                            propertyImage7:
                                controller.properties[index].propertyImage7,
                            propertyImage8:
                                controller.properties[index].propertyImage8,
                            propertyVideo1:
                                controller.properties[index].propertyVideo1,
                            propertyHighlights:
                                controller.properties[index].propertyHighlights,
                          ),
                        );
                      },
                      child: Container(
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
                        height: 192,
                        width: 260,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            controller.properties[index].propertyImage1!
                                    .isNotEmpty
                                ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      '${controller.properties[index].propertyImage1}',
                                      fit: BoxFit.cover,
                                      height: 190,
                                      width: 128,
                                    ),
                                )
                                : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                      'assets/app/Image-1.png',
                                      fit: BoxFit.fill,
                                      height: 189,
                                      width: 128,
                                    ),
                                ),
                            const SizedBox(width: 16),
                            Container(
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
                                                  .properties[index].rating,
                                              style: TextStyle(
                                                color: textColorDark,
                                                fontSize: 12,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '(${controller.properties[index].ratingCount})',
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
                                          style: TextStyle(
                                            color: Color(0xFF7D7F88),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
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
                                        '${controller.properties[index].rooms} room',
                                        style: TextStyle(
                                          color: Color(0xFF7D7F88),
                                          fontSize: 13,
                                        ),
                                      ),
                                      const SizedBox(width: 13),
                                      Icon(
                                        Icons.aspect_ratio_rounded,
                                        size: 14,
                                        color: Color(0xFF7D7F88),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        '${controller.properties[index].area} ${controller.properties[index].areaType}',
                                        style: TextStyle(
                                          color: Color(0xFF7D7F88),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 18),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
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
                                              text: '/month',
                                              style: TextStyle(
                                                color: Color(0xFF7D7F88),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          controller.updateFavProperty(
                                              controller.properties[index]
                                                  .propertydocId!,
                                              !controller.properties[index]
                                                  .isFavorate!);
                                        },
                                        icon: controller
                                                .properties[index].isFavorate!
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
            return const Center(child: Text('No data filtered.'));
          }
        });
  }
}

class HomeAppBar extends StatefulWidget {
  HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
String image = '';
  // LoginController loginController = Get.put(LoginController());
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("Registered Users").doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
      setState((){
        image = value['user_profile_image'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 53,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFB5EB49),
              Color(0xFF7AA721),
            ],
          ),
        ),
        child: Row(
          children: [
            LoginController().isGuest.value
                ? Container()
                : InkWell(
                    onTap: () {
                      print(FirebaseAuth.instance.currentUser!.uid);
                      print("KOJISHJCIS");
                      Get.to(ProfileView());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.centerLeft,
                      child: image.isNotEmpty
                          ? CircleAvatar(
                          backgroundImage: NetworkImage(
                              image))
                          : const CircleAvatar(
                        backgroundImage:
                        AssetImage('assets/app/photo.jpeg'),
                      ),
                    ),
                  ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                'Home Rent',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            LoginController().isGuest.value
                ? Container()
                : IconButton(
                    onPressed: () {
                      Get.to(FilterView(value:Get.isDarkMode?"dark":"light"));
                    },
                    icon: const Icon(
                      Icons.filter_list,
                      size: 22,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class HomeBottomNavBar extends StatelessWidget {
  HomeBottomNavBar({
    Key? key,
  }) : super(key: key);

  NavItems _navItemsController = Get.put(NavItems());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 80,
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
              NavItems.items.length,
              (index) => buildNavBarItemIcon(
                isActive:
                    _navItemsController.selectedIndex == index ? true : false,
                icon: NavItems.items[index].icon,
                name: NavItems.items[index].name,
                press: () {
                  _navItemsController.changeNavIndex(index: index);
                  if (NavItems.items[index].destinationChecker()) {
                    Get.to(NavItems.items[index].destination!);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconButton buildNavBarItemIcon(
      {IconData? icon,
      String? name,
      VoidCallback? press,
      bool isActive = false}) {
    return IconButton(
      onPressed: press,
      icon: Container(
        alignment: Alignment.center,
        child: Wrap(
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
                fontSize: 10,
                color: isActive
                    ? const Color(0xFF7AA721)
                    : const Color(0xFF7D7F88),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
