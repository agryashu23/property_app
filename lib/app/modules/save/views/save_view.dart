import 'package:flutter/material.dart';
import 'package:property_app/app/contants/app_colors.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/home/views/home_view.dart';
import 'package:property_app/app/modules/save/views/components/save_app_bar.dart';
import 'package:property_app/app/modules/save/views/search/search_delegate.dart';
import '../controllers/save_controller.dart';

class SaveView extends GetView<SaveController> {
  SaveView({Key? key}) : super(key: key);

  FocusNode _textFieldFocus = FocusNode();

  SaveController controller = Get.put(SaveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeBottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SaveAppBar(),
            const SizedBox(height: 26),
            saveSearchBar(context),
            const SizedBox(height: 38),
            propertyDetailListFirestore(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Container saveSearchBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        focusNode: _textFieldFocus,
        autofocus: false,
        style: TextStyle(color: Colors.black),
        onTap: () {
          showSearch(
              context: context,
              delegate: SaveDataSearch(controller.favProperties));
        },
        decoration: InputDecoration(
          hintText: 'Search saved properties',
          hintStyle: TextStyle(color: Colors.black),

          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(25.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(25.0),
          ),
          fillColor: _textFieldFocus.hasFocus
              ? const Color(0xFFF6FFE4)
              : const Color(0xFFF2F2F3),
          filled: true,
          prefixIcon: Image.asset('assets/home/search-normal.png'),
        ),
      ),
    );
  }

  Widget propertyDetailListFirestore() {
    return GetX<SaveController>(
        init: Get.put<SaveController>(SaveController()),
        builder: (controller) {
          return Flexible(
            fit: FlexFit.loose,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.favProperties.length,
                itemBuilder: (context, index) {
                  return controller.favProperties.isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.symmetric(horizontal: 29),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xFFFFFFFF),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFF434343),
                                offset: Offset.zero,
                              ),
                            ],
                          ),
                          height: 150,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              controller.favProperties[index].propertyImage1!
                                      .isNotEmpty
                                  ? Image.network(
                                      '${controller.favProperties[index].propertyImage1}',
                                      fit: BoxFit.fill,
                                      height: 189,
                                      width: 108,
                                    )
                                  : Image.asset(
                                      'assets/app/Image-1.png',
                                      fit: BoxFit.fill,
                                      height: 189,
                                      width: 108,
                                    ),
                              const SizedBox(width: 16),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 18),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star_rate_rounded,
                                          color: Color(0xFFFFBF75),
                                          size: 12,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: controller
                                                    .favProperties[index]
                                                    .rating,
                                                style: TextStyle(
                                                  color: textColorDark,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    '(${controller.favProperties[index].ratingCount})',
                                                style: TextStyle(
                                                  color: Color(0xFF7D7F88),
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                '${controller.favProperties[index].propertyName}\n',
                                            style: TextStyle(
                                              color: textColorDark,
                                              fontSize: 16,
                                            ),
                                          ),
                                          TextSpan(
                                            text: controller
                                                .favProperties[index]
                                                .propertyLocation,
                                            style: TextStyle(
                                              color: Color(0xFF7D7F88),
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 18),
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    '₹${controller.favProperties[index].rentPrice}',
                                                style: TextStyle(
                                                  color: textColorDark,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: controller
                                                            .favProperties[
                                                                index]
                                                            .isHotel ==
                                                        0
                                                    ? '/Month'
                                                    : '/Day',
                                                style: TextStyle(
                                                  color: Color(0xFF7D7F88),
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : const Center(
                          child: Text('No Properties Found'),
                        );
                }),
          );
        });
  }
}
