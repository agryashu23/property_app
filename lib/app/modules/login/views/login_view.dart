import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/login/views/components/login_body.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            LoginBody(),
          ],
        ),
      ),
    );
  }
}
