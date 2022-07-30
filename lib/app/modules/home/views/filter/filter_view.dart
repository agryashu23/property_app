
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:property_app/app/contants/app_colors.dart';
import 'package:property_app/app/modules/filter/views/components/filter_app_bar.dart';
import 'package:property_app/app/modules/home/controllers/home_controller.dart';

class FilterView extends StatefulWidget {
  FilterView({Key? key, required this.value}) : super(key: key);
  final String value;

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterAppBar(),
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
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: controller.dateRange,
                    // focusNode: _textFieldFocus,
                    autofocus: false,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: '11 Nov - 4 Dec',
                      hintStyle: TextStyle(color: Colors.black),

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
                      fillColor: Color(0xFFF2F2F3),
                      filled: true,
                      prefixIcon: Icon(Icons.calendar_month_rounded,color: Colors.black,),
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
                      controller.dateRange.text =
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
                'Property type',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            buildPropertyFacilities(),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Price range',
                style: TextStyle(
                  fontSize: 18,
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
                      '₹${controller.startValue.value.round().toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                              (Match m) => "${m[1]},")} - ₹${controller.endValue.value.round().toStringAsFixed(0).
                      replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")}+ / month',
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  RangeSlider(
                    values: RangeValues(
                        controller.startValue.value, controller.endValue.value),
                    min: 1000,
                    max: 100000,
                    divisions: 100,
                    onChanged: (newRangeValue) {
                      controller.startValue.value = newRangeValue.start;
                      controller.endValue.value = newRangeValue.end;
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
                    countVal: controller.countBedrooms.value,
                    incrementFun: () => controller.incrementBedrooms(),
                    decrementFun: () => controller.decrementBedrooms(),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => buildCounterRow(
                    itemName: 'Bathrooms',
                    countVal: controller.countBathrooms.value,
                    incrementFun: () => controller.incrementBathrooms(),
                    decrementFun: () => controller.decrementBathrooms(),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => buildCounterRow(
                    itemName: 'Beds',
                    countVal: controller.countBeds.value,
                    incrementFun: () => controller.incrementBeds(),
                    decrementFun: () => controller.decrementBeds(),
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
                    countVal: controller.countAdults.value,
                    incrementFun: () => controller.incrementAdults(),
                    decrementFun: () => controller.decrementAdults(),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => buildCounterRow(
                    itemName: 'Children',
                    countVal: controller.countChildren.value,
                    incrementFun: () => controller.incrementChildren(),
                    decrementFun: () => controller.decrementChildren(),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => buildCounterRow(
                    itemName: 'Infants',
                    countVal: controller.countInfants.value,
                    incrementFun: () => controller.incrementInfants(),
                    decrementFun: () => controller.decrementInfants(),
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
                    color: Colors.grey,

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
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: incrementFun,
                  child: Container(
                    color: Colors.grey,
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
          controller.selectedFacilityIndex.value = index;
          controller.facilities.add(categories[index]);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          decoration: BoxDecoration(
            gradient: controller.selectedFacilityIndex.value == index
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
              width: controller.selectedFacilityIndex.value == index ? 0 : 0.8,
            ),
          ),
          child: Text(
            categories[index],
            style: TextStyle(
              fontSize: 16,
              color: controller.selectedFacilityIndex.value == index
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
      decoration: BoxDecoration(
        color: widget.value =="dark"?Colors.black54:Color(0xFFFFFFFF),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                controller.dateRange.clear();
                controller.startValue.value = 1000;
                controller.endValue.value = 10000;
                controller.countBedrooms.value = 0;
                controller.countBeds.value = 0;
                controller.countBathrooms.value = 0;
                controller.countAdults.value = 0;
                controller.countChildren.value = 0;
                controller.countInfants.value = 0;
                controller.selectedFacilityIndex.value = 0;
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
                controller.filterPropertyList();
                Get.back();
                print('FilteredList: ${controller.filterProperties.length}');
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
