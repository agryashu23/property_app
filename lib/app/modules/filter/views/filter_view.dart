import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/models/nav_item.dart';
import 'package:property_app/app/modules/filter/controllers/filter_controller.dart';
import 'package:property_app/app/modules/filter/views/components/filter_app_bar.dart';
import 'package:property_app/app/contants/app_colors.dart';

class FilterView extends GetView<FilterController> {
  FilterView({Key? key}) : super(key: key);
  // RangeValues _currentRangeValues = RangeValues(1200, 3000);
  FilterController controller = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
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
                      color: textColorDark,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    // focusNode: _textFieldFocus,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: '11 Nov - 5 Dec',
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
                      prefixIcon: Icon(Icons.calendar_month_rounded),
                    ),
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
                  color: textColorDark,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            PropertyTypeCategories(),
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
                      '₹${controller.startValue.value.round().toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")} - ₹${controller.endValue.value.round().toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")}+ / month',
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
                    values: RangeValues(
                        controller.startValue.value, controller.endValue.value),
                    min: 1000,
                    max: 10000,
                    divisions: 100,
                    onChanged: (newRangeValue) {
                      controller.startValue.value = newRangeValue.start;
                      controller.endValue.value = newRangeValue.end;
                    },
                  ),
                ],
              ),
            ),
            StayDurationCategories(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Property facilites',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      color: textColorDark,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'See more',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF7AA721),
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            PropertyFacilities(),
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
}

class PropertyTypeCategories extends StatefulWidget {
  const PropertyTypeCategories({super.key});

  @override
  State<PropertyTypeCategories> createState() => _PropertyTypeCategoriesState();
}

class _PropertyTypeCategoriesState extends State<PropertyTypeCategories> {
  List<String> categories = ['Any', 'House', 'Studio', 'Cabin'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 38,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategoryItem(index),
        ),
      ),
    );
  }

  Widget buildCategoryItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        margin: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          gradient: selectedIndex == index
              ? LinearGradient(
                  begin: Alignment(1.0, 1.0),
                  end: Alignment(1.0, -1.0),
                  colors: [
                    Color(0xFFB5EB49),
                    Color(0xFF7AA721),
                  ],
                )
              : LinearGradient(
                  begin: Alignment(1.0, 1.0),
                  end: Alignment(1.0, -1.0),
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFFFFFFF),
                  ],
                ),
          borderRadius: BorderRadius.circular(92),
        ),
        child: Text(
          categories[index],
          style: TextStyle(
            fontSize: 16,
            color:
                selectedIndex == index ? Color(0xFFFDFDFD) : Color(0xFF7D7F88),
          ),
        ),
      ),
    );
  }
}

class StayDurationCategories extends StatefulWidget {
  const StayDurationCategories({super.key});

  @override
  State<StayDurationCategories> createState() => _StayDurationCategoriesState();
}

class _StayDurationCategoriesState extends State<StayDurationCategories> {
  List<String> categories = ['Any', 'Monthly', 'Annually', 'Other'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 38,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategoryItem(index),
        ),
      ),
    );
  }

  Widget buildCategoryItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        margin: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          gradient: selectedIndex == index
              ? LinearGradient(
                  begin: Alignment(1.0, 1.0),
                  end: Alignment(1.0, -1.0),
                  colors: [
                    Color(0xFFB5EB49),
                    Color(0xFF7AA721),
                  ],
                )
              : LinearGradient(
                  begin: Alignment(1.0, 1.0),
                  end: Alignment(1.0, -1.0),
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFFFFFFF),
                  ],
                ),
          borderRadius: BorderRadius.circular(92),
        ),
        child: Text(
          categories[index],
          style: TextStyle(
            fontSize: 16,
            color:
                selectedIndex == index ? Color(0xFFFDFDFD) : Color(0xFF7D7F88),
          ),
        ),
      ),
    );
  }
}

class PropertyFacilities extends StatefulWidget {
  const PropertyFacilities({super.key});

  @override
  State<PropertyFacilities> createState() => _PropertyFacilitiesState();
}

class _PropertyFacilitiesState extends State<PropertyFacilities> {
  List<String> categories = [
    'Any',
    'WiFi',
    'Self check-in',
    'Kitchen',
    'Free parking',
    'Air conditioner',
    'Security'
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Wrap(
        runSpacing: 12.0,
        spacing: 12.0,
        children: [
          buildCategoryItem(0),
          buildCategoryItem(1),
          buildCategoryItem(2),
          buildCategoryItem(3),
          buildCategoryItem(5),
          buildCategoryItem(6),
        ],
      ),
    );
  }

  Widget buildCategoryItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          gradient: selectedIndex == index
              ? LinearGradient(
                  begin: Alignment(1.0, 1.0),
                  end: Alignment(1.0, -1.0),
                  colors: [
                    Color(0xFFB5EB49),
                    Color(0xFF7AA721),
                  ],
                )
              : LinearGradient(
                  begin: Alignment(1.0, 1.0),
                  end: Alignment(1.0, -1.0),
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFFFFFFF),
                  ],
                ),
          borderRadius: BorderRadius.circular(92),
        ),
        child: Text(
          categories[index],
          style: TextStyle(
            fontSize: 16,
            color:
                selectedIndex == index ? Color(0xFFFDFDFD) : Color(0xFF7D7F88),
          ),
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    Key? key,
  }) : super(key: key);

  NavItems _navItemsController = Get.put(NavItems());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 27.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.rotate_left_sharp,
                  color: Color(0xFF7AA721),
                  size: 22,
                ),
                const SizedBox(width: 10),
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
            Container(
              alignment: Alignment.center,
              height: 48,
              width: 156,
              child: Text(
                'Show results',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  begin: Alignment(1.0, 1.0),
                  end: Alignment(1.0, -1.0),
                  colors: [
                    Color(0xFFB5EB49),
                    Color(0xFF7AA721),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
