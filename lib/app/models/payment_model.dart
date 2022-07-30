import 'package:cloud_firestore/cloud_firestore.dart';

class UserPaymentModel {
  String? userId;
  String? userName;
  String? userEmail;
  String? phoneNo;
  String? paymentId;
  String? paymentMode;
  String? paidAmount;
  String? stayDuration;
  String? orderId;
  String? hotelName;
  String? hotelAddress;
  String? walletName;

  UserPaymentModel({
    this.userId,
    this.userName,
    this.userEmail,
    this.phoneNo,
    this.paymentId,
    this.paymentMode,
    this.paidAmount,
    this.stayDuration,
    this.orderId,
    this.hotelName,
    this.hotelAddress,
    this.walletName,
  });

  UserPaymentModel.fromMap(DocumentSnapshot json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    phoneNo = json['user_phone'];
    paymentId = json['user_payment_id'];
    paymentMode = json['user_payment_mode'];
    paidAmount = json['user_payment_amount'];
    stayDuration = json['user_stay_duration'];
    orderId = json['user_order_id'];
    hotelName = json['hotel_name'];
    hotelAddress = json['hotel_address'];
    walletName = json['user_payment_wallet'];
  }
}
