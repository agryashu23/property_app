import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_app/app/contants/app_colors.dart';
import 'package:property_app/app/modules/owner_home/controllers/owner_home_controller.dart';

import '../../owner_home/controllers/admin_home_controller.dart';

class OwnerChangePersonalDetails2 extends StatelessWidget {
  OwnerChangePersonalDetails2({Key? key}) : super(key: key);

  AdminHomeController controller = Get.put(AdminHomeController());

  @override
  Widget build(BuildContext context) {
    print(controller.userData);
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
          'Change Personal Details',
          style: TextStyle(
            color: textColorDark,
            fontSize: 25,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  await controller.getProfileImage(ImageSource.gallery,
                      'profile_${controller.userDetail[0].userId}');
                },
                child: Stack(
                  children: [
                    Obx(
                      () => Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: controller.userDetail[0].profileImage!.isEmpty
                            ? CircleAvatar(
                                minRadius: 150,
                                maxRadius: 150,
                                backgroundImage:
                                    AssetImage('assets/app/photo.jpeg'),
                              )
                            : CircleAvatar(
                                minRadius: 150,
                                maxRadius: 150,
                                backgroundImage: NetworkImage(
                                    controller.userDetail[0].profileImage!),
                              ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: MediaQuery.of(context).size.width / 2 - 170,
                      child: Text('Click to update Image'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              personalDetailInputField(
                text: 'Name',
                initText: controller.userDetail[0].userName!,
                tController: controller.changeName,
              ),
              personalDetailInputField(
                text: 'Email',
                initText: controller.userDetail[0].userEmail!,
                tController: controller.changeEmail,
              ),
              personalDetailInputField(
                text: 'Phone',
                initText: controller.userDetail[0].phoneNo!,
                tController: controller.changePhone,
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () async{
                  await controller.updateUserPersonalDetails(
                    name: controller.changeName.text,
                    email: controller.changeEmail.text,
                    image: controller.uploadedImageUrl.value,
                    phone: controller.changePhone.text,
                  );
                  Get.back();
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(27, 16, 28, 44),
                  alignment: Alignment.center,
                  height: 48,
                  child: Text(
                    'Update Personal Details',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
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
      ),
    );
  }

  Column personalDetailInputField({
    required String text,
    required String initText,
    required TextEditingController tController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 26),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF393E48),
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          child: TextField(
            controller: tController,
            autofocus: false,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFF7AA721),
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFEB5757),
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFF7AA721),
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              fillColor: const Color(0xFFF2F2F3),
              focusColor: const Color(0xFFF2F2F3),
              filled: true,
            ),
          ),
        ),
      ],
    );
  }
}
