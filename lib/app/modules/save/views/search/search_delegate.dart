import 'package:flutter/material.dart';
import 'package:property_app/app/contants/app_colors.dart';
import 'package:property_app/app/modules/save/model/save_model.dart';

class SaveDataSearch extends SearchDelegate {
  final List<SaveModel> filteredHotels;

  SaveDataSearch(this.filteredHotels);
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
    final suggesstionList = filteredHotels
        .where((p) =>
            p.propertyName!.toLowerCase().contains(query.toLowerCase()) ||
            p.propertyLocation!.toLowerCase().contains(query))
        .toList();
    return HomePropertyList(property: suggesstionList);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggesstionList = filteredHotels
        .where((p) =>
            p.propertyName!.toLowerCase().contains(query.toLowerCase()) ||
            p.propertyLocation!.toLowerCase().contains(query))
        .toList();
    return HomePropertyList(property: suggesstionList);
  }
}

class HomePropertyList extends StatelessWidget {
  final List<SaveModel> property;
  const HomePropertyList({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: property.length,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemBuilder: (context, index) {
        return property.isNotEmpty
            ? Container(
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
                height: 150,
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
                                      text: '(${property[index].ratingCount})',
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
                                      text: property[index].isHotel == 0
                                          ? '/Month'
                                          : '/Day',
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
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const Center(
                child: Text('No Properties Found'),
              );
      },
    );
  }
}
