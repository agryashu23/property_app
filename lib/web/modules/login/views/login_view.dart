import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/login/views/components/login_body.dart';
import '../controllers/login_controller.dart';
import 'components/login_body.dart';

class AdminLoginView extends GetView<AdminLoginController> {
  const AdminLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AdminLoginBody(),
          ],
        ),
      ),
    );
  }
}
