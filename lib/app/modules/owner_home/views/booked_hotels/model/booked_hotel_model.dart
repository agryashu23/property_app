import 'package:cloud_firestore/cloud_firestore.dart';

class BookedHotelModel {
  String? hotelName;
  String? hotelLocation;
  String? rentPrice;
  String? hotelImage;
  String? bookingDateRange;
  String? hotelId;
  String? rating;
  String? ratingCount;
  String? userId;
  String? userName;
  String? userContactNo;
  String? userEmail;
  int? noOfDays;
  int? noOfGuests;
  int? serviceFee;
  int? totalPrice;

  BookedHotelModel({
    this.hotelName,
    this.userName,
    this.userEmail,
    this.userContactNo,
    this.serviceFee,
    this.hotelLocation,
    this.rentPrice,
    this.totalPrice,
    this.userId,
    this.hotelId,
    this.hotelImage,
    this.bookingDateRange,
    this.rating,
    this.ratingCount,
    this.noOfDays,
    this.noOfGuests,
  });

  BookedHotelModel.fromMap(DocumentSnapshot json) {
    hotelName = json['hotel_name'];
    hotelLocation = json['hotel_location'];
    rentPrice = json['hotel_rent'];
    userId = json['user_id'];
    hotelId = json['hote_id'];
    hotelImage = json['hotel_image'];
    bookingDateRange = json['booking_date_range'];
    rating = json['hotel_rating'];
    ratingCount = json['hotel_ratingCount'];
    noOfDays = json['stay_duration'];
    noOfGuests = json['guest_count'];
    serviceFee = json['service_fee'];
    totalPrice = json['total_rent_price'];
    userName = json['user_name'];
    userContactNo = json['user_contact_no'];
    userEmail = json['user_email'];
  }
}
