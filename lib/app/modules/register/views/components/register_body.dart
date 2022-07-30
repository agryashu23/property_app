import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/login/views/login_view.dart';
import 'package:property_app/app/modules/register/controllers/register_controller.dart';
import 'package:property_app/app/contants/app_colors.dart';
import 'package:property_app/web/modules/login/views/login_view.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({
    Key? key,
  }) : super(key: key);

  RegisterController controller = Get.put(RegisterController());

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
                    "Let's eplore together!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColorDark,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Create your Home rent account to explore your \ndream place to live across the whole world!',
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
                    'Name',
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
                      controller: controller.nameController,
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
                        hintText: "Enter your name",
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Username',
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
                      controller: controller.emailController,
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
                        hintText: "Enter your email",
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 18),
                  // Text(
                  //   'Password',
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w400,
                  //     color: textColorDark,
                  //   ),
                  // ),
                  // const SizedBox(height: 8),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 4),
                  //   child: TextField(
                  //     obscureText: true,
                  //     controller: controller.passwordController,
                  //     autofocus: false,
                  //     decoration: InputDecoration(
                  //       enabledBorder: OutlineInputBorder(
                  //         borderSide: const BorderSide(
                  //           color: Color(0xFF7AA721),
                  //           width: 1,
                  //         ),
                  //         borderRadius: BorderRadius.circular(25.0),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: const BorderSide(
                  //           color: Color(0xFF7AA721),
                  //           width: 1,
                  //         ),
                  //         borderRadius: BorderRadius.circular(25.0),
                  //       ),
                  //       fillColor: const Color(0xFFF2F2F3),
                  //       filled: true,
                  //       prefixIcon: Image.asset('assets/bold/Vector.png'),
                  //       hintText: "Enter your password",
                  //       hintStyle: const TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w400,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 18),
                  Text(
                    'Phone number',
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
                        suffixIconConstraints: BoxConstraints(
                          minHeight: 56,
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
                        prefixIcon: const Icon(Icons.call),
                        hintText: "Enter your phone no.",
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
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
                      controller: controller.smsCodeController,
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
                        hintText: "Enter OTP",
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
                      if(controller.phoneNoController.text.isEmpty){
                        showSnackBar('User Authentication', 'Please Enter Mobile Number',
                            Colors.red);
                      }
                      else if(controller.smsCodeController.text.isEmpty){
                        showSnackBar('User Authentication', 'Please Enter OTP',
                            Colors.red);
                      }
                      else{
                        await controller.signInUser(
                            controller.smsCodeController.text.trim(),
                            controller.verificationId.value);
                      }

                    },
                    child: Obx(
                      () => Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator()
                            : Text(
                                'Next',
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
                  // InkWell(
                  //   onTap: () {
                  //     Get.showSnackbar(
                  //       GetSnackBar(
                  //         title: 'Sign in with google',
                  //         message: 'In progress',
                  //       ),
                  //     );
                  //   },
                  //   child: Container(
                  //     height: 50,
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(25),
                  //       border: Border.all(
                  //         width: 1,
                  //         color: const Color(0xFFE2E8F0),
                  //       ),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 16),
                  //           child: Image.asset('assets/bold/Icon.png'),
                  //         ),
                  //         Container(
                  //           padding: const EdgeInsets.symmetric(
                  //             vertical: 13,
                  //             horizontal: 97,
                  //           ),
                  //           child: Text(
                  //             'Sign in with Google',
                  //             style: TextStyle(
                  //               color: Color(0xFF475569),
                  //               fontSize: 16,
                  //               fontWeight: FontWeight.w500,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 7),
                  InkWell(
                    onTap: () {
                      kIsWeb?Get.to(AdminLoginView()):
                      Get.to(LoginView());
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFFE2E8F0),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 13,
                          horizontal: 150,
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xFF475569),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
showSnackBar(String title, String message, Color backgroundColor) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: Colors.white);
}

ElevatedButton verifyButton() {
  return ElevatedButton(
    onPressed: () {},
    style: ButtonStyle(),
    child: Text('Verify'),
  );
}
