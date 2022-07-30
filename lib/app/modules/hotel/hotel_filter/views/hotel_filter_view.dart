import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:property_app/app/modules/hotel/controllers/hotel_controller.dart';
import 'package:property_app/app/modules/hotel/hotel_filter/views/components/hotel_filter_app_bar.dart';
import 'package:property_app/app/contants/app_colors.dart';

class HotelFilterView extends StatelessWidget {
  HotelFilterView({Key? key}) : super(key: key);
  // RangeValues _currentRangeValues = RangeValues(1200, 3000);
  @override
  // HotelFilterController controller = Get.put(HotelFilterController());
  HotelController hotelController = Get.put(HotelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HotelFilterAppBar(),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How long do you want to stay?',
                    style: TextStyle(
                      fontSize: 18,
                      color: textColorDark,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: hotelController.dateRange,
                    autofocus: false,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: '11 Nov - 12 Nov',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: borderColor,
                          width: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(94),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: borderColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      fillColor: const Color(0xFFF2F2F3),
                      filled: true,
                      prefixIcon: const Icon(Icons.calendar_month_rounded),
                    ),
                    onTap: () async {
                      final DateFormat formater = DateFormat('d MMM');
                      FocusScope.of(context).requestFocus(FocusNode());

                      DateTimeRange? date = await showDateRangePicker(
                          context: context,
                          initialDateRange: DateTimeRange(
                            start: DateTime.now(),
                            end: DateTime.now().add(
                              const Duration(days: 1),
                            ),
                          ),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          builder: (context, child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            primaryColor: Colors.red, //Head background
                            dialogBackgroundColor: Colors.white, //Background color
                          ),
                          child: child!,
                        );
                      },

                      );


                      hotelController.dateRange.text =
                          '${(formater.format(date!.start).toString())} - ${(formater.format(date.end).toString())}';
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Hotel facilities',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 10),
            buildPropertyFacilities(),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Price range',
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '₹${hotelController.startValue.value.round().toStringAsFixed(0).replaceAllMapped(
                          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")} - ₹${hotelController.endValue.value.round().toStringAsFixed(0).replaceAllMapped(
                          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")}+ / day',
                      style: TextStyle(
                        fontSize: 18,
                        color: textColorDark,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  RangeSlider(
                    values: RangeValues(hotelController.startValue.value,
                        hotelController.endValue.value),
                    min: 1000,
                    max: 100000,
                    divisions: 100,
                    onChanged: (newRangeValue) {
                      hotelController.startValue.value = newRangeValue.start;
                      hotelController.endValue.value = newRangeValue.end;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Rooms and beds',
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 23.5),
            Column(
              children: [
                Obx(
                  () => buildCounterRow(
                    itemName: 'Bedrooms',
                    countVal: hotelController.countBedrooms.value,
                    incrementFun: () => hotelController.incrementBedrooms(),
                    decrementFun: () => hotelController.decrementBedrooms(),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => buildCounterRow(
                    itemName: 'Bathrooms',
                    countVal: hotelController.countBathrooms.value,
                    incrementFun: () => hotelController.incrementBathrooms(),
                    decrementFun: () => hotelController.decrementBathrooms(),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => buildCounterRow(
                    itemName: 'Beds',
                    countVal: hotelController.countBeds.value,
                    incrementFun: () => hotelController.incrementBeds(),
                    decrementFun: () => hotelController.decrementBeds(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 39.5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'How many guests coming?',
                style: TextStyle(
                  fontSize: 18,
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 23.5),
            Column(
              children: [
                Obx(
                  () => buildCounterRow(
                    itemName: 'Adults',
                    countVal: hotelController.countAdults.value,
                    incrementFun: () => hotelController.incrementAdults(),
                    decrementFun: () => hotelController.decrementAdults(),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => buildCounterRow(
                    itemName: 'Children',
                    countVal: hotelController.countChildren.value,
                    incrementFun: () => hotelController.incrementChildren(),
                    decrementFun: () => hotelController.decrementChildren(),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => buildCounterRow(
                    itemName: 'Infants',
                    countVal: hotelController.countInfants.value,
                    incrementFun: () => hotelController.incrementInfants(),
                    decrementFun: () => hotelController.decrementInfants(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 39),
          ],
        ),
      ),
    );
  }

  Container buildCounterRow(
      {required String itemName,
      required int countVal,
      required VoidCallback incrementFun,
      required var decrementFun}) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 13.5),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              itemName,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF7D7F88),
                letterSpacing: 2,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Spacer(),
          Expanded(
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
                Spacer(),
                Text(
                  '$countVal',
                  style: TextStyle(
                    fontSize: 18,
                    color: textColorDark,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
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

  Widget buildPropertyFacilities() {
    List<String> categories = [
      'Family',
      'Couple',
      'Group booking',
      'Single',
    ];
    return Wrap(
      runSpacing: 12.0,
      spacing: 12.0,
      children: [
        buildFacilityItem(0, categories),
        buildFacilityItem(1, categories),
        buildFacilityItem(2, categories),
        buildFacilityItem(3, categories),
      ],
    );
  }

  Widget buildFacilityItem(int index, List<String> categories) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          hotelController.selectedFacilityIndex.value = index;
          hotelController.facilities.add(categories[index]);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          decoration: BoxDecoration(
            gradient: hotelController.selectedFacilityIndex.value == index
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
              width: hotelController.selectedFacilityIndex.value == index
                  ? 0
                  : 0.8,
            ),
          ),
          child: Text(
            categories[index],
            style: TextStyle(
              fontSize: 16,
              color: hotelController.selectedFacilityIndex.value == index
                  ? const Color(0xFFFDFDFD)
                  : const Color(0xFF7D7F88),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavBar(BuildContext context) {
    return Container(
      height: 108,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 27.0),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                hotelController.dateRange.clear();
                hotelController.startValue.value = 1000;
                hotelController.endValue.value = 10000;
                hotelController.countBedrooms.value = 0;
                hotelController.countBeds.value = 0;
                hotelController.countBathrooms.value = 0;
                hotelController.countAdults.value = 0;
                hotelController.countChildren.value = 0;
                hotelController.countInfants.value = 0;
                hotelController.selectedFacilityIndex.value = 0;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.rotate_left_sharp,
                    color: Color(0xFF7AA721),
                    size: 22,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Reset all',
                    style: TextStyle(
                      color: Color(0xFF7D7F88),
                      fontSize: 18,
                      letterSpacing: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                hotelController.filterPropertyList();
                Get.back();
                print(
                    'FilteredList: ${hotelController.filterProperties.length}');
              },
              child: Container(
                alignment: Alignment.center,
                height: 48,
                width: 156,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                    begin: Alignment(1.0, 1.0),
                    end: Alignment(1.0, -1.0),
                    colors: [
                      Color(0xFFB5EB49),
                      Color(0xFF7AA721),
                    ],
                  ),
                ),
                child: const Text(
                  'Show results',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
