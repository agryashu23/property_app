import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:property_app/app/models/user_model.dart';
import 'package:property_app/app/modules/hotel/model/hotel_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class HotelController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  RxList<UserHotelModel> properties = RxList<UserHotelModel>([]);
  RxList<UserHotelModel> filterProperties = RxList<UserHotelModel>([]);

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

  // Payment Intergration
  late Razorpay razorpay;

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection('Owner New Property');
    razorpay = Razorpay();
    properties.bindStream(getPropertyData());
    filterProperties = properties;
    getCurrentLocation();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void onClose() {
    super.onClose();
    razorpay.clear();
  }

  // Payment integration part

  void startPaymentOnRazorPay(
      int amount, String userContactNo, String userEmail) {
    var options = {
      'key': 'rzp_test_X7yg0LdGoEhieX',
      'amount': amount,
      'name': 'Home_Rent',
      'description': 'Payment for Hotel booking',
      'retry': {'enabled': true, 'max_count': 1},
      'prefill': {'contact': userContactNo, 'email': userEmail},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      showSnackBar('Payment Status', 'Error: ${e.toString()}', Colors.red);
      print('Razorpay Error: ${e.toString()}');
    }
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response) {
    showSnackBar('Payment Status', 'Thanks! Payment Successfull', Colors.green);
    print('Success Response: $response');
  }

  void handlerPaymentFailure(PaymentFailureResponse response) {
    showSnackBar('Payment Status', 'Sorry! Payment Failed', Colors.red);
    print('Error Response: $response');
  }

  void handlerExternalWallet(ExternalWalletResponse response) {
    showSnackBar(
        'Payment Status', 'External Wallet Used for payment', Colors.yellow);
    print('External SDK Response: $response');
  }

  Future getUserDetail(String uid) async {
    var snapshot = await firebaseFirestore.collection('Registered Users').get();
    userData.value = snapshot.docs
        .map((item) => UserModel.fromMap(item))
        .where((element) => element.userId!.contains(uid))
        .toList();
  }

  Stream<List<UserHotelModel>> getPropertyData() =>
      collectionReference.snapshots().map((query) => query.docs
          .map((item) => UserHotelModel.fromMap(item))
          .where((element) => element.isActive == true && element.isHotel == 1)
          .toList());

  Stream<List<UserHotelModel>> getFavPropertyData() =>
      collectionReference.snapshots().map((query) => query.docs
          .map((item) => UserHotelModel.fromMap(item))
          .where((element) =>
              element.isActive == true &&
              element.isHotel == 1 &&
              element.isFavorate == true)
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
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
            forceAndroidLocationManager: true)
        .then((Position position) async {
      currentPosition = position;
      print('${currentPosition!.latitude},${currentPosition!.longitude}');
      currentAddress.value = await getAddressFromLatLng();
      print(currentAddress.value);
    }).catchError((e) {
      print(e);
    });
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
  void filterPropertyList() {
    List<UserHotelModel> results = [];
    results = properties
        .where((hotel) =>
            hotel.rooms! >= countBedrooms.value &&
            int.parse(hotel.rentPrice!) >= startValue.value.toInt() &&
            int.parse(hotel.rentPrice!) <= endValue.value.toInt())
        .toList();
    filterProperties.value = results;
  }

  // Place booking request
  Future saveBookingRequest({required Map<String, dynamic> data}) async {
    try {
      // isLoading(true);
      await firebaseFirestore.collection('Booked Hotels').doc().set(data);
      // isLoading(false);
      showSnackBar("Booking Request", 'Booking Request Placed Successfully',
          Colors.green);
    } catch (e) {
      // isLoading(false);
      showSnackBar("Exception", e.toString(), Colors.red);
    }
  }

  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }
}
