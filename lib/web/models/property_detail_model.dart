import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyDetailModel {
  String? propertyName;
  String? propertyNo;
  String? propertyStreet;
  String? propertyLandmark;
  String? propertyType;
  String? propertyLocation;
  String? propertyCity;
  String? propertyState;
  String? propertyPincode;
  int? rooms;
  String? area;
  String? areaType;
  String? rentPrice;
  bool? isActive;
  bool? isFavorate;
  String? rating;
  String? ratingCount;
  String? propertydocId;
  int? isHotel;
  String? contactPerson;
  String? contactNumber;
  String? propertyFurnishing;
  String? propertyAvailable;
  String? propertyAvailableFrom;
  int? propertyFloors;
  int? propertyFloorNo;
  String? propertyFacing;
  int? propertyBathrooms;
  int? propertyBalcony;
  String? image;
  String? propertyImage2;
  String? propertyImage3;
  String? propertyImage4;
  String? propertyImage5;
  String? propertyImage6;
  String? propertyImage7;
  String? propertyImage8;
  String? propertyVideo1;
  String? propertyHighlights;
  String? propertySecurity;
  String? propertyMaintenance;
  String? propertyMaintenanceType;

  PropertyDetailModel({
    this.propertyName,
    this.propertyNo,
    this.propertyStreet,
    this.propertyLandmark,
    this.propertyType,
    this.propertyLocation,
    this.propertyCity,
    this.propertyState,
    this.propertyPincode,
    this.rooms,
    this.area,
    this.areaType,
    this.rentPrice,
    this.isActive,
    this.isFavorate,
    this.rating,
    this.ratingCount,
    this.propertydocId,
    this.isHotel,
    this.contactPerson,
    this.contactNumber,
    this.propertyFurnishing,
    this.propertyAvailable,
    this.propertyAvailableFrom,
    this.propertyFloors,
    this.propertyFloorNo,
    this.propertyFacing,
    this.propertyBathrooms,
    this.propertyBalcony,
    this.image,
    this.propertyImage2,
    this.propertyImage3,
    this.propertyImage4,
    this.propertyImage5,
    this.propertyImage6,
    this.propertyImage7,
    this.propertyImage8,
    this.propertyVideo1,
    this.propertyHighlights,
    this.propertySecurity,
    this.propertyMaintenance,
    this.propertyMaintenanceType,
  });

  PropertyDetailModel.fromMap(DocumentSnapshot json) {
    propertyName =
        '${json['property_no']}, ${json['property_street']}, \n ${json['property_landmark']}';

    propertyType = json['property_type'];
    propertyLocation = '${json['property_city']}, ${json['property_state']}';
    propertyNo = json['property_no'];
    propertyStreet = json['property_street'];
    propertyLandmark = json['property_landmark'];
    propertyCity = json['property_city'];
    propertyState = json['property_state'];
    propertyPincode = json['property_pincode'];
    rooms = json['property_bedrooms'];
    area = json['property_area'];
    rentPrice = json['property_rent'];
    isActive = json['is_active'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    propertydocId = json['property_docId'];
    isHotel = json['is_hotel'];
    isFavorate = json['is_favorate'];
    areaType = json['property_area_type'];
    propertyFacing = json['property_facing'];
    image = json['property_image1'];
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
    propertyFloors = json['property_building_floors'];
    propertyFloorNo = json['property_floor_no'];
    propertyAvailableFrom = json['property_available_from'];
    propertySecurity = json['property_security'];
    propertyMaintenance = json['property_maintenance'];
    propertyMaintenanceType = json['property_maintenance_type'];
  }
}
