import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ColorController colorController = Get.put(ColorController());

var bgColorLight = Color(0XFFFCFCFC);
var textColorDark = Color(0xFF1A1E25);
const borderColor = Color(0xFFE3E3E7);

class ColorController extends GetxController {
  static ColorController colorController = Get.find();
  var bgColorLight = Color(0XFFFCFCFC).obs;
  var textColorDark = Color(0xFF1A1E25).obs;

  @override
  void onInit() {
    super.onInit();
    bgColorLight.listen((color) {
      if (Get.isDarkMode) {
        bgColorLight.value = Color(0XFF353535);
      } else {
        bgColorLight.value = Color(0XFFFCFCFC);
      }
    });
    textColorDark.listen((color) {
      if (Get.isDarkMode) {
        textColorDark.value = Color(0XFFE1E1E1);
      } else {
        textColorDark.value = Color(0xFF1A1E25);
      }
    });
  }

  // void changeColor() {
  //   if (Get.isDarkMode) {
  //     bgColorLight.value = Color(0XFF353535);
  //     textColorDark.value = Color(0XFFE1E1E1);
  //   } else {
  //     bgColorLight.value = Color(0XFFFCFCFC);
  //     textColorDark.value = Color(0xFF1A1E25);
  //   }
  //   // bgColorLight.value = Get.isDarkMode ? Color(0XFF353535) : Color(0XFFFCFCFC);
  //   // textColorDark.value =
  //   //     Get.isDarkMode ? Color(0XFFE1E1E1) : Color(0xFF1A1E25);
  // }
}
