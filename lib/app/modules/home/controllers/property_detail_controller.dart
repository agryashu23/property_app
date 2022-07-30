import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PropertyDetailController extends GetxController {
  var carouselCurrentIndex = 0.obs;

  // Google Map box part
  RxList<Marker> markers = RxList<Marker>([]);
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  late Completer<GoogleMapController> mapController;
  RxList<Location> locations = RxList<Location>([]);

  @override
  void onInit() {
    mapController = Completer();
    super.onInit();
  }

  void showMarker(String value) async {
    try {
      locations.value = await locationFromAddress(value).catchError((e) {
        GetSnackBar(
          title: 'Google Map',
          message: 'Error: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
      });
      latitude.value = locations[0].latitude;
      longitude.value = locations[0].longitude;
      markers.add(
        Marker(
          markerId: const MarkerId('Property Location'),
          position: LatLng(latitude.value, longitude.value),
          infoWindow: const InfoWindow(
            title: 'Property Location',
            snippet: 'property location will be displayed here.',
          ),
        ),
      );
    } catch (e) {
      GetSnackBar(
        title: 'Google Map',
        message: 'Error: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }
}
