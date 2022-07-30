import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/web/modules/login/views/login_view.dart';
import 'package:property_app/web/modules/owner_home/controllers/admin_home_controller.dart';
import 'package:property_app/web/modules/owner_home/views/admin_home_view.dart';
import 'package:property_app/web/modules/profile/components/faqs.dart';
import 'package:property_app/web/modules/profile/components/personal_details.dart';
import 'package:property_app/web/modules/profile/components/settings.dart';
import 'package:property_app/app/contants/app_colors.dart';

class AdminProfileView extends StatelessWidget {
  AdminProfileView({super.key});

  AdminHomeController controller = Get.put(AdminHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 84),
            Container(
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    child: controller.userData[0].profileImage!.isNotEmpty
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(
                                '${controller.userData[0].profileImage}'))
                        : const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/app/photo.jpeg'),
                          ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    controller.userData[0].userName!,
                    style: TextStyle(
                      fontSize: 24,
                      color: textColorDark,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    controller.userData[0].userEmail!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF7D7F88),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(
                      thickness: 0.6,
                      color: Color(0xFFD6D6D6),
                    ),
                  ),
                  const SizedBox(height: 25),
                  InkWell(
                    onTap: () {
                      Get.to(OwnerPersonalDetails2());
                    },
                    child: profileMenuItem(
                        itemName: 'Personal details', itemIcon: Icons.person),
                  ),
                  const SizedBox(height: 24),
                  InkWell(
                    onTap: () {
                      Get.to(OwnerSettings());
                    },
                    child: profileMenuItem(
                        itemName: 'Settings', itemIcon: Icons.settings),
                  ),
                  const SizedBox(height: 24),
                  InkWell(
                    onTap: () {
                      Get.to(OwnerFaqs());
                    },
                    child: profileMenuItem(
                        itemName: 'FAQ', itemIcon: Icons.chat_bubble_outlined),
                  ),
                  const SizedBox(height: 28),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(
                      thickness: 0.6,
                      color: Color(0xFFD6D6D6),
                    ),
                  ),
                  const SizedBox(height: 28),
                  InkWell(
                      onTap: () async{
                        await controller.signOut();
                        Get.offAll(const AdminLoginView());
                      },
                      child: profileMenuItem(
                          itemName: 'Log Out', itemIcon: Icons.logout)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container profileMenuItem(
      {required String itemName, required IconData itemIcon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 50,
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                  color: borderColor,
                  width: 0.5,
                  style: BorderStyle.solid), //Border.all

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400]!,
                  offset: const Offset(
                    0.0,
                    0.5,
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
            child: Icon(
              itemIcon,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            itemName,
            style: TextStyle(
              fontSize: 16,
              color: textColorDark,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color(0xFF7D7F88),
            size: 18,
          ),
        ],
      ),
    );
  }
}
