import 'package:cloud_firestore/cloud_firestore.dart';

class AllPropertyModel {
  String? propertyName;
  String? propertyLocation;
  int? rooms;
  String? area;
  String? rentPrice;
  bool? isActive;
  String? image;
  String? rating;
  String? ratingCount;
  String? propertydocId;

  AllPropertyModel({
    this.propertyName,
    this.propertyLocation,
    this.rooms,
    this.area,
    this.rentPrice,
    this.isActive,
    this.image,
    this.rating,
    this.ratingCount,
    this.propertydocId,
  });

  AllPropertyModel.fromMap(DocumentSnapshot json) {
    propertyName =
        '${json['property_no']}, ${json['property_street']}, \n ${json['property_landmark']}';
    propertyLocation = '${json['property_city']}, ${json['property_state']}';
    rooms = json['property_bedrooms'];
    area = json['property_area'];
    rentPrice = json['property_rent'];
    isActive = json['is_active'];
    image = json['property_image1'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    propertydocId = json['property_docId'];
  }
}
