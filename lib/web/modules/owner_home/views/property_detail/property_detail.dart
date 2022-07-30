import 'package:property_app/app/contants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/web/modules/owner_home/controllers/admin_home_controller.dart';

class OwnerPropertyDetailScreen extends StatelessWidget {
   OwnerPropertyDetailScreen({
    required this.controller,
    Key? key,
  }) : super(key: key);

  AdminHomeController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Property Detail Section',
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Property Basic Details',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Property type',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(controller.propertyDetail[0].propertyType!),
              const SizedBox(height: 15),
              Text(
                'Contact Person Name',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(controller.propertyDetail[0].contactPerson!),
              const SizedBox(height: 15),
              Text(
                'Contact Number',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(controller.propertyDetail[0].contactNumber!),
              const SizedBox(height: 20),
              Text(
                'Property Location Details',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Flat, House no., villa no., PG no.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(controller.propertyDetail[0].propertyNo!),
              const SizedBox(height: 15),
              Text(
                'Area, Colony, Street, Sector, Village',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(controller.propertyDetail[0].propertyStreet!),
              const SizedBox(height: 15),
              Text(
                'Landmark',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(controller.propertyDetail[0].propertyLandmark!),
              const SizedBox(height: 15),
              Text(
                'Town/City',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(controller.propertyDetail[0].propertyCity!),
              const SizedBox(height: 15),
              Text(
                'State',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(controller.propertyDetail[0].propertyState!),
              const SizedBox(height: 15),
              Text(
                'Pin Code',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(controller.propertyDetail[0].propertyPincode!),
              const SizedBox(height: 20),
              Text(
                'Property Other Details',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Bedrooms',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(controller.propertyDetail[0].rooms.toString()),
              const SizedBox(height: 15),
              Text(
                'Bathrooms',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(
                  controller.propertyDetail[0].propertyBathrooms.toString()),
              const SizedBox(height: 15),
              Text(
                'No. Of Balconies',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(
                  controller.propertyDetail[0].propertyBalcony.toString()),
              const SizedBox(height: 15),
              Text(
                'Furnishing Details',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(
                  controller.propertyDetail[0].propertyFurnishing!),
              const SizedBox(height: 15),
              Text(
                'Available For',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(
                  controller.propertyDetail[0].propertyAvailable!),
              const SizedBox(height: 15),
              Text(
                'Total No. of floors in building',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(
                  controller.propertyDetail[0].propertyFloors.toString()),
              const SizedBox(height: 15),
              Text(
                'Floor no. of your property',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(
                  controller.propertyDetail[0].propertyFloorNo.toString()),
              const SizedBox(height: 15),
              Text(
                'Available From',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(
                  controller.propertyDetail[0].propertyAvailableFrom!),
              const SizedBox(height: 15),
              Text(
                'Property Facing',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(controller.propertyDetail[0].propertyFacing!),
              const SizedBox(height: 15),
              Text(
                'Property Photo',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildImagePickerBox(controller.propertyDetail[0].image),
                      buildImagePickerBox(
                          controller.propertyDetail[0].propertyImage2),
                      buildImagePickerBox(
                          controller.propertyDetail[0].propertyImage3),
                      buildImagePickerBox(
                          controller.propertyDetail[0].propertyImage4),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildImagePickerBox(
                          controller.propertyDetail[0].propertyImage5),
                      buildImagePickerBox(
                          controller.propertyDetail[0].propertyImage6),
                      buildImagePickerBox(
                          controller.propertyDetail[0].propertyImage7),
                      buildImagePickerBox(
                          controller.propertyDetail[0].propertyImage8),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Property Pricing Details',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Monthly Rent',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(controller.propertyDetail[0].rentPrice!),
              const SizedBox(height: 15),
              Text(
                'Security Deposit',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(controller.propertyDetail[0].propertySecurity!),
              const SizedBox(height: 15),
              Text(
                'Maintenance Charges',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(
                  controller.propertyDetail[0].propertyMaintenance!),
              const SizedBox(height: 15),
              Text(
                'Property Highlights',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildPropertyInfo(
                  controller.propertyDetail[0].propertyHighlights!),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPropertyInfo(String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 18,
        color: textColorDark,
        letterSpacing: 1.3,
      ),
    );
  }

  Widget buildImagePickerBox(String? imageUrl) {
    print(imageUrl);
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F3),
        border: Border.all(
          width: 1,
          color: const Color(0xFF7AA721),
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: imageUrl!.isEmpty
          ? const Icon(
              Icons.question_mark,
              color: Color(0xFF7AA721),
            )
          : Image.network(
              '$imageUrl',
              fit: BoxFit.fill,
            ),
    );
  }
}
