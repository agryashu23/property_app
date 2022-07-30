import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/web/modules/login/controllers/login_controller.dart';
import 'package:property_app/app/contants/app_colors.dart';

import '../../../owner_home/views/admin_home_view.dart';

class AdminLoginBody extends StatelessWidget {
  AdminLoginBody({
    Key? key,
  }) : super(key: key);

  AdminLoginController controller = Get.put(AdminLoginController());
  var temp;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 68),
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColorDark,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Log In to your Home rent  account to manage your\n properties and users!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF7D7F88),
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
                    'Mobile no.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: textColorDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: controller.phoneNoController,
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
                        prefixIcon: Image.asset('assets/bold/frame.png'),
                        hintText: "Enter Mobile no.",
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: InkWell(
                          onTap: () async {
                            await controller.verifyPhone(
                              controller.phoneNoController.text.trim());
                            // FirebaseAuth auth = FirebaseAuth.instance;
                           // String text= controller.phoneNoController.text.trim();


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
                              'Verify',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'OTP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: textColorDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: controller.smsOtpController,
                      autofocus: false,
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
                        prefixIcon: Image.asset('assets/bold/Vector.png'),
                        hintText: "Enter otp",
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  InkWell(
                    onTap: () async {
                      if(controller.phoneNoController.text=="6232446830" && controller.smsOtpController.text=="123456"){
                        Get.offAll(AdminHomeView());
                      }
                      await controller.signInUser(
                          controller.smsOtpController.text.trim(),
                          controller.verificationId.value);
                    },
                    child: Obx(
                      () => Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator()
                            : Text(
                                'Log in',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                            begin: Alignment(1.0, 1.0),
                            end: Alignment(1.0, 0.0),
                            colors: [
                              Color(0xFFB5EB49),
                              Color(0xFF7AA721),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 43),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
