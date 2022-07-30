import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_app/app/modules/home/views/home_view.dart';
import 'package:property_app/app/modules/owner_home/views/owner_home_view.dart';
import 'package:property_app/app/modules/register/controllers/register_controller.dart';
import 'package:property_app/app/contants/app_colors.dart';

class VerifyUserIdentity extends StatelessWidget {
  VerifyUserIdentity({Key? key}) : super(key: key);

  // final String phoneNo;

  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 68),
                    Text(
                      "Verify your identity",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: textColorDark,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aadhar Card no.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: textColorDark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        controller: controller.aadharController,
                        autofocus: false,
                        style: TextStyle(color: Colors.black),

                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF7AA721),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF7AA721),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          fillColor: const Color(0xFFF2F2F3),
                          filled: true,
                          suffixIconConstraints: BoxConstraints(
                            minHeight: 56,
                          ),
                          hintText: "Enter Aadhar card no.",
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Text(
                      'Upload Aadhar Card Photo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: textColorDark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        controller: controller.aadharFIController,
                        autofocus: false,
                        style: TextStyle(color: Colors.black),


                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF7AA721),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF7AA721),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          fillColor: const Color(0xFFF2F2F3),
                          filled: true,
                          suffixIconConstraints: BoxConstraints(
                            minHeight: 56,
                          ),
                          suffixIcon: InkWell(
                            onTap: () async {
                              await controller.getPropertyImage(
                                  ImageSource.gallery, 'AadharFrontImage', 0);
                              controller.aadharFIController.text =
                                  'Front Image Picked';
                              print(controller.uploadedImageUrl[0]);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 96,
                              decoration: BoxDecoration(
                                color: Color(0xFF292D32),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                ),
                              ),
                              child: Text(
                                'Upload',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          hintText: "Front Photo",
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Text(
                      'Upload Aadhar Card Photo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: textColorDark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        controller: controller.aadharBIController,
                        autofocus: false,
                        style: TextStyle(color: Colors.black),

                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF7AA721),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF7AA721),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          fillColor: const Color(0xFFF2F2F3),
                          filled: true,
                          suffixIconConstraints: BoxConstraints(
                            minHeight: 56,
                          ),
                          suffixIcon: InkWell(
                            onTap: () async {
                              await controller.getPropertyImage(
                                  ImageSource.gallery, 'AadharBackImage', 1);
                              controller.aadharBIController.text =
                                  'Back Image Picked';
                              print(controller.uploadedImageUrl[1]);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 96,
                              decoration: BoxDecoration(
                                color: Color(0xFF292D32),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                ),
                              ),
                              child: Text(
                                'Upload',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          hintText: "Back Photo",
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    TextButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'User Verification',
                          middleText:
                              'Do you really want to skip the verification',
                          textCancel: "Let's Verify",
                          textConfirm: 'Verify Later',
                          onConfirm: () {
                            controller.isVerficationSkipped.value = true;
                            saveUnverifiedUser(
                              controller.userId.value,
                              controller.userType.value,
                              !controller.isVerficationSkipped.value,
                              controller.nameController.text,
                              controller.emailController.text,
                              controller.phoneNoController.text,
                            );
                          },
                        );
                      },
                      child: Text(
                        'Skip Verification',
                        style: TextStyle(
                          fontSize: 14,
                          color: textColorDark,
                          letterSpacing: 1.3,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    InkWell(
                      onTap: () {
                        if (controller.aadharFIController.text.isNotEmpty &&
                            controller.uploadedImageUrl.isNotEmpty &&
                            controller.aadharBIController.text.isNotEmpty) {
                          saveUser(
                            controller.userId.value,
                            controller.userType.value,
                            !controller.isVerficationSkipped.value,
                            controller.nameController.text,
                            controller.emailController.text,
                            controller.phoneNoController.text,
                            controller.aadharController.text,
                            controller.uploadedImageUrl[0],
                            controller.uploadedImageUrl[1],
                          );
                        } else {
                          controller.showSnackBar(
                              'User Verification',
                              'All details should be filled to continue.',
                              Colors.red);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Create account',
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
            ],
          ),
        ),
      ),
    );
  }

  void saveUnverifiedUser(
    String? userId,
    String? userType,
    bool? isVerificationSkipped,
    String? userName,
    String? userEmail,
    String? phoneNo,
  ) {
    controller.saveUserData(
      document: controller.userId.value,
      data: {
        'user_id': userId,
        'user_type': userType,
        'user_verified': isVerificationSkipped,
        'user_name': userName,
        'user_email': userEmail,
        'phone_no': phoneNo,
        'aadhar_no': '',
        'aadhar_front_image': '',
        'aadhar_back_image': '',
        'user_profile_image':'',
      },
    );
    if (controller.userType.value == 'User') {
      Get.offAll(const HomeView());
    } else {
      Get.offAll(OwnerHomeView());
    }
  }

  void saveUser(
    String? userId,
    String? userType,
    bool? isVerificationSkipped,
    String? userName,
    String? userEmail,
    String? phoneNo,
    String? aadharNo,
    String? aadharFront,
    String? aadharBack,
  ) {
    controller.saveUserData(
      document: controller.userId.value,
      data: {
        'user_id': userId,
        'user_type': userType,
        'user_verified': isVerificationSkipped,
        'user_name': userName,
        'user_email': userEmail,
        'phone_no': phoneNo,
        'aadhar_no': aadharNo,
        'aadhar_front_image': aadharFront,
        'aadhar_back_image': aadharBack,
        'user_profile_image':'',
      },
    );
    if (controller.userType.value == 'User') {
      Get.offAll(const HomeView());
    } else {
      Get.offAll(OwnerHomeView());
    }
  }
}
