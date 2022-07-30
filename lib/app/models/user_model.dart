import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userId;
  String? userType;
  bool? isUserVerified;
  String? userName;
  String? userEmail;
  String? phoneNo;
  String? aadharNo;
  String? aadharFront;
  String? aadharBack;
  String? profileImage;

  UserModel({
    this.userId,
    this.userType,
    this.isUserVerified,
    this.userName,
    this.userEmail,
    this.phoneNo,
    this.aadharNo,
    this.aadharFront,
    this.aadharBack,
    this.profileImage,
  });

  UserModel.fromMap(DocumentSnapshot json) {
    userId = json['user_id'];
    userType = json['user_type'];
    isUserVerified = json['user_verified'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    phoneNo = json['phone_no'];
    aadharNo = json['aadhar_no'];
    aadharFront = json['aadhar_front_image'];
    aadharBack = json['aadhar_back_image'];
    profileImage = json['user_profile_image'];
  }
}
