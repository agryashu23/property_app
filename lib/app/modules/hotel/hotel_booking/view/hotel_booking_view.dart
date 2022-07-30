import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/contants/app_constants.dart';
import 'package:property_app/app/modules/hotel/controllers/hotel_controller.dart';
import 'package:property_app/app/modules/hotel/hotel_booking/view/components/hotel_booking_app_bar.dart';
import 'package:property_app/app/modules/hotel/views/hotel_view.dart';
import 'package:property_app/app/contants/app_colors.dart';

class HotelBookingView extends StatelessWidget {
  HotelBookingView({
    Key? key,
    this.propertydocId,
    this.propertyName,
    this.propertyLocation,
    this.rentPrice,
    this.propertyImage1,
    this.bookingDateRange,
    this.rating,
    this.ratingCount,
    this.noOfDays,
    this.noOfGuests,
  }) : super(key: key);

  final String? propertydocId;
  final String? propertyName;
  final String? propertyLocation;
  final String? rentPrice;
  final String? propertyImage1;
  final String? bookingDateRange;
  final String? rating;
  final String? ratingCount;
  final int? noOfDays;
  final int? noOfGuests;

  HotelController controller = Get.put(HotelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HotelBookingAppBar(),
            const SizedBox(height: 24),
            HotelDetailCard(
              propertyImage: propertyImage1,
              propertyRating: rating,
              propertyRatingCount: ratingCount,
              propertyName: propertyName,
              propertyLocation: propertyLocation,
              propertyRent: rentPrice,
            ),
            const SizedBox(height: 24),
            Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your input details',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2,
                          color: Color(0xFF7AA721),
                        ),
                      ),
                    ],
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
                    bookingDateRange!,
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
                    '${noOfGuests} guests',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price details',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Text(
                        'More info',
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2,
                          color: Color(0xFF7AA721),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Staying duration (${noOfDays} days)',
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2,
                          color: Color(0xFF7D7F88),
                        ),
                      ),
                      Text(
                        '₹${rentPrice}',
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
                        '₹200',
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
                        '₹${int.parse(rentPrice!) + 200}',
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
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pay with',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      color: textColorDark,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.credit_card),
                          const SizedBox(width: 12),
                          Text(
                            'Razorpay',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2,
                              color: textColorDark,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          controller.startPaymentOnRazorPay(
                              5000, '9638527410', 'anony@jayx.com');
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
                            'Pay',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 24,
                            width: 24,
                            child: Image.asset('assets/payment/judge.png'),
                          ),
                          const SizedBox(width: 16),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Read other \npolicies',
                                  style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 2,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 51),
            InkWell(
              onTap: () async {
                await controller
                    .getUserDetail(auth.currentUser!.uid);
                await controller.saveBookingRequest(data: {
                  'hotel_name': propertyName,
                  'hotel_location': propertyLocation,
                  'hote_id': propertydocId,
                  'hotel_image': propertyImage1,
                  'hotel_rent': rentPrice,
                  'service_fee': 200,
                  'total_rent_price': int.parse(rentPrice!) + 200,
                  'hotel_rating': rating,
                  'hotel_ratingCount': ratingCount,
                  'booking_date_range': bookingDateRange,
                  'guest_count': noOfGuests,
                  'stay_duration': noOfDays,
                  'user_id': auth.currentUser!.uid,
                  'user_name': controller.userData[0].userName,
                  'user_contact_no': controller.userData[0].phoneNo,
                  'user_email': controller.userData[0].userEmail,
                });
                Get.offAll(HotelView());
              },
              child: Container(
                alignment: Alignment.center,
                height: 48,
                child: Text(
                  'Place booking request',
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
            ),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}

class HotelDetailCard extends StatelessWidget {
  const HotelDetailCard({
    Key? key,
    this.propertyImage,
    this.propertyRating,
    this.propertyRatingCount,
    this.propertyName,
    this.propertyLocation,
    this.propertyRent,
  }) : super(key: key);

  final String? propertyImage;
  final String? propertyRating;
  final String? propertyRatingCount;
  final String? propertyName;
  final String? propertyLocation;
  final String? propertyRent;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            propertyImage!,
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
                            text: '$propertyRating ',
                            style: TextStyle(
                              color: textColorDark,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: '($propertyRatingCount)',
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
                        text: '$propertyName\n',
                        style: TextStyle(
                          color: textColorDark,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: propertyLocation,
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
                        text: '₹$propertyRent ',
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
    );
  }
}
