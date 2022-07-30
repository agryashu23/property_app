import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/owner_add_location/views/owner_add_location_view.dart';
import 'package:property_app/app/contants/app_colors.dart';
import '../controllers/owner_add_property_controller.dart';

class OwnerAddPropertyView extends GetView<OwnerAddPropertyController> {
  OwnerAddPropertyView({
    this.update,
    this.propertyNo,
    this.propertyStreet,
    this.propertyLandmark,
    this.propertyType,
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
    this.contactPerson,
    this.contactNumber,
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

  OwnerAddPropertyController controller = Get.put(OwnerAddPropertyController());
  final String? propertyNo;
  final bool? update;
  final String? propertyStreet;
  final String? propertyLandmark;
  final String? propertyType;
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
  final String? contactPerson;
  final String? contactNumber;
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
        controller.contactPerson.text = contactPerson!;
        controller.contactNo.text = contactNumber!;
        controller.propertyType.value = propertyType!;
      }
    }
    return Scaffold(
      bottomNavigationBar: buildBottomNavBar(context),
      backgroundColor: bgColorLight,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: bgColorLight,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: textColorDark,
          ),
        ),
        title: Text(
          'Add Basic Details',
          style: TextStyle(
            color: textColorDark,
            fontSize: 25,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                isHotel == 0
                    ? Text(
                        'Property type',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          letterSpacing: 1.3,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : Container(),
                isHotel == 0 ? const SizedBox(height: 20) : Container(),
                isHotel == 0 ? buildPropertyType() : Container(),
                const SizedBox(height: 40),
                Container(
                  child: TextFormField(
                    controller: controller.contactPerson,
                    autofocus: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Contact person shouldn't be empty";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Contact Person Name',
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
                      fillColor: const Color(0xFFF6FFE4),
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Color(0xFF7AA721),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  child: TextFormField(
                    controller: controller.contactNo,
                    autofocus: false,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null) {
                        return "Contact number shouldn't be empty";
                      } else if (value.length < 10 && value.length > 10) {
                        return "Contact number should be 10 digit";
                      } else if (!value.startsWith('9') &&
                          !value.startsWith('8') &&
                          !value.startsWith('7') &&
                          !value.startsWith('6')) {
                        return "Contact number not valid";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Contact Number',
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
                      fillColor: const Color(0xFFF6FFE4),
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.call,
                        color: Color(0xFF7AA721),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPropertyType() {
    List<String> categories = [
      'Apartment/Flat',
      'Independent Floor',
      'Independent House/Villa',
      'PG',
    ];
    return Wrap(
      runSpacing: 12.0,
      spacing: 12.0,
      children: [
        buildPropertyTypeItem(0, categories),
        buildPropertyTypeItem(1, categories),
        buildPropertyTypeItem(2, categories)
      ],
    );
  }

  Widget buildPropertyTypeItem(int index, List<String> categories) {
    if (update != null) {
      if (update!) {
        controller.selectedPropertyTypeIndex.value =
            categories.indexOf(controller.propertyType.value);
      }
    }
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.selectedPropertyTypeIndex.value = index;
          controller.propertyType.value = categories[index];
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          decoration: BoxDecoration(
            gradient: controller.selectedPropertyTypeIndex.value == index
                ? const LinearGradient(
                    begin: Alignment(1.0, 1.0),
                    end: Alignment(1.0, -1.0),
                    colors: [
                      Color(0xFFB5EB49),
                      Color(0xFF7AA721),
                    ],
                  )
                : const LinearGradient(
                    colors: [
                      Color(0xFFF2F2F3),
                      Color(0xFFF2F2F3),
                    ],
                  ),
            borderRadius: BorderRadius.circular(92),
            border: Border.all(
              color: borderColor,
              width:
                  controller.selectedPropertyTypeIndex.value == index ? 0 : 0.8,
            ),
          ),
          child: Text(
            categories[index],
            style: TextStyle(
              fontSize: 16,
              color: controller.selectedPropertyTypeIndex.value == index
                  ? const Color(0xFFFDFDFD)
                  : const Color(0xFF7D7F88),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavBar(BuildContext context) {
    return InkWell(
      onTap: () {
        if (controller.formKey.currentState!.validate()) {
          print(isHotel);
          Get.to(
            OwnerAddLocationView(
              update: update,
              propertyNo: propertyNo,
              propertyStreet: propertyStreet,
              propertyLandmark: propertyLandmark,
              propertyCity: propertyCity,
              propertyState: propertyState,
              propertyPincode: propertyPincode,
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
