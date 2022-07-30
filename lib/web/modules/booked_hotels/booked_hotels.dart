import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/owner_home/controllers/owner_home_controller.dart';
import 'package:property_app/app/modules/owner_home/views/components/owner_home_app_bar.dart';
import 'package:property_app/app/modules/owner_home/views/owner_home_view.dart';
import 'package:property_app/app/contants/app_colors.dart';

class BookedHotelView extends StatelessWidget {
  BookedHotelView({Key? key}) : super(key: key);

  OwnerHomeController controller = Get.put(OwnerHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: OwnerHomeBottomNavBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const OwnerHomeAppBar(),
          const SizedBox(height: 26),
          Padding(
            padding: EdgeInsets.only(left: 32.5),
            child: Text(
              'Your Booked Hotels',
              style: TextStyle(
                color: textColorDark,
                fontSize: 18,
                letterSpacing: 1.3,
              ),
            ),
          ),
          const SizedBox(height: 15),
          propertyDetailListFirestore(),
          const SizedBox(height: 27),
        ],
      ),
    );
  }

  Widget propertyDetailListFirestore() {
    return GetX<OwnerHomeController>(
      init: Get.put<OwnerHomeController>(OwnerHomeController()),
      builder: (controller) {
        return Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: controller.bookedHotels.length,
            itemBuilder: (context, index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFFFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF7AA721),
                      offset: const Offset(
                        0.0,
                        0.0,
                      ),
                      blurRadius: 0.5,
                    ), //BoxShadow
                    BoxShadow(
                      color: Color(0xFFFFFFFF),
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xFFFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF434343),
                            offset: const Offset(
                              0.0,
                              0.0,
                            ),
                            blurRadius: 0.5,
                          ), //BoxShadow
                          BoxShadow(
                            color: Color(0xFFFFFFFF),
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      height: 160,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            controller.bookedHotels[index].hotelImage!,
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
                                            text:
                                                '${controller.bookedHotels[index].rating} ',
                                            style: TextStyle(
                                              color: textColorDark,
                                              fontSize: 12,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                '(${controller.bookedHotels[index].ratingCount})',
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
                                            '${controller.bookedHotels[index].hotelName}\n',
                                        style: TextStyle(
                                          color: textColorDark,
                                          fontSize: 16,
                                        ),
                                      ),
                                      TextSpan(
                                        text: controller
                                            .bookedHotels[index].hotelLocation,
                                        style: TextStyle(
                                          color: Color(0xFF7D7F88),
                                          fontSize: 13,
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 18),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            '₹${controller.bookedHotels[index].rentPrice} ',
                                        style: TextStyle(
                                          color: textColorDark,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '/ Day',
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
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xFFFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF434343),
                            offset: const Offset(
                              0.0,
                              0.0,
                            ),
                            blurRadius: 0.5,
                          ), //BoxShadow
                          BoxShadow(
                            color: Color(0xFFFDFDFD),
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      height: 230,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Input details',
                            style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 2,
                              color: Color(0xFF000000),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Date',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2,
                              color: textColorDark,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            controller.bookedHotels[index].bookingDateRange!,
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 2,
                              color: Color(0xFF7D7F88),
                            ),
                          ),
                          const SizedBox(height: 26),
                          Text(
                            'Guests count',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2,
                              color: textColorDark,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '${controller.bookedHotels[index].noOfGuests} guests',
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 2,
                              color: Color(0xFF7D7F88),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xFFFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF434343),
                            offset: const Offset(
                              0.0,
                              0.0,
                            ),
                            blurRadius: 0.5,
                          ), //BoxShadow
                          BoxShadow(
                            color: Color(0xFFFDFDFD),
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      height: 310,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User details',
                            style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 2,
                              color: Color(0xFF000000),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'User Name',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2,
                              color: textColorDark,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            controller.bookedHotels[index].userName!,
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 2,
                              color: Color(0xFF7D7F88),
                            ),
                          ),
                          const SizedBox(height: 26),
                          Text(
                            'User Contact No',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2,
                              color: textColorDark,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            controller.bookedHotels[index].userContactNo!,
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 2,
                              color: Color(0xFF7D7F88),
                            ),
                          ),
                          const SizedBox(height: 26),
                          Text(
                            'User Email',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2,
                              color: textColorDark,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            controller.bookedHotels[index].userEmail!,
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 2,
                              color: Color(0xFF7D7F88),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 22,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xFFFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF434343),
                            offset: const Offset(
                              0.0,
                              0.0,
                            ),
                            blurRadius: 0.5,
                          ), //BoxShadow
                          BoxShadow(
                            color: Color(0xFFFDFDFD),
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      height: 189,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price details',
                            style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 2,
                              color: Color(0xFF000000),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Staying duration (${controller.bookedHotels[index].noOfDays} days)',
                                style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 2,
                                  color: Color(0xFF7D7F88),
                                ),
                              ),
                              Text(
                                '₹${controller.bookedHotels[index].rentPrice}',
                                style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 2,
                                  color: textColorDark,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Service fee',
                                style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 2,
                                  color: Color(0xFF7D7F88),
                                ),
                              ),
                              Text(
                                '₹${controller.bookedHotels[index].serviceFee}',
                                style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 2,
                                  color: textColorDark,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total price',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                  color: Color(0xFF000000),
                                ),
                              ),
                              Text(
                                '₹${controller.bookedHotels[index].totalPrice}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                  color: Color(0xFF7AA721),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
