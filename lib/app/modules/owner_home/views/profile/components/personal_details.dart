import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/contants/app_colors.dart';
import 'package:property_app/app/modules/owner_home/controllers/owner_home_controller.dart';

class OwnerPersonalDetails extends StatelessWidget {
  OwnerPersonalDetails({Key? key}) : super(key: key);

  OwnerHomeController controller = Get.put(OwnerHomeController());

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
          'Personal Details',
          style: TextStyle(
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
                  child: controller.userData[0].profileImage!.isNotEmpty
                      ? CircleAvatar(
                      minRadius: 150,
                      maxRadius: 150,
                      backgroundImage: NetworkImage(
                          '${controller.userData[0].profileImage}'))
                      : const CircleAvatar(
                    minRadius: 150,
                    maxRadius: 150,
                    backgroundImage:
                    AssetImage('assets/app/photo.jpeg'),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'User Name:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                buildUserInfo(controller.userData[0].userName!),
                SizedBox(height: 20),
                Text(
                  'User Contact No:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                buildUserInfo(controller.userData[0].phoneNo!),
                SizedBox(height: 20),
                Text(
                  'User Email:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                buildUserInfo(controller.userData[0].userEmail!),
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
        letterSpacing: 1.3,
      ),
    );
  }
}
