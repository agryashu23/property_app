import 'dart:math';
import 'package:property_app/app/contants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/owner_home/controllers/owner_home_controller.dart';
import 'package:property_app/app/modules/owner_home/views/owner_home_view.dart';
import '../../owner_add_details/controllers/owner_add_details_controller.dart';
import '../../owner_add_location/controllers/owner_add_location_controller.dart';
import '../../owner_add_property/controllers/owner_add_property_controller.dart';
import '../controllers/owner_add_pricing_controller.dart';

class OwnerAddPricingView extends GetView<OwnerAddPricingController> {
  OwnerAddPricingView({
    this.update,
    this.rentPrice,
    this.isActive,
    this.rating,
    this.ratingCount,
    this.propertydocId,
    this.isHotel,
    this.propertyHighlights,
    this.propertySecurity,
    this.propertyMaintenance,
    this.propertyMaintenanceType,
    Key? key,
  }) : super(key: key);

  OwnerAddPricingController pricingController =
      Get.put(OwnerAddPricingController());
  OwnerAddDetailsController detailController =
      Get.put(OwnerAddDetailsController());
  OwnerAddLocationController locationController =
      Get.put(OwnerAddLocationController());
  OwnerAddPropertyController propertyController =
      Get.put(OwnerAddPropertyController());
  OwnerHomeController homeController = Get.put(OwnerHomeController());

  final String? rentPrice;
  final bool? update;
  final bool? isActive;
  final String? rating;
  final String? ratingCount;
  final String? propertydocId;
  final int? isHotel;
  final String? propertyHighlights;
  final String? propertySecurity;
  final String? propertyMaintenance;
  final String? propertyMaintenanceType;

  @override
  Widget build(BuildContext context) {
    if (update != null) {
      if (update!) {
        pricingController.rent.text = rentPrice!;
        pricingController.security.text = propertySecurity!;
        pricingController.maintenance.text = propertyMaintenance!;
        pricingController.dropDownValue.value = propertyMaintenanceType!;
        pricingController.highlights.text = propertyHighlights!;
      }
    }

    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        controller: pricingController,
        locationController: locationController,
        detailController: detailController,
        propertyController: propertyController,
        homeController: homeController,
        propertydocId: propertydocId,
      ),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: Text(
          'Add Pricing',
          style: TextStyle(
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
            key: pricingController.formKey2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  isHotel == 0
                      ? 'Monthly Rent Price & Short Description'
                      : 'Hotel Charges & Short Description',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: textColorDark,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 26),
                locationInputField(
                  text: isHotel == 0 ? 'Monthly Rent' : 'Per Day Charges',
                  controller: pricingController.rent,
                ),
                const SizedBox(height: 54),
                isHotel == 0
                    ? RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Security Deposit ',
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1.3,
                              ),
                            ),
                            TextSpan(
                              text: '(optional)',
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1.3,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                const SizedBox(height: 8),
                isHotel == 0
                    ? Container(
                        child: TextField(
                          controller: pricingController.security,
                          autofocus: false,
                          style: TextStyle(color: Colors.black),
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
                      )
                    : Container(),
                isHotel == 0 ? const SizedBox(height: 26) : Container(),
                isHotel == 0
                    ? RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Maintenance Charges ',
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1.3,
                              ),
                            ),
                            TextSpan(
                              text: '(optional)',
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1.3,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                const SizedBox(height: 8),
                isHotel == 0
                    ? TextField(
                        controller: pricingController.maintenance,
                        autofocus: false,
                  style: TextStyle(color: Colors.black),

                  decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF7AA721),
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
                          filled: true,
                          suffixIconConstraints: BoxConstraints(
                            minHeight: 56,
                          ),
                          suffixIcon: textFieldWithDropDown(),
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    : Container(),
                const SizedBox(height: 26),
                Text(
                  isHotel == 0 ? 'Property Highlights' : 'Hotel Highlights',
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 209,
                  child: TextFormField(
                    controller: pricingController.highlights,
                    style: TextStyle(color: Colors.black),

                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Highlights can't be empty.";
                      }
                      return null;
                    },
                    textAlignVertical: TextAlignVertical.top,
                    maxLines: null,
                    minLines: null,
                    expands: true,
                    autofocus: false,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        left: 27,
                        top: 24,
                        right: 31,
                      ),
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
                      hintText:
                          'Write About the locality, what is nearby, \nproperty facing direction, power backups, \nand some good facilities....',
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

  Container textFieldWithDropDown() {
    var items = [
      'Monthly',
      'Anually',
    ];
    return Container(
      alignment: Alignment.center,
      width: 96,
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F3),
        border: Border.all(
          color: Color(0xFF7AA721),
          width: 0.8,
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Obx(
        () => DropdownButtonHideUnderline(
          child: DropdownButton(
            style: TextStyle(
              color: Color(0xFF7D7F88),
              letterSpacing: 2,
            ),
            elevation: 0,
            value: pricingController.dropDownValue.value,
            items: items.map((String items) {
              return DropdownMenuItem<String>(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              pricingController.dropDownValue.value = newValue!;
            },
          ),
        ),
      ),
    );
  }

  Widget locationInputField(
      {required String text, required TextEditingController controller}) {
    return Form(
      key: pricingController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 26),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.black),

              validator: (value) {
                if (value!.isEmpty) {
                  return "Field can't be empty.";
                }
                return null;
              },
              autofocus: false,
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
        ],
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    Key? key,
    required this.controller,
    required this.detailController,
    required this.locationController,
    required this.propertyController,
    required this.homeController,
    this.propertydocId,
    this.update,
  }) : super(key: key);

  OwnerAddPricingController controller;
  OwnerAddDetailsController detailController;
  OwnerAddLocationController locationController;
  OwnerAddPropertyController propertyController;
  OwnerHomeController homeController;
  final String? propertydocId;
  final bool? update;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 27.0),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            print(widget.homeController.isHotel.value);

            !widget.homeController.isUpdate.value
                ? saveProperty(
                    isHotel: widget.homeController.isHotel.value,
                    propertyType: widget.propertyController.propertyType.value,
                    contactPerson: widget.propertyController.contactPerson.value.text,
                    contactNumber: widget.propertyController.contactNo.value.text,
                    propertyNo: widget.locationController.houseNo.value.text,
                    propertyStreet: widget.locationController.area.value.text,
                    propertyLandmark: widget.locationController.landmark.value.text,
                    propertyCity: widget.locationController.city.value.text,
                    propertyState: widget.locationController.state.value.text,
                    propertyPincode: widget.locationController.pincode.value.text,
                    propertyBedrooms: widget.detailController.countBedrooms.value,
                    propertyBathrooms: widget.detailController.countBathrooms.value,
                    propertyBalcony: widget.detailController.countBeds.value,
                    propertyArea: widget.detailController.areaSize.value.text,
                    propertyAreaType: widget.detailController.dropDownValue.value,
                    propertyFurnishing: widget.detailController.furnishing.value,
                    propertyAvailable: widget.detailController.availableFor.value,
                    propertyBuildingFloors: widget.detailController.noOfFloors.value,
                    propertyFloorNo: widget.detailController.floorNo.value,
                    propertyAvailableFrom: widget.detailController.dateCtl.value.text,
                    propertyFacing: widget.detailController.facing.value,
                    propertyImage1: widget.detailController.uploadedImageUrl[0],
                    propertyImage2: widget.detailController.uploadedImageUrl[1],
                    propertyImage3: widget.detailController.uploadedImageUrl[2],
                    propertyImage4: widget.detailController.uploadedImageUrl[3],
                    propertyImage5: widget.detailController.uploadedImageUrl[4],
                    propertyImage6: widget.detailController.uploadedImageUrl[5],
                    propertyImage7: widget.detailController.uploadedImageUrl[6],
                    propertyImage8: widget.detailController.uploadedImageUrl[7],
                    propertyVideo1: widget.detailController.uploadedImageUrl[8],
                    propertyRent: widget.controller.rent.value.text,
                    propertySecurity: widget.controller.security.value.text,
                    propertyMaintenance: widget.controller.maintenance.value.text,
                    propertyMaintenanceType: widget.controller.dropDownValue.value,
                    propertyHighlights: widget.controller.highlights.value.text,
                  )
                : updateProperty(
                    propertyType: widget.propertyController.propertyType.value,
                    contactPerson: widget.propertyController.contactPerson.value.text,
                    contactNumber: widget.propertyController.contactNo.value.text,
                    propertyNo: widget.locationController.houseNo.value.text,
                    propertyStreet: widget.locationController.area.value.text,
                    propertyLandmark: widget.locationController.landmark.value.text,
                    propertyCity: widget.locationController.city.value.text,
                    propertyState: widget.locationController.state.value.text,
                    propertyPincode: widget.locationController.pincode.value.text,
                    propertyBedrooms: widget.detailController.countBedrooms.value,
                    propertyBathrooms: widget.detailController.countBathrooms.value,
                    propertyBalcony: widget.detailController.countBeds.value,
                    propertyArea: widget.detailController.areaSize.value.text,
                    propertyAreaType: widget.detailController.dropDownValue.value,
                    propertyFurnishing: widget.detailController.furnishing.value,
                    propertyAvailable: widget.detailController.availableFor.value,
                    propertyBuildingFloors: widget.detailController.noOfFloors.value,
                    propertyFloorNo: widget.detailController.floorNo.value,
                    propertyAvailableFrom: widget.detailController.dateCtl.value.text,
                    propertyFacing: widget.detailController.facing.value,
                    propertyImage1: widget.detailController.uploadedImageUrl[0],
                    propertyImage2: widget.detailController.uploadedImageUrl[1],
                    propertyImage3: widget.detailController.uploadedImageUrl[2],
                    propertyImage4: widget.detailController.uploadedImageUrl[3],
                    propertyImage5: widget.detailController.uploadedImageUrl[4],
                    propertyImage6: widget.detailController.uploadedImageUrl[5],
                    propertyImage7: widget.detailController.uploadedImageUrl[6],
                    propertyImage8: widget.detailController.uploadedImageUrl[7],
                    propertyVideo1: widget.detailController.uploadedImageUrl[8],
                    propertyRent: widget.controller.rent.value.text,
                    propertySecurity: widget.controller.security.value.text,
                    propertyMaintenance: widget.controller.maintenance.value.text,
                    propertyMaintenanceType: widget.controller.dropDownValue.value,
                    propertyHighlights: widget.controller.highlights.value.text,
                  );
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(27, 16, 28, 44),
            alignment: Alignment.center,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFB5EB49),
                  Color(0xFF7AA721),
                ],
              ),
            ),
            child: Text(
              widget.homeController.isUpdate.value ? 'Update' : 'Done',
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void saveProperty(
      {int? isHotel,
      String? propertyType,
      String? contactPerson,
      String? contactNumber,
      String? propertyNo,
      String? propertyStreet,
      String? propertyLandmark,
      String? propertyCity,
      String? propertyState,
      String? propertyPincode,
      int? propertyBedrooms,
      int? propertyBathrooms,
      int? propertyBalcony,
      String? propertyArea,
      String? propertyAreaType,
      String? propertyFurnishing,
      String? propertyAvailable,
      int? propertyBuildingFloors,
      int? propertyFloorNo,
      String? propertyAvailableFrom,
      String? propertyFacing,
      String? propertyImage1,
      String? propertyImage2,
      String? propertyImage3,
      String? propertyImage4,
      String? propertyImage5,
      String? propertyImage6,
      String? propertyImage7,
      String? propertyImage8,
      String? propertyVideo1,
      String? propertyRent,
      String? propertySecurity,
      String? propertyMaintenance,
      String? propertyMaintenanceType,
      String? propertyHighlights}) {
    Random random = Random();
    String randomRating = (random.nextDouble() * 5).toStringAsFixed(1);
    String randomRatingCount = (random.nextInt(100) + 50).toStringAsFixed(0);

    widget.controller.savePropertyData({
      "property_type": propertyType,
      "contact_person": contactPerson,
      "contact_number": contactNumber,
      "property_no": propertyNo,
      "property_street": propertyStreet,
      "property_landmark": propertyLandmark,
      "property_city": propertyCity,
      "property_state": propertyState,
      "property_pincode": propertyPincode,
      "property_bedrooms": propertyBedrooms ?? 0,
      "property_bathrooms": propertyBathrooms ?? 0,
      "property_balcony": propertyBalcony ?? 0,
      "property_area": propertyArea ?? '',
      "property_area_type": propertyAreaType ?? '',
      "property_furnishing": propertyFurnishing ?? '',
      "property_available": propertyAvailable ?? '',
      "property_building_floors": propertyBuildingFloors ?? 0,
      "property_floor_no": propertyFloorNo ?? 0,
      "property_available_from": propertyAvailableFrom ?? '',
      "property_facing": propertyFacing ?? '',
      "property_image1": propertyImage1,
      "property_image2": propertyImage2,
      "property_image3": propertyImage3,
      "property_image4": propertyImage4,
      "property_image5": propertyImage5,
      "property_image6": propertyImage6,
      "property_image7": propertyImage7,
      "property_image8": propertyImage8,
      "property_video1": propertyVideo1,
      "property_rent": propertyRent,
      "property_security": propertySecurity ?? '',
      "property_maintenance": propertyMaintenance ?? '',
      "property_maintenance_type": propertyMaintenanceType ?? '',
      "property_highlights": propertyHighlights,
      "is_active": false,
      "rating": randomRating,
      "rating_count": randomRatingCount,
      "property_docId": widget.controller.reference.id,
      "is_hotel": isHotel,
      "is_favorate": false,
    });
    Get.offAll(OwnerHomeView());
  }

  void updateProperty(
      {String? propertyType,
      String? contactPerson,
      String? contactNumber,
      String? propertyNo,
      String? propertyStreet,
      String? propertyLandmark,
      String? propertyCity,
      String? propertyState,
      String? propertyPincode,
      int? propertyBedrooms,
      int? propertyBathrooms,
      int? propertyBalcony,
      String? propertyArea,
      String? propertyAreaType,
      String? propertyFurnishing,
      String? propertyAvailable,
      int? propertyBuildingFloors,
      int? propertyFloorNo,
      String? propertyAvailableFrom,
      String? propertyFacing,
      String? propertyImage1,
      String? propertyImage2,
      String? propertyImage3,
      String? propertyImage4,
      String? propertyImage5,
      String? propertyImage6,
      String? propertyImage7,
      String? propertyImage8,
      String? propertyVideo1,
      String? propertyRent,
      String? propertySecurity,
      String? propertyMaintenance,
      String? propertyMaintenanceType,
      String? propertyHighlights}) {
    widget.controller.updatePropertyData(widget.propertydocId.toString(), data: {
      "property_type": propertyType,
      "contact_person": contactPerson,
      "contact_number": contactNumber,
      "property_no": propertyNo,
      "property_street": propertyStreet,
      "property_landmark": propertyLandmark,
      "property_city": propertyCity,
      "property_state": propertyState,
      "property_pincode": propertyPincode,
      "property_bedrooms": propertyBedrooms ?? 0,
      "property_bathrooms": propertyBathrooms ?? 0,
      "property_balcony": propertyBalcony ?? 0,
      "property_area": propertyArea ?? '',
      "property_area_type": propertyAreaType ?? '',
      "property_furnishing": propertyFurnishing ?? '',
      "property_available": propertyAvailable ?? '',
      "property_building_floors": propertyBuildingFloors ?? 0,
      "property_floor_no": propertyFloorNo ?? 0,
      "property_available_from": propertyAvailableFrom ?? '',
      "property_facing": propertyFacing ?? '',
      "property_image1": propertyImage1,
      "property_image2": propertyImage2,
      "property_image3": propertyImage3,
      "property_image4": propertyImage4,
      "property_image5": propertyImage5,
      "property_image6": propertyImage6,
      "property_image7": propertyImage7,
      "property_image8": propertyImage8,
      "property_video1": propertyVideo1,
      "property_rent": propertyRent,
      "property_security": propertySecurity ?? '',
      "property_maintenance": propertyMaintenance ?? '',
      "property_maintenance_type": propertyMaintenanceType ?? '',
      "property_highlights": propertyHighlights,
    });
    Get.offAll(OwnerHomeView());
  }
  // String contact2='';
  // String name2 = '';
  //
  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance.collection("Registered Users").doc(FirebaseAuth.instance.currentUser!.uid).get().then((value){
  //     contact2 = value["phone_no"];
  //     name2 = value["user_name"];
  //   });
  // }
}
