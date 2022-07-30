import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/contants/app_colors.dart';

class AddPropertyAppBar extends StatelessWidget {
  const AddPropertyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: textColorDark,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'House Rent',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF000000),
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
