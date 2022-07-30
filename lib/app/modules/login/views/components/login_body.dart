import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/home/views/home_view.dart';
import 'package:property_app/app/modules/login/controllers/login_controller.dart';
import 'package:property_app/app/modules/register/views/register_view.dart';
import 'package:property_app/app/contants/app_colors.dart';

class LoginBody extends StatelessWidget {
  LoginBody({
    Key? key,
  }) : super(key: key);

  LoginController controller = Get.put(LoginController());

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
                  SizedBox(height: 68),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColorDark,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Log In to your Home rent account to explore your\n dream place to live across the whole world!',
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
                      // onSubmitted: (value) async {
                      //   await controller.verifyPhone(
                      //       '+91${controller.phoneNoController.text.trim()}');
                      // },
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
                      await controller.signInUser(
                          controller.smsOtpController.text.trim(),
                          controller.verificationId.value);
                      // await controller.loginUser(
                      //   phone: controller.phoneNoController.text,
                      //   pass: controller.passwordController.text,
                      // );
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
                  // const SizedBox(height: 12),
                  // Container(
                  //   alignment: Alignment.center,
                  //   margin: EdgeInsets.zero,
                  //   padding: EdgeInsets.zero,
                  //   child: TextButton(
                  //     onPressed: () {
                  //       // Get.showSnackbar(
                  //       //   GetSnackBar(
                  //       //     title: 'Implemented',
                  //       //   ),
                  //       // );
                  //       Get.defaultDialog(
                  //         content: Column(
                  //           children: [
                  //             Text(
                  //               'Let us know your phone no to fetch your password',
                  //               style: TextStyle(
                  //                 fontSize: 18,
                  //                 color: textColorDark,
                  //                 letterSpacing: 1.3,
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //             const SizedBox(height: 20),
                  //             TextField(
                  //               style: const TextStyle(
                  //                 color: Colors.black,
                  //               ),
                  //               keyboardType: TextInputType.number,
                  //               controller: controller.forgetPasswordController,
                  //               autofocus: false,
                  //               decoration: InputDecoration(
                  //                 hintText: 'Enter your phone no',
                  //                 enabledBorder: OutlineInputBorder(
                  //                   borderSide: const BorderSide(
                  //                     color: borderColor,
                  //                     width: 0.8,
                  //                   ),
                  //                   borderRadius: BorderRadius.circular(94),
                  //                 ),
                  //                 focusedBorder: OutlineInputBorder(
                  //                   borderSide: const BorderSide(
                  //                     color: borderColor,
                  //                     width: 1,
                  //                   ),
                  //                   borderRadius: BorderRadius.circular(25.0),
                  //                 ),
                  //                 fillColor: const Color(0xFFF2F2F3),
                  //                 filled: true,
                  //                 prefixIcon: const Icon(Icons.numbers),
                  //               ),
                  //             ),
                  //             const SizedBox(height: 20),
                  //             Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 InkWell(
                  //                   onTap: () {
                  //                     Get.back();
                  //                   },
                  //                   child: Container(
                  //                     alignment: Alignment.center,
                  //                     height: 48,
                  //                     width: 156,
                  //                     decoration: BoxDecoration(
                  //                       borderRadius: BorderRadius.circular(25),
                  //                       gradient: const LinearGradient(
                  //                         begin: Alignment(1.0, 1.0),
                  //                         end: Alignment(1.0, -1.0),
                  //                         colors: [
                  //                           Color(0xFFB5EB49),
                  //                           Color(0xFF7AA721),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                     child: const Text(
                  //                       'Cancel',
                  //                       style: TextStyle(
                  //                         fontSize: 16,
                  //                         color: Colors.white,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 InkWell(
                  //                   onTap: () async {
                  //                     await controller.getUserDetail(controller
                  //                         .forgetPasswordController.text);
                  //                     if (controller.userData.isNotEmpty) {
                  //                       await controller.sendForgetPasswordSMS(
                  //                         "Home Rent\nHey! your password is ${controller.userData[0].userPass}\nPlease login now.",
                  //                         [
                  //                           controller
                  //                               .forgetPasswordController.text
                  //                         ],
                  //                       );
                  //                     }
                  //                   },
                  //                   child: Obx(
                  //                     () => Container(
                  //                       alignment: Alignment.center,
                  //                       height: 48,
                  //                       width: 156,
                  //                       decoration: BoxDecoration(
                  //                         borderRadius:
                  //                             BorderRadius.circular(25),
                  //                         gradient: const LinearGradient(
                  //                           begin: Alignment(1.0, 1.0),
                  //                           end: Alignment(1.0, -1.0),
                  //                           colors: [
                  //                             Color(0xFFB5EB49),
                  //                             Color(0xFF7AA721),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                       child: controller.isLoading.value
                  //                           ? CircularProgressIndicator()
                  //                           : const Text(
                  //                               'Get Password',
                  //                               style: TextStyle(
                  //                                 fontSize: 16,
                  //                                 color: Colors.white,
                  //                               ),
                  //                             ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       );
                  //     },
                  //     child: Text(
                  //       'Forgot password?',
                  //       style: TextStyle(
                  //         fontSize: 14,
                  //         color: Color(0xFF7D7F88),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 43),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color(0xFF5F8513),
                          height: 36,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          "OR",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF456309),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color(0xFF5F8513),
                          height: 36,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  InkWell(
                    onTap: () {
                      Get.to(RegisterView());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFFE2E8F0),
                        ),
                      ),
                      child: Container(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Color(0xFF475569),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Welcome to Home Rent',
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'You are entering as a guest. So some featured might not visible to you. To use all the features please register with us.',
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
                                    controller.isGuest(true);
                                    Get.to(
                                      HomeView(),
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
                                      'Proceed as Guest',
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
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFFE2E8F0),
                        ),
                      ),
                      child: Container(
                        child: Text(
                          'Enter as Guest',
                          style: TextStyle(
                            color: Color(0xFF475569),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
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
    );
  }
}
