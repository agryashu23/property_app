class NewProperty {
  int? id;
  String? propertyType;
  String? contactPerson;
  String? contactNumber;
  String? propertyNo;
  String? propertyStreet;
  String? propertyLandmark;
  String? propertyCity;
  String? propertyState;
  String? propertyPincode;
  int? propertyBedrooms;
  int? propertyBathrooms;
  int? propertyBalcony;
  String? propertyArea;
  String? propertyAreaType;
  String? propertyFurnishing;
  String? propertyAvailable;
  int? propertyBuildingFloors;
  int? propertyFloorNo;
  String? propertyAvailableFrom;
  String? propertyFacing;
  String? propertyImage1;
  dynamic propertyImage2;
  dynamic propertyImage3;
  dynamic propertyImage4;
  dynamic propertyImage5;
  dynamic propertyImage6;
  dynamic propertyImage7;
  dynamic propertyImage8;
  dynamic propertyVideo1;
  String? propertyRent;
  dynamic propertySecurity;
  dynamic propertyMaintenance;
  dynamic propertyMaintenanceType;
  String? propertyHighlights;

  NewProperty(
      {this.id,
      this.propertyType,
      this.contactPerson,
      this.contactNumber,
      this.propertyNo,
      this.propertyStreet,
      this.propertyLandmark,
      this.propertyCity,
      this.propertyState,
      this.propertyPincode,
      this.propertyBedrooms,
      this.propertyBathrooms,
      this.propertyBalcony,
      this.propertyArea,
      this.propertyAreaType,
      this.propertyFurnishing,
      this.propertyAvailable,
      this.propertyBuildingFloors,
      this.propertyFloorNo,
      this.propertyAvailableFrom,
      this.propertyFacing,
      this.propertyImage1,
      this.propertyImage2,
      this.propertyImage3,
      this.propertyImage4,
      this.propertyImage5,
      this.propertyImage6,
      this.propertyImage7,
      this.propertyImage8,
      this.propertyVideo1,
      this.propertyRent,
      this.propertySecurity,
      this.propertyMaintenance,
      this.propertyMaintenanceType,
      this.propertyHighlights});

  NewProperty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyType = json['property_type'];
    contactPerson = json['contact_person'];
    contactNumber = json['contact_number'];
    propertyNo = json['property_no'];
    propertyStreet = json['property_street'];
    propertyLandmark = json['property_landmark'];
    propertyCity = json['property_city'];
    propertyState = json['property_state'];
    propertyPincode = json['property_pincode'];
    propertyBedrooms = json['property_bedrooms'];
    propertyBathrooms = json['property_bathrooms'];
    propertyBalcony = json['property_balcony'];
    propertyArea = json['property_area'];
    propertyAreaType = json['property_area_type'];
    propertyFurnishing = json['property_furnishing'];
    propertyAvailable = json['property_available'];
    propertyBuildingFloors = json['property_building_floors'];
    propertyFloorNo = json['property_floor_no'];
    propertyAvailableFrom = json['property_available_from'];
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
    propertyRent = json['property_rent'];
    propertySecurity = json['property_security'];
    propertyMaintenance = json['property_maintenance'];
    propertyMaintenanceType = json['property_maintenance_type'];
    propertyHighlights = json['property_highlights'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['property_type'] = propertyType;
    data['contact_person'] = contactPerson;
    data['contact_number'] = contactNumber;
    data['property_no'] = propertyNo;
    data['property_street'] = propertyStreet;
    data['property_landmark'] = propertyLandmark;
    data['property_city'] = propertyCity;
    data['property_state'] = propertyState;
    data['property_pincode'] = propertyPincode;
    data['property_bedrooms'] = propertyBedrooms;
    data['property_bathrooms'] = propertyBathrooms;
    data['property_balcony'] = propertyBalcony;
    data['property_area'] = propertyArea;
    data['property_area_type'] = propertyAreaType;
    data['property_furnishing'] = propertyFurnishing;
    data['property_available'] = propertyAvailable;
    data['property_building_floors'] = propertyBuildingFloors;
    data['property_floor_no'] = propertyFloorNo;
    data['property_available_from'] = propertyAvailableFrom;
    data['property_facing'] = propertyFacing;
    data['property_image1'] = propertyImage1;
    data['property_image2'] = propertyImage2;
    data['property_image3'] = propertyImage3;
    data['property_image4'] = propertyImage4;
    data['property_image5'] = propertyImage5;
    data['property_image6'] = propertyImage6;
    data['property_image7'] = propertyImage7;
    data['property_image8'] = propertyImage8;
    data['property_video1'] = propertyVideo1;
    data['property_rent'] = propertyRent;
    data['property_security'] = propertySecurity;
    data['property_maintenance'] = propertyMaintenance;
    data['property_maintenance_type'] = propertyMaintenanceType;
    data['property_highlights'] = propertyHighlights;
    return data;
  }
}
