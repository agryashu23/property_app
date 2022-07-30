import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:get/get.dart';
import 'package:property_app/app/contants/app_constants.dart';
import 'package:property_app/app/models/user_model.dart';
import 'package:property_app/app/modules/home/views/home_view.dart';
import 'package:property_app/app/modules/owner_home/views/owner_home_view.dart';
import 'package:property_app/app/modules/register/views/register_view.dart';

class AdminLoginController extends GetxController {
  static AdminLoginController loginController = Get.find();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController smsOtpController = TextEditingController();
  var verificationId = ''.obs;
  var userId = ''.obs;
  var isLoading = false.obs;
  TextEditingController forgetPasswordController = TextEditingController();
  RxList<UserModel> userData = RxList<UserModel>([]);
  RxList<UserModel> userDataByUID = RxList<UserModel>([]);
  var isGuest = false.obs;

  late ConfirmationResult confirmationResult;
  @override
  onInit() {
    super.onInit();
    checkUserSignedIn();
  }

  Future checkUserSignedIn() async {
    if (auth.currentUser != null) {
      userId.value = auth.currentUser!.uid;
      await getUserDetailByUID(userId.value);
      if (userDataByUID.isNotEmpty) {
        if (userDataByUID[0].userType == 'User') {
          Get.offAll(HomeView());
        } else {
          Get.offAll(OwnerHomeView());
        }
      }
    }
  }

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
      showSnackBar(
          'User Login',
          'Opps!\nUser not exists with such phone no.\nPlease register yourself.',
          Colors.red);
    }
  }

  Future getUserDetailByUID(String userId) async {
    try {
      isLoading(true);
      var snapshot = await firebaseFirestore
          .collection('Registered Users')
          .where(FieldPath.documentId, isEqualTo: userId)
          .get();
      userDataByUID.value =
          snapshot.docs.map((item) => UserModel.fromMap(item)).toList();

      print(userDataByUID.length);
      isLoading(false);
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }

// Removed in final changes
  // Future loginUser({required String phone, required String pass}) async {
  //   try {
  //     isLoading(true);
  //     await getUserDetail(phone);
  //     if (userData[0].userPass == pass) {
  //       showSnackBar('User Login', 'User logged in successfully', Colors.green);
  //       if (userData[0].userType == 'User') {
  //         Get.offAll(HomeView());
  //       } else {
  //         Get.offAll(OwnerHomeView());
  //       }
  //       isLoading(false);
  //     } else {
  //       isLoading(false);
  //       showSnackBar(
  //           'User Login',
  //           'Password is incorrect.\nPlease enter the correct passwrod to continue.',
  //           Colors.red);
  //     }
  //   } catch (e) {
  //     isLoading(false);
  //     showSnackBar('User Login', 'Error: ${e.toString()}', Colors.red);
  //   }
  // }

  Future<void> verifyPhone(String phoneNo) async {
    try {
      isLoading(true);
      await getUserDetail(phoneNo);
      if (userData.isNotEmpty) {
        if (userData[0].phoneNo == phoneNo) {
         confirmationResult= await auth.signInWithPhoneNumber('+91$phoneNo');

          // await auth.verifyPhoneNumber(
          //   phoneNumber: '+91$phoneNo',
          //   verificationCompleted: (PhoneAuthCredential credential) async {
          //     UserCredential userCredential =
          //         await auth.signInWithCredential(credential);
          //     if (!userCredential.additionalUserInfo!.isNewUser) {
          //       userId.value = auth.currentUser!.uid;
          //       print(userId.value);
          //       showSnackBar('User Authentication',
          //           'User authenicated successfully', Colors.green);
          //       if (userData[0].userType == 'User') {
          //         Get.offAll(HomeView());
          //       } else {
          //         Get.offAll(OwnerHomeView());
          //       }
          //     }
          //   },
          //   verificationFailed: (FirebaseAuthException e) {
          //     print(e.message);
          //     showSnackBar(
          //         'User Authentication', 'Please enter the OTP.', Colors.green);
          //   },
          //   codeSent: (String verId, int? resendToken) {
          //     verificationId.value = verId;
          //     showSnackBar('User Authentication', 'Please wait for the OTP.',
          //         Colors.green);
          //   },
          //   codeAutoRetrievalTimeout: (String verId) {
          //     // verificationId.value = verId;
          //   },
          //   timeout: const Duration(seconds: 5),
          // );
        } else {
          showSnackBar(
              'User Authentication',
              'User not registered.\nPlease register yourself to continue.',
              Colors.red);
        }
      }
      else {
        showSnackBar(
            'User Authentication',
            'User not registered.\nPlease register yourself to continue.',
            Colors.red);
      }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      showSnackBar('User Authentication', e.toString(), Colors.red);
    }
  }

  Future<void> signInUser(String smsCode, String verId) async {
    isLoading(true);
    // var credential =
    //     PhoneAuthProvider.credential(verificationId: verId, smsCode: smsCode);
    // UserCredential userCredential = await auth.signInWithCredential(credential);
    UserCredential userCredential = await confirmationResult.confirm(smsCode);
    if (!userCredential.additionalUserInfo!.isNewUser) {
      userId.value = auth.currentUser!.uid;
      print(userId.value);
      showSnackBar('User Authentication', 'User authenicated successfully',
          Colors.green);
      isLoading(false);
      if (userData[0].userType == 'User') {
        Get.offAll(HomeView());
      } else {
        Get.offAll(OwnerHomeView());
      }
    } else {
      isLoading(false);
      showSnackBar(
          'User Authentication',
          'User not registered.\nPlease register yourself to continue.',
          Colors.green);
      Get.offAll(RegisterView());
    }
  }

  // For forget password

  Future sendForgetPasswordSMS(String message, List<String> recipents) async {
    isLoading(true);
    String result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(result);
    showSnackBar(
        'Forget Password',
        'Your password has been sent on your registered phone no.',
        Colors.green);
    isLoading(false);
  }

  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }
}
