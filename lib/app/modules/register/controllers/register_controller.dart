import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_app/app/contants/app_constants.dart';
import 'package:property_app/app/models/user_model.dart';
import 'package:property_app/app/modules/register/views/components/user_type_selection.dart';

import '../views/components/verify_identity.dart';

class RegisterController extends GetxController {
  var userType = 'User'.obs;
  var isVerficationSkipped = false.obs;
  var isLoading = false.obs;

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  var uploadedImageUrl =
      List<String>.generate(2, (index) => '', growable: true).obs;

  // Register User data on firestore
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController smsCodeController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController aadharFIController = TextEditingController();
  TextEditingController aadharBIController = TextEditingController();
  late ConfirmationResult confirmationResult;
  late UserCredential userCredential;


  var verificationId = ''.obs;
  var userId = ''.obs;
  RxList<UserModel> userData = RxList<UserModel>([]);

  // @override
  // onInit() {
  //   super.onInit();
  // }

  Future getUserDetail(String phone) async {
    try {
      isLoading(true);
      var snapshot =
          await firebaseFirestore.collection('Registered Users').get();
      userData.value = snapshot.docs
          .map((item) => UserModel.fromMap(item))
          .where((element) => element.phoneNo!.contains(phone))
          .toList();
      isLoading(false);
    } catch (e) {
      isLoading(false);
      showSnackBar('User Registration', 'Opps!\n${e.toString()}', Colors.red);
    }
  }

  Future<void> verifyPhone(String phoneNo) async {
    try {
      isLoading(true);
      await getUserDetail(phoneNo);
      print(userData);
      if (userData.isNotEmpty) {
        if (userData[0].phoneNo == phoneNo) {
          showSnackBar(
              'User Registration',
              'User already registered.\nPlease login to continue.',
              Colors.red);
        }
      } else {
        kIsWeb? confirmationResult= await auth.signInWithPhoneNumber('+91$phoneNo'):await auth.verifyPhoneNumber(
          phoneNumber: '+91$phoneNo',
          verificationCompleted: (PhoneAuthCredential credential) async {
            UserCredential userCredential =
                await auth.signInWithCredential(credential);
            if (userCredential.additionalUserInfo!.isNewUser) {
              userId.value = auth.currentUser!.uid;
              showSnackBar('User Authentication',
                  'User authenicated successfully', Colors.green);
              userType.value=="User";
              Get.to(VerifyUserIdentity());
            }
          },
          verificationFailed: (FirebaseAuthException e) {
            print(e.message);
            showSnackBar(
                'User Authentication', 'Please enter the OTP.', Colors.green);
          },
          codeSent: (String verId, int? resendToken) {
            verificationId.value = verId;
            showSnackBar('User Authentication', 'Please wait for the OTP.',
                Colors.green);
          },
          codeAutoRetrievalTimeout: (String verId) {
            verificationId.value = verId;
          },
          timeout: const Duration(seconds: 60),
        );
      }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      // showSnackBar('User Authentication', e.toString(), Colors.red);
    }
  }

  Future<void> signInUser(String smsCode, String verId) async {
    try {
      if(kIsWeb){
        userCredential = await confirmationResult.confirm(smsCode);
      }
      else{
        var credential =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: smsCode);
        userType.value=="User";

        userCredential =
        await auth.signInWithCredential(credential);
      }
      isLoading(true);
      if (userCredential.additionalUserInfo!.isNewUser) {
        isLoading(false);
        userId.value = auth.currentUser!.uid;
        showSnackBar('User Authentication', 'User authenticated successfully',
            Colors.green);
        Get.to(VerifyUserIdentity());
        // Get.to(UserTypeSelection());
      } else {
        isLoading(false);
        showSnackBar(
            'User Authentication',
            'User already authenicated.\nPlease login to continue.',
            Colors.green);
      }
    } catch (e) {
      isLoading(false);
      showSnackBar('User Authentication', e.toString(), Colors.red);
    }
  }

  Future saveUserData(
      {required String document, required Map<String, dynamic> data}) async {
    try {
      isLoading(true);
      await firebaseFirestore
          .collection('Registered Users')
          .doc(document)
          .set(data);
      isLoading(false);
      showSnackBar("New User", 'New User Created Successfully', Colors.green);
    } catch (e) {
      isLoading(false);
      showSnackBar("Exception", e.toString(), Colors.red);
    }
  }

// Get image from gellery
  Future getPropertyImage(
      ImageSource imageSource, String fileName, int index) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null ) {
      if(!kIsWeb){
        selectedImagePath.value = pickedFile.path;
        selectedImageSize.value =
            "${((File(selectedImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)} Mb";
      }
     kIsWeb? uploadPrpertyImage2(pickedFile, fileName, index):uploadPrpertyImage(File(pickedFile.path), fileName, index);
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  // Upload image to firebase storage and get image url

  Future uploadPrpertyImage(File image, String fileName, int index) async {
    Reference reference =
        FirebaseStorage.instance.ref().child('${fileName}_${DateTime.now()}');
    UploadTask uploadTask = reference.putFile(image);
    try {
      isLoading(true);
      TaskSnapshot snapshot = await uploadTask;
      uploadedImageUrl[index] = await snapshot.ref.getDownloadURL();
      showSnackBar(
          "New User", 'Aadhar image uploaded successfully', Colors.green);
      isLoading(false);
    } catch (e) {
      isLoading(false);
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
  Future uploadPrpertyImage2(XFile pickedFile, String fileName, int index) async {
    Reference _reference = FirebaseStorage.instance
        .ref()
        .child('${fileName}_${DateTime.now()}');
    UploadTask uploadTask = _reference
        .putData(
      await pickedFile.readAsBytes(),
      SettableMetadata(contentType: 'image/jpeg'),
    );
    try {
      isLoading(true);
      TaskSnapshot snapshot = await uploadTask;
      uploadedImageUrl[index] = await snapshot.ref.getDownloadURL();
      showSnackBar(
          "New User", 'Aadhar image uploaded successfully', Colors.green);
      isLoading(false);
    } catch (e) {
      isLoading(false);
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }

  }

  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }
}
