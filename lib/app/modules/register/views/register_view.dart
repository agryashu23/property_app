import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/register/views/components/register_body.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RegisterBody(),
      ),
    );
  }
}
