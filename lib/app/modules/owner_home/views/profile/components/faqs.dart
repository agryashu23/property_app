import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/contants/app_colors.dart';

class OwnerFaqs extends StatelessWidget {
  const OwnerFaqs({Key? key}) : super(key: key);

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
          'FAQs',
          style: TextStyle(
            fontSize: 25,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: Text('FaQs'),
            ),
          ]),
        ),
      ),
    );
  }
}
