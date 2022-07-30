import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/contants/app_colors.dart';

class FilterAppBar extends StatelessWidget {
  const FilterAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 53,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.0, 1.0),
            end: Alignment(1.0, 1.0),
            colors: [
              Color(0xFFB5EB49),
              Color(0xFF7AA721),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.only(left: 16, top: 6, bottom: 5),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: textColorDark,
                  size: 18,
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 135, vertical: 10),
              child: Text(
                'Filter',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
