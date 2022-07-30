import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_app/app/contants/app_constants.dart';
import 'package:property_app/app/models/user_model.dart';
import 'package:property_app/app/modules/owner_add_property/bindings/owner_add_property_binding.dart';
import 'package:property_app/app/modules/owner_home/property_detail_model.dart';
import 'package:property_app/app/modules/owner_home/views/booked_hotels/model/booked_hotel_model.dart';

class AdminHomeController extends GetxController {
  var isHotel = 0.obs;
  var isUpdate = false.obs;
  var tappedPropertyId = ''.obs;
  var tappedUserId = ''.obs;

  var selectedOwner = 'All'.obs;
  RxList<Map<String,dynamic>> propertyOwners = RxList<Map<String,dynamic>>([]);
  RxList<UserModel> propertyOwnersData = RxList<UserModel>([]);
  RxList<UserModel> userDetail = RxList<UserModel>([]);
  List houses=[];

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  late CollectionReference bookingCollectionReference;
  RxList<PropertyDetailModel> properties = RxList<PropertyDetailModel>([]);
  RxList<PropertyDetailModel> properties2 = RxList<PropertyDetailModel>([]);
  RxList<PropertyDetailModel> propertyDetail = RxList<PropertyDetailModel>([]);
  RxList<BookedHotelModel> bookedHotels = RxList<BookedHotelModel>([]);
  var currentTheme = 'Dark'.obs;

  RxList<UserModel> userData = RxList<UserModel>([]);
  TextEditingController changeName = TextEditingController();
  TextEditingController changeEmail = TextEditingController();
  TextEditingController changePhone = TextEditingController();
  var isProcessing = false.obs;
  var uploadedImageUrl = ''.obs;
  RxList<String> owners = RxList<String>([]);

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection('Owner New Property');
    bookingCollectionReference = firebaseFirestore.collection('Booked Hotels');
    properties.bindStream(getPropertyData());
    properties2.bindStream(getPropertyData2());
    getUserDetail(tappedUserId.value);

    // propertyDetail.bindStream(getTappedPropertyData());
    // userDetail.bindStream(getTappedUserData());
    // propertyOwnersData.bindStream(getOwnersData());
    getOwnersData();
    propertyOwners.bindStream(getPropertyOwnersList());
    // bookedHotels.bindStream(getBookedHotelsData());
    // getUserDetail();
  }



  Stream<List<PropertyDetailModel>> getPropertyData() =>
      collectionReference.snapshots().map((query) => query.docs
          .map((item) => PropertyDetailModel.fromMap(item))
          .where((element) => element.isHotel == 0)
          .toList());

  Stream<List<PropertyDetailModel>> getPropertyData2() =>
      collectionReference.snapshots().map((query) => query.docs
          .map((item) => PropertyDetailModel.fromMap(item))
          .where((element) => element.isHotel == 1)
          .toList());

  // Stream<List<UserModel>> getOwnersData() =>
  //     firebaseFirestore.collection('Registered Users').snapshots().map((query) => query.docs
  //         .map((item) => UserModel.fromMap(item))
  //         .toList());

  Future getOwnersData() async {
    var snapshot = await firebaseFirestore.collection('Registered Users').get();
    propertyOwnersData.value = snapshot.docs
        .map((item) => UserModel.fromMap(item))
        .toList();
    print('getOwnersData: ${propertyOwnersData.length}');
  }

  Stream<List<Map<String,dynamic>>> getPropertyOwnersList() =>
      firebaseFirestore
          .collection('Registered Users')
          .where('user_type', isEqualTo: 'Owner')
          .snapshots()
          .map((query) => query.docs.map((item) => item.data()).toList());
  
  void getListOfOwners(){
    for (var i = 0; i < propertyOwners.length; i++) {
      owners.add(propertyOwners[i]['user_name']);
    }
    print('List of Owners: $owners');
  }


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

  Future getTappedUserData(String docId) async {
    var snapshot = await firebaseFirestore.collection('Registered Users').get();
    userDetail.value = snapshot.docs
        .map((item) => UserModel.fromMap(item))
        .where((element) => element.userId!.contains(docId))
        .toList();
  }

  Stream<List<BookedHotelModel>> getBookedHotelsData() =>
      bookingCollectionReference.snapshots().map((query) =>
          query.docs.map((item) => BookedHotelModel.fromMap(item)).toList());

  // Profile part

  Future getUserDetail(idd) async {
    try {
      var snapshot = await firebaseFirestore
          .collection('Registered Users')
          .where(FieldPath.documentId, isEqualTo: idd)
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
    try {
      isProcessing.value = true;
      TaskSnapshot snapshot = await uploadTask;
      uploadedImageUrl.value = await snapshot.ref.getDownloadURL();
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

  // update user personal details
  Future updateUserPersonalDetails(
      {required String name,
      required String email,
      required String image,
      required String phone,}) async {
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
      showSnackBar('Profile Image', 'Details updated successfully', Colors.red);
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
