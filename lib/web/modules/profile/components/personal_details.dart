import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/contants/app_colors.dart';
import 'package:property_app/app/modules/owner_home/controllers/owner_home_controller.dart';

import '../../owner_home/controllers/admin_home_controller.dart';

class OwnerPersonalDetails2 extends StatelessWidget {
  OwnerPersonalDetails2({Key? key}) : super(key: key);

  AdminHomeController controller = Get.put(AdminHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: bgColorLight,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: textColorDark,
          ),
        ),
        title: Text(
          'Personal Details',
          style: TextStyle(
            color: textColorDark,
            fontSize: 25,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: controller.userDetail[0].profileImage==""?CircleAvatar(
                    minRadius: 150,
                    maxRadius: 150,
                    backgroundImage: AssetImage('assets/app/photo.jpeg'),
                  ):CircleAvatar(
                    minRadius: 150,
                    maxRadius: 150,
                    backgroundImage: NetworkImage(controller.userDetail[0].profileImage!),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'User Name:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: textColorDark,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                buildUserInfo(controller.userDetail[0].userName!),
                SizedBox(height: 20),
                Text(
                  'User Contact No:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: textColorDark,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                buildUserInfo(controller.userDetail[0].phoneNo!),
                SizedBox(height: 20),
                Text(
                  'User Email:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: textColorDark,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                buildUserInfo(controller.userDetail[0].userEmail!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUserInfo(String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 18,
        color: textColorDark,
        letterSpacing: 1.3,
      ),
    );
  }
}
