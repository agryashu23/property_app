class Property {
  String? propertyImage;
  double? propertyRating;
  int? propertyRatingCount;
  String? propertyName;
  String? propertyLocation;
  int? propertyRoomCount;
  int? propertyArea;
  int? propertyRent;
  Property({
    required this.propertyImage,
    required this.propertyRating,
    required this.propertyRatingCount,
    required this.propertyName,
    required this.propertyLocation,
    required this.propertyRoomCount,
    required this.propertyArea,
    required this.propertyRent,
  });
}

// Demo List
List<Property> propertyItems = [
  Property(
    propertyImage: 'assets/app/Image-9.png',
    propertyRating: 4.8,
    propertyRatingCount: 73,
    propertyName: 'Entire Bromo mountain \nview Cabin in Jakarta',
    propertyLocation: 'Malang Jakarta',
    propertyRoomCount: 2,
    propertyArea: 673,
    propertyRent: 526,
  ),
];
