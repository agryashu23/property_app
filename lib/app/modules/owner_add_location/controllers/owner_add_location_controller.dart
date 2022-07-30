import 'dart:async';
import 'package:geocoding/geocoding.dart' as geoCoding;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

class OwnerAddLocationController extends GetxController {
  TextEditingController houseNo = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController demoController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Maps part
  late GooglePlace googlePlace;
  RxList<AutocompletePrediction> predictions =
      RxList<AutocompletePrediction>([]);
  late FocusNode houseNoFocusNode;
  late FocusNode areaFocusNode;
  late FocusNode landmarkFocusNode;
  late FocusNode cityFocusNode;
  late FocusNode stateFocusNode;
  late FocusNode pincodeFocusNode;

  // Google Map box part
  RxList<Marker> markers = RxList<Marker>([]);
  RxList<geoCoding.Location> locations = RxList<geoCoding.Location>([]);
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  late Completer<GoogleMapController> mapController;

  @override
  void onInit() {
    String apiKey = 'AIzaSyCxvht2SHgyvQ9X1NIqUFzXG-WuZIWO2Xg';
    googlePlace = GooglePlace(apiKey);
    houseNoFocusNode = FocusNode();
    areaFocusNode = FocusNode();
    landmarkFocusNode = FocusNode();
    cityFocusNode = FocusNode();
    stateFocusNode = FocusNode();
    pincodeFocusNode = FocusNode();
    mapController = Completer();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    houseNoFocusNode.dispose();
    areaFocusNode.dispose();
    landmarkFocusNode.dispose();
    cityFocusNode.dispose();
    stateFocusNode.dispose();
    pincodeFocusNode.dispose();
  }

  autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null) {
      // print(result.predictions!.first.description);
      predictions.value = result.predictions!;
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Location Autocomplete',
          message: 'No location suggesstions found.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void showMarker(double lat, double long, String locationName) {
    markers.add(
      Marker(
        markerId: const MarkerId('Property Location'),
        position: LatLng(lat, long),
        infoWindow: InfoWindow(
          title: 'Property Location',
          snippet: locationName,
        ),
      ),
    );
  }
}
