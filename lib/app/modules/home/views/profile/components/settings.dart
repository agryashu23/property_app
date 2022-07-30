import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/contants/app_colors.dart';
import 'package:property_app/app/modules/home/controllers/home_controller.dart';
import 'package:property_app/app/modules/home/views/profile/components/change_personal_details.dart';
import 'package:share_plus/share_plus.dart';

class Settings2 extends StatelessWidget {
  Settings2({Key? key}) : super(key: key);

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 25,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // Get.showSnackbar(
                  //   GetSnackBar(
                  //     title: 'Change Personal Details',
                  //     message: 'In progress',
                  //   ),
                  // );
                  controller.changeName.text = controller.userData[0].userName!;
                  controller.changeEmail.text = controller.userData[0].userEmail!;
                  // controller.changeEmail.text = controller.userData[0].userEmail!;
                  Get.to(ChangePersonalDetails());
                },
                child: settingsMenuItem(
                  itemName: 'Change Personal Details',
                  itemIcon: Icons.person,
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if (Get.isDarkMode) {
                    controller.currentTheme.value = 'Dark';
                    Get.changeThemeMode(ThemeMode.light);
                  } else {
                    controller.currentTheme.value = 'Light';
                    Get.changeThemeMode(ThemeMode.dark);
                  }
                },
                child: Obx(
                  () => settingsMenuItem(
                    itemName: 'Change Theme ${controller.currentTheme.value}',
                    itemIcon: Icons.color_lens_rounded,
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  shareContent('Home Rent',
                      'https://play.google.com/store/apps/details?id=xyz.markapp.renthouse');
                },
                child: settingsMenuItem(
                  itemName: 'Share App',
                  itemIcon: Icons.share_rounded,
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: settingsMenuItem(
                  itemName: 'Back To Profile',
                  itemIcon: Icons.arrow_circle_left_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void shareContent(String subject, String content) async {
    Share.share(content, subject: subject);
  }

  Container settingsMenuItem(
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
            ),
          ),
        ],
      ),
    );
  }
}
