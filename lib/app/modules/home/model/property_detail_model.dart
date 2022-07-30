import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyDetailModel {
  String? propertyName;
  String? propertyType;
  String? propertyLocation;
  int? rooms;
  String? area;
  String? areaType;
  String? rentPrice;
  bool? isActive;
  String? rating;
  String? ratingCount;
  String? propertydocId;
  int? isHotel;
  String? contactPerson;
  String? contactNumber;
  String? propertyFurnishing;
  String? propertyAvailable;
  String? propertyFacing;
  int? propertyBathrooms;
  int? propertyBalcony;
  String? propertyImage1;
  String? propertyImage2;
  String? propertyImage3;
  String? propertyImage4;
  String? propertyImage5;
  String? propertyImage6;
  String? propertyImage7;
  String? propertyImage8;
  String? propertyVideo1;
  String? propertyHighlights;

  PropertyDetailModel({
    this.propertyName,
    this.propertyType,
    this.propertyLocation,
    this.rooms,
    this.area,
    this.areaType,
    this.rentPrice,
    this.isActive,
    this.rating,
    this.ratingCount,
    this.propertydocId,
    this.isHotel,
    this.contactPerson,
    this.contactNumber,
    this.propertyFurnishing,
    this.propertyAvailable,
    this.propertyFacing,
    this.propertyBathrooms,
    this.propertyBalcony,
    this.propertyImage1,
    this.propertyImage2,
    this.propertyImage3,
    this.propertyImage4,
    this.propertyImage5,
    this.propertyImage6,
    this.propertyImage7,
    this.propertyImage8,
    this.propertyVideo1,
    this.propertyHighlights,
  });

  PropertyDetailModel.fromMap(DocumentSnapshot json) {
    propertyName =
        '${json['property_no']}, ${json['property_street']}, \n ${json['property_landmark']}';
    propertyType = json['property_type'];
    propertyLocation = '${json['property_city']}, ${json['property_state']}';
    rooms = json['property_bedrooms'];
    area = json['property_area'];
    rentPrice = json['property_rent'];
    isActive = json['is_active'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    propertydocId = json['property_docId'];
    isHotel = json['is_hotel'];
    areaType = json['property_area_type'];
    propertyFacing = json['property_facing'];
    propertyImage1 = json['property_image1'];
    propertyImage2 = json['property_image2'];
    propertyImage3 = json['property_image3'];
    propertyImage4 = json['property_image4'];
    propertyImage5 = json['property_image5'];
    propertyImage6 = json['property_image6'];
    propertyImage7 = json['property_image7'];
    propertyImage8 = json['property_image8'];
    propertyVideo1 = json['property_video1'];
    propertyHighlights = json['property_highlights'];
    contactPerson = json['contact_person'];
    contactNumber = json['contact_number'];
    propertyBathrooms = json['property_bathrooms'];
    propertyBalcony = json['property_balcony'];
    propertyFurnishing = json['property_furnishing'];
    propertyAvailable = json['property_available'];
  }
}
