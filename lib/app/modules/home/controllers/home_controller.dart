import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_app/app/contants/app_constants.dart';
import 'package:property_app/app/models/user_model.dart';
import 'package:property_app/app/modules/home/model/home_model.dart';
import 'package:property_app/app/modules/home/views/profile/components/change_personal_details.dart';

class HomeController extends GetxController {
  late CollectionReference collectionReference;
  RxList<UserHomeModel> properties = RxList<UserHomeModel>([]);
  RxList<UserHomeModel> filterProperties = RxList<UserHomeModel>([]);
  var currentTheme = 'Light'.obs;

  // Filters
  // For Range Slider
  var startValue = 1000.0.obs;
  var endValue = 100000.0.obs;

  // For Counter
  var countBedrooms = 0.obs;
  var countBathrooms = 0.obs;
  var countBeds = 0.obs;
  var countAdults = 0.obs;
  var countChildren = 0.obs;
  var countInfants = 0.obs;

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

  void incrementAdults() {
    countAdults++;
  }

  void decrementAdults() {
    if (countAdults > 0) {
      countAdults--;
    } else {
      countAdults == 0;
    }
  }

  void incrementChildren() {
    countChildren++;
  }

  void decrementChildren() {
    if (countChildren > 0) {
      countChildren--;
    } else {
      countChildren == 0;
    }
  }

  void incrementInfants() {
    countInfants++;
  }

  void decrementInfants() {
    if (countInfants > 0) {
      countInfants--;
    } else {
      countInfants == 0;
    }
  }

  TextEditingController dateRange = TextEditingController();
  var selectedFacilityIndex = 0.obs;
  var facilities = List<String>.generate(4, (index) => '', growable: true).obs;

  Position? currentPosition;
  var currentAddress = ''.obs;

  RxList<UserModel> userData = RxList<UserModel>([]);
  RxList<UserModel> userPaymentData = RxList<UserModel>([]);
  TextEditingController changeName = TextEditingController();
  TextEditingController changeEmail = TextEditingController();
  TextEditingController changePhone = TextEditingController();

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  var isProcessing = false.obs;
  var uploadedImageUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection('Owner New Property');
    properties.bindStream(getPropertyData());
    filterProperties = properties;
    getCurrentLocation();
    getUserDetail();
  }

  Future getUserDetail() async {
    try {
      var snapshot = await firebaseFirestore
          .collection('Registered Users')
          .where(FieldPath.documentId, isEqualTo: auth.currentUser!.uid)
          .get();
      userData.value =
          snapshot.docs.map((item) => UserModel.fromMap(item)).toList();
    } catch (e) {
      print(e.toString());
    }
  }

  Future getUserPaymentDetail() async {
    try {
      var snapshot = await firebaseFirestore.collection('Booked Hotels').get();
      userPaymentData.value = snapshot.docs
          .map((item) => UserModel.fromMap(item))
          .where((element) => element.userId!.contains(auth.currentUser!.uid))
          .toList();
    } catch (e) {
      print(e.toString());
      // Get.offAll(RegisterView());
    }
  }

  // update user personal details
  Future updateUserPersonalDetails(
      {required String name,
      required String email,
      required String image, required String phone}) async {
    try {
      firebaseFirestore
          .collection('Registered Users')
          .doc(auth.currentUser!.uid)
          .update({
        'user_name': name,
        'user_email': email,
        'user_profile_image': image,
        'phone_no':phone,
      });
      showSnackBar('Profile Image', 'Details updated successfully', Colors.green);
    } catch (e) {
      showSnackBar('Profile Image', 'Error: ${e.toString()}', Colors.red);
      rethrow;
    }
  }

  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }

  // Get image from gellery
  Future getProfileImage(ImageSource imageSource, String fileName) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      uploadProfileImage(File(pickedFile.path), fileName);
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  // Upload image to firebase storage and get image url

  Future uploadProfileImage(File image, String fileName) async {
    Reference reference =
        FirebaseStorage.instance.ref().child('${fileName}_${DateTime.now()}');
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    uploadedImageUrl.value= await snapshot.ref.getDownloadURL();
    await reference.putFile(image).whenComplete(() async{
      await reference.getDownloadURL().then((value) async {
          String urlImage = value;
          FirebaseFirestore.instance.collection("Registered Users").
          doc(FirebaseAuth.instance.currentUser!.uid.toString()).update({
          "user_profile_image":urlImage,
          });
          userData[0].profileImage = urlImage;
          // Get.off(ChangePersonalDetails());

      }
      );
    });

    // try {
    //   isProcessing.value = true;
    //   TaskSnapshot snapshot = await uploadTask;
    //   uploadedImageUrl.value = await snapshot.ref.getDownloadURL();
    //   isProcessing.value = false;
    // } catch (e) {
    //   isProcessing.value = false;
    //   Get.snackbar('Error', e.toString(),
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.red,
    //       colorText: Colors.white);
    // } finally {
    //   isProcessing.value = false;
    // }
  }

  Stream<List<UserHomeModel>> getPropertyData() =>
      collectionReference.snapshots().map((query) => query.docs
          .map((item) => UserHomeModel.fromMap(item))
          .where((element) => element.isActive == true && element.isHotel == 0)
          .toList());

// Add/Remove hotel from favoraties
  Future updateFavProperty(String docId, bool newValue) async {
    try {
      firebaseFirestore
          .collection('Owner New Property')
          .doc(docId)
          .update({'is_favorate': newValue});
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future signOut() async {
    await auth.signOut();
  }

  // Fetch user location
  getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(
        'Location Permission',
        'Location permission disabled',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar(
          'Location Permission',
          'Location permision denied.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
        'Location Permission',
        'Location permission denied forever.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
    try {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high,
              forceAndroidLocationManager: true)
          .then((Position position) async {
        currentPosition = position;
        print('${currentPosition!.latitude},${currentPosition!.longitude}');
        currentAddress.value = await getAddressFromLatLng();
        print(currentAddress.value);
      });
    } catch (e) {
      Get.snackbar(
        'User Location',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }

  Future<String> getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition!.latitude, currentPosition!.longitude);

      Placemark place = placemarks[0];
      return "${place.locality}";
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // filter function
  // List<UserHomeModel> filterPropertyList() => properties
  //     .where((hotel) =>
  //         hotel.rooms! >= countBedrooms.value &&
  //         int.parse(hotel.rentPrice!) >= startValue.value.toInt() &&
  //         int.parse(hotel.rentPrice!) <= endValue.value.toInt())
  //     .toList();

  void filterPropertyList() {
    List<UserHomeModel> results = [];
    results = properties
        .where((hotel) =>
            hotel.rooms! >= countBedrooms.value &&
            int.parse(hotel.rentPrice!) >= startValue.value.toInt() &&
            int.parse(hotel.rentPrice!) <= endValue.value.toInt())
        .toList();
    filterProperties.value = results;
  }
}
