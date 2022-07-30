import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_app/app/modules/owner_add_pricing/views/owner_add_pricing_view.dart';
import '../controllers/owner_add_details_controller.dart';
import 'package:property_app/app/contants/app_colors.dart';

class OwnerAddDetailsView extends GetView<OwnerAddDetailsController> {
  OwnerAddDetailsView({
    this.update,
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

  @override
  final OwnerAddDetailsController controller =
  Get.put(OwnerAddDetailsController());

  final floors = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final floor = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  final int? rooms;
  final bool? update;
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
        controller.countBedrooms.value = rooms!;
        controller.countBathrooms.value = propertyBathrooms!;
        controller.countBeds.value = propertyBalcony!;
        controller.areaSize.text = area!;
        controller.dropDownValue.value = areaType!;
        controller.furnishing.value = propertyFurnishing!;
        controller.availableFor.value = propertyAvailable!;
        controller.noOfFloors.value = propertyFloors!;
        controller.floorNo.value = propertyFloorNo!;
        controller.dateCtl.text = propertyAvailableFrom!;
        controller.facing.value = propertyFacing!;
        controller.uploadedImageUrl[0] = propertyImage1!;
        controller.uploadedImageUrl[1] = propertyImage2!;
        controller.uploadedImageUrl[2] = propertyImage3!;
        controller.uploadedImageUrl[3] = propertyImage4!;
        controller.uploadedImageUrl[4] = propertyImage5!;
        controller.uploadedImageUrl[5] = propertyImage6!;
        controller.uploadedImageUrl[6] = propertyImage7!;
        controller.uploadedImageUrl[7] = propertyImage8!;
        controller.uploadedImageUrl[8] = propertyVideo1!;
      }
    }
    return Scaffold(
      bottomNavigationBar: buildBottomNavBar(context),
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
          'Add Property Details',
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              isHotel == 0
                  ? Text(
                'Room Details, Furnishing etc.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.w400,
                ),
              )
                  : Container(),
              const SizedBox(height: 16),
              isHotel == 0
                  ? Text(
                'Rooms and beds',
                style: TextStyle(
                  fontSize: 18,

                  letterSpacing: 1.3,
                  fontWeight: FontWeight.w400,
                ),
              )
                  : Container(),
              isHotel == 0 ? const SizedBox(height: 23.5) : Container(),
              isHotel == 0
                  ? Column(
                children: [
                  Obx(
                        () =>
                        buildCounterRow(
                          itemName: 'Bedrooms',
                          countVal: controller.countBedrooms.value,
                          incrementFun: () => controller.incrementBedrooms(),
                          decrementFun: () => controller.decrementBedrooms(),
                        ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                        () =>
                        buildCounterRow(
                          itemName: 'Bathrooms',
                          countVal: controller.countBathrooms.value,
                          incrementFun: () => controller.incrementBathrooms(),
                          decrementFun: () => controller.decrementBathrooms(),
                        ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                        () =>
                        buildCounterRow(
                          itemName: 'No. of Balconies',
                          countVal: controller.countBeds.value,
                          incrementFun: () => controller.incrementBeds(),
                          decrementFun: () => controller.decrementBeds(),
                        ),
                  ),
                ],
              )
                  : Container(),
              isHotel == 0 ? const SizedBox(height: 29.5) : Container(),
              isHotel == 0
                  ? const Text(
                'Plot Area Size',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF393E48),
                  letterSpacing: 2,
                ),
              )
                  : Container(),
              const SizedBox(height: 8),
              isHotel == 0
                  ? TextField(
                controller: controller.areaSize,
                autofocus: false,
                keyboardType: TextInputType.number,
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
                  suffixIconConstraints: const BoxConstraints(
                    minHeight: 56,
                  ),
                  suffixIcon: textFieldWithDropDown(),
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black12
                  ),
                ),
              )
                  : Container(),
              isHotel == 0 ? const SizedBox(height: 26) : Container(),
              isHotel == 0
                  ? Text(
                'Furnishing Details',
                style: TextStyle(
                  fontSize: 18,

                  letterSpacing: 1.3,
                  fontWeight: FontWeight.w400,
                ),
              )
                  : Container(),
              isHotel == 0 ? const SizedBox(height: 20) : Container(),
              isHotel == 0 ? buildFurnishingDetails() : Container(),
              isHotel == 0 ? const SizedBox(height: 26) : Container(),
              isHotel == 0
                  ? Text(
                'Available For',
                style: TextStyle(
                  fontSize: 18,

                  letterSpacing: 1.3,
                  fontWeight: FontWeight.w400,
                ),
              )
                  : Container(),
              isHotel == 0 ? const SizedBox(height: 20) : Container(),
              isHotel == 0 ? buildAvailabity() : Container(),
              isHotel == 0 ? const SizedBox(height: 26) : Container(),
              isHotel == 0
                  ? Text(
                'Floor Details',
                style: TextStyle(
                  fontSize: 18,

                  letterSpacing: 1.3,
                  fontWeight: FontWeight.w400,
                ),
              )
                  : Container(),
              isHotel == 0 ? const SizedBox(height: 25) : Container(),
              isHotel == 0
                  ? const Text(
                'Total no. of floor in Building',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF7D7F88),
                  letterSpacing: 2,
                ),
              )
                  : Container(),
              const SizedBox(height: 8),
              isHotel == 0
                  ? DropdownButtonFormField<int>(
                items: floors.map((int floors) {
                  return DropdownMenuItem<int>(
                    value: floors,
                    child: Text(floors.toString()),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  controller.noOfFloors.value = newValue!;
                },
                isDense: true,
                style: const TextStyle(
                  color: Color(0xFF7D7F88),
                ),
                value: controller.noOfFloors.value,
                decoration: InputDecoration(
                  hintText: 'Select Total Floors',
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
                ),
              )
                  : Container(),
              isHotel == 0 ? const SizedBox(height: 25) : Container(),
              isHotel == 0
                  ? const Text(
                'Floor no. of your property',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF7D7F88),
                  letterSpacing: 2,
                ),
              )
                  : Container(),
              const SizedBox(height: 8),
              isHotel == 0
                  ? DropdownButtonFormField<int>(
                items: floor.map((int floor) {
                  return DropdownMenuItem<int>(
                    value: floor,
                    child: Text(floor.toString()),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  controller.floorNo.value = newValue!;
                },
                isDense: true,
                style: const TextStyle(
                  color: Color(0xFF7D7F88),
                ),
                value: controller.floorNo.value,
                decoration: InputDecoration(
                  hintText: 'Propety on Floor',
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
                ),
              )
                  : Container(),
              isHotel == 0 ? const SizedBox(height: 26) : Container(),
              isHotel == 0
                  ? Text(
                'Available From',
                style: TextStyle(
                  fontSize: 18,

                  letterSpacing: 2,
                ),
              )
                  : Container(),
              const SizedBox(height: 8),
              isHotel == 0
                  ? TextField(
                controller: controller.dateCtl,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF7AA721),
                      width: 0.8,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  hintText: '28/04/2023',
                  fillColor: const Color(0xFFF2F2F3),
                  filled: true,
                  suffixIconConstraints: const BoxConstraints(
                    minHeight: 56,
                  ),
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  hintStyle: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(color: Colors.black),
                onTap: () async {
                  DateTime? date = DateTime(1900);
                  final DateFormat formater = DateFormat('dd/MM/yyyy');
                  FocusScope.of(context).requestFocus(FocusNode());

                  date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));

                  controller.dateCtl.text =
                      formater.format(date!).toString();
                },
              )
                  : Container(),
              isHotel == 0 ? const SizedBox(height: 26) : Container(),
              isHotel == 0
                  ? RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Propety Facing ',
                      style: TextStyle(

                        fontSize: 18,
                        letterSpacing: 1.3,
                      ),
                    ),
                    TextSpan(
                      text: '(optional)',
                      style: TextStyle(
                        color: Color(0xFF7D7F88),
                        fontSize: 18,
                        letterSpacing: 1.3,
                      ),
                    ),
                  ],
                ),
              )
                  : Container(),
              isHotel == 0 ? const SizedBox(height: 21) : Container(),
              isHotel == 0 ? buildFacing() : Container(),
              isHotel == 0 ? const SizedBox(height: 26) : Container(),
              Text(
                'Propety Photo',
                style: TextStyle(
                  fontSize: 20,

                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 18),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildImagePickerBox('Image1', 0,context),
                      buildImagePickerBox('Image2', 1,context),
                      buildImagePickerBox('Image3', 2,context),
                      buildImagePickerBox('Image4', 3,context),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildImagePickerBox('Image5', 4,context),
                      buildImagePickerBox('Image6', 5,context),
                      buildImagePickerBox('Image7', 6,context),
                      buildImagePickerBox('Image8', 7,context),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 26),
              Text(
                'Propety Video',
                style: TextStyle(
                  fontSize: 18,

                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 8),
              buildVideoPicker('propertyVideo', 8),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildVideoPicker(String fileName, int index) {
    return TextField(
      controller: controller.propertyVideo,
      autofocus: false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF7AA721),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF7AA721),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        fillColor: const Color(0xFFF2F2F3),
        filled: true,
        suffixIconConstraints: const BoxConstraints(
          minHeight: 56,
        ),
        suffixIcon: GestureDetector(
          onTap: () async {
            await controller.getPropertyVideo(
                ImageSource.gallery, fileName, index);
            print(controller.uploadedImageUrl[index]);
            controller.propertyVideo.text = controller.selectedImagePath.value;
          },
          child: Container(
            alignment: Alignment.center,
            width: 96,
            decoration: const BoxDecoration(
              color: Color(0xFF292D32),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Text(
              'Upload',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
        hintText: "Upload propety video",
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget buildImagePickerBox(String fileName, int index,BuildContext context) {
    return Obx(
          () =>
          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: new Icon(Icons.image),
                          title: new Text('Gallery',style: TextStyle(color: Colors.black),),
                          onTap: () async {
                            await controller.getPropertyImage(
                                ImageSource.gallery, fileName, index);
                            print(controller.uploadedImageUrl[index]);
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: new Icon(Icons.camera_alt),
                          title: new Text('Camera',style: TextStyle(color: Colors.black),),
                          onTap: ()async {
                            await controller.getPropertyImage(
                                ImageSource.camera, fileName, index);
                            print(controller.uploadedImageUrl[index]);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });

            },
            child: Container(
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
              child: controller.uploadedImageUrl[index].isEmpty
                  ? const Icon(
                Icons.add,
                color: Color(0xFF7AA721),
              )
                  : Image.network(
                '${controller.uploadedImageUrl[index]}',
                fit: BoxFit.cover,
              ),
            ),
          ),
    );
  }

  Container textFieldWithDropDown() {
    var items = [
      'sq.ft.',
      'sq.mt.',
      'sq.yd.',
    ];
    return Container(
      alignment: Alignment.center,
      width: 96,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F3),
        border: Border.all(
          color: const Color(0xFF7AA721),
          width: 0.8,
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Obx(
            () =>
            DropdownButtonHideUnderline(
              child: DropdownButton(
                elevation: 0,
                style: TextStyle(color: Colors.black),
                value: controller.dropDownValue.value,
                items: items.map((String items) {
                  return DropdownMenuItem<String>(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  controller.dropDownValue.value = newValue!;
                },
              ),
            ),
      ),
    );
  }

  Container buildCounterRow({required String itemName,
    required int countVal,
    required VoidCallback incrementFun,
    required var decrementFun}) {
    return Container(
      child: Row(
        children: [
          Text(
            itemName,
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: 2,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: decrementFun,
                  child: Container(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                        'assets/filter/ic_remove_circle_outline.png'),
                  ),
                ),
                const Spacer(),
                Text(
                  '$countVal',
                  style: TextStyle(
                    fontSize: 18,

                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: incrementFun,
                  child: Container(
                    height: 35,
                    width: 35,
                    child:
                    Image.asset('assets/filter/ic_add_circle_outline.png'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFurnishingDetails() {
    List<String> categories = [
      'Unfurnished',
      'Semi-furnished',
      'Fullyfurnished'
    ];
    return Wrap(
      runSpacing: 12.0,
      spacing: 12.0,
      children: [
        buildCategoryItem(0, categories),
        buildCategoryItem(1, categories),
        buildCategoryItem(2, categories)
      ],
    );
  }

  Widget buildCategoryItem(int index, List<String> categories) {
    return Obx(
          () =>
          GestureDetector(
            onTap: () {
              controller.selectedFurnishingIndex.value = index;
              controller.furnishing.value = categories[index];
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                gradient: controller.selectedFurnishingIndex.value == index
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
                  controller.selectedFurnishingIndex.value == index ? 0 : 0.8,
                ),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  fontSize: 16,
                  color: controller.selectedFurnishingIndex.value == index
                      ? const Color(0xFFFDFDFD)
                      : const Color(0xFF7D7F88),
                ),
              ),
            ),
          ),
    );
  }

  Widget buildAvailabity() {
    List<String> categories = [
      'Family',
      'Single Men',
      'Single Woman',
    ];
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) =>
            buildAvailabilityItem(index, categories),
      ),
    );
  }

  Widget buildAvailabilityItem(int index, List<String> categories) {
    return Obx(
          () =>
          GestureDetector(
            onTap: () {
              controller.selectedAvailableIndex.value = index;
              controller.availableFor.value = categories[index];
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                gradient: controller.selectedAvailableIndex.value == index
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
                  width: controller.selectedAvailableIndex.value == index
                      ? 0
                      : 0.8,
                ),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  fontSize: 16,
                  color: controller.selectedAvailableIndex.value == index
                      ? const Color(0xFFFDFDFD)
                      : const Color(0xFF7D7F88),
                ),
              ),
            ),
          ),
    );
  }

  Widget buildFacing() {
    List<String> categories = [
      'East',
      'West',
      'North',
      'South',
    ];
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildFacingItem(index, categories),
      ),
    );
  }

  Widget buildFacingItem(int index, List<String> categories) {
    return Obx(
          () =>
          GestureDetector(
            onTap: () {
              controller.selectedFacingIndex.value = index;
              controller.facing.value = categories[index];
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                gradient: controller.selectedFacingIndex.value == index
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
                  width: controller.selectedFacingIndex.value == index
                      ? 0
                      : 0.8,
                ),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  fontSize: 16,
                  color: controller.selectedFacingIndex.value == index
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
        if (controller.uploadedImageUrl.isEmpty) {
          Get.showSnackbar(
            const GetSnackBar(
              title: 'Atleast 1 image required to proceed',
            ),
          );
        } else {
          print(isHotel);
          Get.to(
            OwnerAddPricingView(
              update: update,
              rentPrice: rentPrice,
              isActive: isActive,
              rating: rating,
              ratingCount: ratingCount,
              propertydocId: propertydocId,
              isHotel: isHotel,
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
        width: MediaQuery
            .of(context)
            .size
            .width,
        padding: const EdgeInsets.symmetric(horizontal: 27.0),
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.fromLTRB(27, 16, 28, 44),
            alignment: Alignment.center,
            height: 48,
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
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
          ),
        ),
      ),
    );
  }
}


