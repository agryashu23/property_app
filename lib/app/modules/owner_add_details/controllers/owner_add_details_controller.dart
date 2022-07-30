import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OwnerAddDetailsController extends GetxController
    with StateMixin<List<dynamic>> {
  // Plot Area Size
  var dropDownValue = 'sq.ft.'.obs;
  // No. of floors in Building
  var noOfFloors = 0.obs;
  // No. of floors in Building
  var floorNo = 0.obs;
  // No. of floors in Building
  var availableFrom = ''.obs;

  TextEditingController dateCtl = TextEditingController();
  TextEditingController areaSize = TextEditingController();
  TextEditingController propertyVideo = TextEditingController();

  var furnishing = ''.obs;
  var selectedFurnishingIndex = 0.obs;
  var selectedAvailableIndex = 0.obs;
  var availableFor = ''.obs;
  var selectedFacingIndex = 0.obs;
  var facing = ''.obs;

  // For Counter
  var countBedrooms = 0.obs;
  var countBathrooms = 0.obs;
  var countBeds = 0.obs;

  void incrementBedrooms() {
    countBedrooms++;
  }

  void decrementBedrooms() {
    if (countBedrooms > 0) {
      countBedrooms--;
    } else {
      countBedrooms == 0;
    }
  }

  void incrementBathrooms() {
    countBathrooms++;
  }

  void decrementBathrooms() {
    if (countBathrooms > 0) {
      countBathrooms--;
    } else {
      countBathrooms == 0;
    }
  }

  void incrementBeds() {
    countBeds++;
  }

  void decrementBeds() {
    if (countBeds > 0) {
      countBeds--;
    } else {
      countBeds == 0;
    }
  }

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  var isProcessing = false.obs;
  var uploadedImageUrl =
      List<String>.generate(9, (index) => '', growable: true).obs;

// Get image from gellery
  Future getPropertyImage(
      ImageSource imageSource, String fileName, int index) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          "${((File(selectedImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)} Mb";
      uploadPrpertyImage(File(pickedFile.path), fileName, index);
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

// Get video from gellery
  Future getPropertyVideo(
      ImageSource imageSource, String fileName, int index) async {
    final pickedFile = await ImagePicker().pickVideo(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          "${((File(selectedImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)} Mb";

      uploadPrpertyImage(File(pickedFile.path), fileName, index);
    } else {
      Get.snackbar('Error', 'No video selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void showProcessing() {
    if (isProcessing.value) {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false,
      );
    }
  }

  // Upload image to firebase storage and get image url

  Future uploadPrpertyImage(File image, String fileName, int index) async {
    Reference reference =
        FirebaseStorage.instance.ref().child('${fileName}_${DateTime.now()}');
    UploadTask uploadTask = reference.putFile(image);
    try {
      isProcessing.value = true;
      TaskSnapshot snapshot = await uploadTask;
      uploadedImageUrl[index] = await snapshot.ref.getDownloadURL();
      print(uploadedImageUrl[index]);
      isProcessing.value = false;
    } catch (e) {
      isProcessing.value = false;
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isProcessing.value = false;
    }
  }
}
