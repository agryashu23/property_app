import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_app/app/contants/app_constants.dart';
import 'package:property_app/app/models/user_model.dart';
import 'package:property_app/app/modules/owner_home/property_detail_model.dart';
import 'package:property_app/app/modules/owner_home/views/booked_hotels/model/booked_hotel_model.dart';
import 'package:property_app/app/modules/owner_home/views/profile/components/owner_change_personal_details.dart';

class OwnerHomeController extends GetxController {
  var isHotel = 0.obs;
  var isUpdate = false.obs;
  var tappedPropertyId = ''.obs;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  late CollectionReference bookingCollectionReference;
  RxList<PropertyDetailModel> properties = RxList<PropertyDetailModel>([]);
  RxList<PropertyDetailModel> propertyDetail = RxList<PropertyDetailModel>([]);
  RxList<BookedHotelModel> bookedHotels = RxList<BookedHotelModel>([]);
  var currentTheme = 'Dark'.obs;

  RxList<UserModel> userData = RxList<UserModel>([]);
  TextEditingController changeName = TextEditingController();
  TextEditingController changeEmail = TextEditingController();
  TextEditingController changePhone = TextEditingController();

  var isProcessing = false.obs;
  var uploadedImageUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection('Owner New Property');
    bookingCollectionReference = firebaseFirestore.collection('Booked Hotels');
    properties.bindStream(getPropertyData());
    // propertyDetail.bindStream(getTappedPropertyData());
    bookedHotels.bindStream(getBookedHotelsData());
    getUserDetail();
  }

  Stream<List<PropertyDetailModel>> getPropertyData() =>
      collectionReference.snapshots().map((query) => query.docs
          .map((item) => PropertyDetailModel.fromMap(item))
          .where((element) => element.isActive == true)
          .toList());

  // Stream<List<PropertyDetailModel>> getTappedPropertyData() =>
  //     collectionReference.snapshots().map((query) => query.docs
  //         .map((item) => PropertyDetailModel.fromMap(item))
  //         .where((element) => element.propertydocId == tappedPropertyId.value)
  //         .toList());

  Future getTappedPropertyData(String docId) async {
    var snapshot = await collectionReference.get();
    propertyDetail.value = snapshot.docs
        .map((item) => PropertyDetailModel.fromMap(item))
        .where((element) => element.propertydocId!.contains(docId))
        .toList();
  }

  Stream<List<BookedHotelModel>> getBookedHotelsData() =>
      bookingCollectionReference.snapshots().map((query) =>
          query.docs.map((item) => BookedHotelModel.fromMap(item)).toList());

  
  // Profile part

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
        Get.off(OwnerChangePersonalDetails());

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

  Future signOut() async {
    await auth.signOut();
  }
}
