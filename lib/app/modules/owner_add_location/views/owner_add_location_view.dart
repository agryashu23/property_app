import 'dart:async';

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geoCoding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';
import 'package:property_app/app/modules/owner_add_details/views/owner_add_details_view.dart';
import 'package:property_app/app/modules/owner_add_pricing/views/owner_add_pricing_view.dart';
import 'package:property_app/app/modules/owner_add_property/views/owner_add_property_view.dart';

import '../controllers/owner_add_location_controller.dart';

class OwnerAddLocationView extends GetView<OwnerAddLocationController> {
  OwnerAddLocationView({
    this.update,
    this.propertyNo,
    this.propertyStreet,
    this.propertyLandmark,
    this.propertyCity,
    this.propertyState,
    this.propertyPincode,
    this.rooms,
    this.area,
    this.areaType,
    this.rentPrice,
    this.isActive,
    this.rating,
    this.ratingCount,
    this.propertydocId,
    this.isHotel,
    this.propertyFurnishing,
    this.propertyAvailable,
    this.propertyAvailableFrom,
    this.propertyFloors,
    this.propertyFloorNo,
    this.propertyFacing,
    this.propertyBathrooms,
    this.propertyBalcony,
    this.propertyImage1,
    this.propertyImage2,
    this.propertyImage3,
    this.propertyImage4,
    this.propertyImage5,
    this.propertyImage6,
    this.propertyImage7,
    this.propertyImage8,
    this.propertyVideo1,
    this.propertyHighlights,
    this.propertySecurity,
    this.propertyMaintenance,
    this.propertyMaintenanceType,
    Key? key,
  }) : super(key: key);

  OwnerAddLocationController locationController =
      Get.put(OwnerAddLocationController());

  final String? propertyNo;
  final bool? update;
  final String? propertyStreet;
  final String? propertyLandmark;
  final String? propertyCity;
  final String? propertyState;
  final String? propertyPincode;
  final int? rooms;
  final String? area;
  final String? areaType;
  final String? rentPrice;
  final bool? isActive;
  final String? rating;
  final String? ratingCount;
  final String? propertydocId;
  final int? isHotel;
  final String? propertyFurnishing;
  final String? propertyAvailable;
  final String? propertyAvailableFrom;
  final int? propertyFloors;
  final int? propertyFloorNo;
  final String? propertyFacing;
  final int? propertyBathrooms;
  final int? propertyBalcony;
  final String? propertyImage1;
  final String? propertyImage2;
  final String? propertyImage3;
  final String? propertyImage4;
  final String? propertyImage5;
  final String? propertyImage6;
  final String? propertyImage7;
  final String? propertyImage8;
  final String? propertyVideo1;
  final String? propertyHighlights;
  final String? propertySecurity;
  final String? propertyMaintenance;
  final String? propertyMaintenanceType;

  @override
  Widget build(BuildContext context) {
    if (update != null) {
      if (update!) {
        controller.houseNo.text = propertyNo!;
        controller.area.text = propertyStreet!;
        controller.landmark.text = propertyLandmark!;
        controller.city.text = propertyCity!;
        controller.state.text = propertyState!;
        controller.pincode.text = propertyPincode!;
      }
    }
    return Scaffold(
      bottomNavigationBar: buildBottomNavBar(context),
      backgroundColor: Color(0XFFFCFCFC),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Color(0XFFFCFCFC),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF1A1E25),
          ),
        ),
        title: Text(
          'Add Property Location',
          style: TextStyle(
            color: Color(0xFF1A1E25),
            fontSize: 25,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: locationController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Full Adreess of the property',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF1A1E25),
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 26),
                locationInputField(
                    text: 'Flat, House no., villa no., PG no.',
                    controller: locationController.houseNo,
                    focusNode: locationController.houseNoFocusNode),
                locationInputField(
                    text: 'Area, Colony, Street, Sector, Village',
                    controller: controller.area,
                    focusNode: locationController.areaFocusNode),
                locationInputField(
                    text: 'Landmark',
                    controller: controller.landmark,
                    focusNode: locationController.landmarkFocusNode),
                // locationInputField(
                //     text: 'Town/City',
                //     controller: controller.city,
                //     focusNode: locationController.cityFocusNode),
                SizedBox(height: 20,),
                CSCPicker(
                  showStates: true,
                  showCities: true,
                  layout: Layout.vertical,
                  flagState: CountryFlag.DISABLE,
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xFFF2F2F3),
                      border:
                      Border.all(    color: Color(0xFF7AA721),
                        width: 0.8,)),
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xFFF2F2F3),
                      border:
                      Border.all(    color: Color(0xFF7AA721),
                        width: 0.8,)),
                  // countrySearchPlaceholder: "Country",
                  // stateSearchPlaceholder: "State",
                  // citySearchPlaceholder: "City",
                  countryDropdownLabel: "Country",
                  stateDropdownLabel: "State",
                  cityDropdownLabel: "City",
                  defaultCountry: DefaultCountry.India,
                  disableCountry: true,
                  selectedItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                  dropdownHeadingStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  dropdownItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  dropdownDialogRadius: 10.0,
                  searchBarRadius: 10.0,
                  onCountryChanged: (value) {
                  },
                  onStateChanged: (value) {
                      controller.state.text = value.toString();
                  },
                  onCityChanged: (value) {
                      ///store value in city variable
                      controller.city.text = value.toString();
                  },
                ),
                // locationInputField(
                //     text: 'State',
                //     controller: controller.state,
                //     focusNode: locationController.stateFocusNode),
                locationInputField(
                    text: 'Pin Code',
                    controller: controller.pincode,
                    focusNode: locationController.pincodeFocusNode),
                const SizedBox(height: 20),
                Container(
                  child: TextFormField(
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      locationController.locations.value =
                          await geoCoding.locationFromAddress(
                              '${controller.area.text}, ${controller.city.text}, ${controller.state.text}');
                      locationController.latitude.value =
                          locationController.locations[0].latitude;
                      locationController.longitude.value =
                          locationController.locations[0].longitude;
                      locationController.showMarker(
                          locationController.latitude.value,
                          locationController.longitude.value,
                          '${controller.area.text}, ${controller.city.text}, ${controller.state.text}');
                    },
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Search on Google',
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF393E48),
                        letterSpacing: 2,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFFCFCFC),
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFFCFCFC),
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      fillColor: const Color(0xFFFCFCFC),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.location_on_rounded,
                        color: Color(0xFF7AA721),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 209,
                  child: Obx(
                    () => GoogleMap(
                      mapType: MapType.normal,
                      onMapCreated: (mapController) {
                        locationController.mapController
                            .complete(mapController);
                      },
                      initialCameraPosition: const CameraPosition(
                        target: LatLng(26.875421, 75.809307),
                        zoom: 10.0,
                      ),
                      markers: Set<Marker>.from(locationController.markers),
                    ),
                  ),
                ),
                const SizedBox(height: 26),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column locationInputField(
      {required String text,
      required TextEditingController controller,
      required FocusNode focusNode}) {
    Timer? debounce;
    DetailsResult? position;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 26),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF393E48),
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          child: TextFormField(
            controller: controller,
            style: TextStyle(color: Colors.black),

            validator: (value) {
              if (value!.isEmpty) {
                return "Field can't be empty.";
              }
              return null;
            },
            focusNode: focusNode,
            autofocus: false,
            onChanged: (value) {
              if (debounce?.isActive ?? false) debounce!.cancel();
              debounce = Timer(Duration(milliseconds: 1000), () {
                if (value.isNotEmpty) {
                  locationController.autoCompleteSearch(value);
                } else {
                  locationController.predictions.clear();
                  controller.clear();
                }
              });
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFF7AA721),
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFEB5757),
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFF7AA721),
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              fillColor: const Color(0xFFF2F2F3),
              focusColor: const Color(0xFFF2F2F3),
              filled: true,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: locationController.predictions.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                locationController.predictions[index].toString(),
              ),
              onTap: () async {
                final placeId = locationController.predictions[index].placeId;
                final details =
                    await locationController.googlePlace.details.get(placeId!);
                if (details != null && details.result != null) {
                  if (focusNode.hasFocus) {
                    position = details.result;
                    controller.text = details.result!.name!;
                    print('Controller Text: ${controller.text}');
                    locationController.predictions.clear();
                  }
                }
              },
            );
          },
        ),
      ],
    );
  }

  Widget buildBottomNavBar(BuildContext context) {
    return InkWell(
      onTap: () {
        if (locationController.formKey.currentState!.validate() &&
            locationController.latitude.value != null &&
            locationController.longitude.value != null) {
          print(isHotel);
          Get.to(
            OwnerAddDetailsView(
              update: update,
              rooms: rooms,
              area: area,
              areaType: areaType,
              rentPrice: rentPrice,
              isActive: isActive,
              rating: rating,
              ratingCount: ratingCount,
              propertydocId: propertydocId,
              isHotel: isHotel,
              propertyFurnishing: propertyFurnishing,
              propertyAvailable: propertyAvailable,
              propertyAvailableFrom: propertyAvailableFrom,
              propertyFloors: propertyFloors,
              propertyFloorNo: propertyFloorNo,
              propertyFacing: propertyFacing,
              propertyBathrooms: propertyBathrooms,
              propertyBalcony: propertyBalcony,
              propertyImage1: propertyImage1,
              propertyImage2: propertyImage2,
              propertyImage3: propertyImage3,
              propertyImage4: propertyImage4,
              propertyImage5: propertyImage5,
              propertyImage6: propertyImage6,
              propertyImage7: propertyImage7,
              propertyImage8: propertyImage8,
              propertyVideo1: propertyVideo1,
              propertyHighlights: propertyHighlights,
              propertySecurity: propertySecurity,
              propertyMaintenance: propertyMaintenance,
              propertyMaintenanceType: propertyMaintenanceType,
            ),
          );
        } else {
          Get.showSnackbar(
            const GetSnackBar(
              title: 'Add Location Details',
              message: 'Provided location is not correct please enter the correct location.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              duration: Duration(seconds: 1),
              isDismissible: true,
            ),
          );
        }
      },
      child: Container(
        height: 108,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 27.0),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
        ),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.fromLTRB(27, 16, 28, 44),
            alignment: Alignment.center,
            height: 48,
            child: Text(
              'Next',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFB5EB49),
                  Color(0xFF7AA721),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
