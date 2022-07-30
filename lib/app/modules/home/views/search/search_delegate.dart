import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/home/model/home_model.dart';
import 'package:property_app/app/modules/home/views/components/property_detail.dart';
import 'package:property_app/app/contants/app_colors.dart';

class DataSearch extends SearchDelegate {
  final List<UserHomeModel> filteredContacts;

  DataSearch(this.filteredContacts);
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: searchFieldDecorationTheme,
      textTheme: Theme.of(context).textTheme.copyWith(
        headline6: TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggesstionList = filteredContacts
        .where((p) =>
            p.propertyName!.toLowerCase().contains(query.toLowerCase()) ||
            p.propertyLocation!.toLowerCase().contains(query))
        .toList();
    return HomePropertyList(property: suggesstionList);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggesstionList = filteredContacts
        .where((p) =>
            p.propertyName!.toLowerCase().contains(query.toLowerCase()) ||
            p.propertyLocation!.toLowerCase().contains(query))
        .toList();
    return HomePropertyList(property: suggesstionList);
  }
}

class HomePropertyList extends StatelessWidget {
  final List<UserHomeModel> property;
  const HomePropertyList({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: property.length,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemBuilder: (context, index) {
        return property.isNotEmpty
            ? InkWell(
                onTap: () {
                  Get.to(
                    PropertyDetailScreen(
                      propertydocId: property[index].propertydocId,
                      propertyName: property[index].propertyName,
                      propertyLocation: property[index].propertyLocation,
                      rooms: property[index].rooms,
                      area: property[index].area,
                      areaType: property[index].areaType,
                      rentPrice: property[index].rentPrice,
                      rating: property[index].rating,
                      ratingCount: property[index].ratingCount,
                      contactPerson: property[index].contactPerson,
                      contactNumber: property[index].contactNumber,
                      propertyFurnishing: property[index].propertyFurnishing,
                      propertyAvailable: property[index].propertyAvailable,
                      propertyFacing: property[index].propertyFacing,
                      propertyBathrooms: property[index].propertyBathrooms,
                      propertyBalcony: property[index].propertyBalcony,
                      propertyImage1: property[index].propertyImage1,
                      propertyImage2: property[index].propertyImage2,
                      propertyImage3: property[index].propertyImage3,
                      propertyImage4: property[index].propertyImage4,
                      propertyImage5: property[index].propertyImage5,
                      propertyImage6: property[index].propertyImage6,
                      propertyImage7: property[index].propertyImage7,
                      propertyImage8: property[index].propertyImage8,
                      propertyVideo1: property[index].propertyVideo1,
                      propertyHighlights: property[index].propertyHighlights,
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 29),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xFFFFFFFF),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFF434343),
                        offset: Offset.zero,
                      ),
                    ],
                  ),
                  height: 190,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      property[index].propertyImage1!.isNotEmpty
                          ? Image.network(
                              '${property[index].propertyImage1}',
                              fit: BoxFit.fill,
                              height: 189,
                              width: 108,
                            )
                          : Image.asset(
                              'assets/app/Image-1.png',
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
                                        text: property[index].rating,
                                        style: TextStyle(
                                          color: textColorDark,
                                          fontSize: 12,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '(${property[index].ratingCount})',
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
                                    text: '${property[index].propertyName}\n',
                                    style: TextStyle(
                                      color: textColorDark,
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text: property[index].propertyLocation,
                                    style: TextStyle(
                                      color: Color(0xFF7D7F88),
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 13.5),
                            Row(
                              children: [
                                Icon(
                                  Icons.meeting_room_rounded,
                                  size: 14,
                                  color: Color(0xFF7D7F88),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '${property[index].rooms} room',
                                  style: TextStyle(
                                    color: Color(0xFF7D7F88),
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(width: 13),
                                Icon(
                                  Icons.aspect_ratio_rounded,
                                  size: 14,
                                  color: Color(0xFF7D7F88),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '${property[index].area} ${property[index].areaType}',
                                  style: TextStyle(
                                    color: Color(0xFF7D7F88),
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '₹${property[index].rentPrice}',
                                        style: TextStyle(
                                          color: textColorDark,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '/month',
                                        style: TextStyle(
                                          color: Color(0xFF7D7F88),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 73.5),
                                IconButton(
                                  onPressed: () {
                                    // controller.updateFavProperty(
                                    //     controller
                                    //         .properties[index].propertydocId!,
                                    //     !controller
                                    //         .properties[index].isFavorate!);
                                  },
                                  icon: property[index].isFavorate!
                                      ? Icon(
                                          Icons.favorite,
                                          size: 25,
                                          color: Color(0xFF7AA721),
                                        )
                                      : Icon(
                                          Icons.favorite_border_rounded,
                                          size: 25,
                                          color: Color(0xFF7D7F88),
                                        ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const Center(
                child: Text('No Properties Found'),
              );
      },
    );
  }
}

// class _ContactListItem extends ListTile {
//   _ContactListItem(UserHomeModel contact)
//       : super(
//             title: Text(contact.fullName),
//             subtitle: Text(contact.number),
//             leading: CircleAvatar(child: Text(contact.fullName[0])));
// }
