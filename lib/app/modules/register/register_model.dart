class Register {
  int? id;
  String? userFullName;
  String? userName;
  String? phoneNumber;
  String? password;
  String? aadharNo;
  String? aadharFrontImage;
  String? aadharBackImage;
  String? userType;

  Register(
      {this.id,
      this.userFullName,
      this.userName,
      this.phoneNumber,
      this.password,
      this.aadharNo,
      this.aadharFrontImage,
      this.aadharBackImage,
      this.userType});

  Register.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userFullName = json['user_full_name'];
    userName = json['user_name'];
    phoneNumber = json['phone_number'];
    password = json['user_password'];
    aadharNo = json['aadhar_no'];
    aadharFrontImage = json['aadhar_front_image'];
    aadharBackImage = json['aadhar_back_image'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_full_name'] = userFullName;
    data['user_name'] = userName;
    data['phone_number'] = phoneNumber;
    data['user_password'] = password;
    data['aadhar_no'] = aadharNo;
    data['aadhar_front_image'] = aadharFrontImage;
    data['aadhar_back_image'] = aadharBackImage;
    data['user_type'] = userType;
    return data;
  }
}
