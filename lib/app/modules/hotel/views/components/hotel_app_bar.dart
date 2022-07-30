import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/home/views/profile/profile_view.dart';
import 'package:property_app/app/modules/hotel/hotel_filter/views/hotel_filter_view.dart';
import 'package:property_app/app/modules/login/controllers/login_controller.dart';

class HotelAppBar extends StatefulWidget {
  HotelAppBar({Key? key}) : super(key: key);

  @override
  State<HotelAppBar> createState() => _HotelAppBarState();
}

class _HotelAppBarState extends State<HotelAppBar> {
  String image='';
  // LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 53,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFB5EB49),
              Color(0xFF7AA721),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LoginController().isGuest.value
                ? Container()
                : InkWell(
                    onTap: () {
                      Get.to(ProfileView());
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 10, top: 6, bottom: 5),
                      child: image.isNotEmpty
                          ? CircleAvatar(
                          backgroundImage: NetworkImage(
                              image))
                          : const CircleAvatar(
                        backgroundImage:
                        AssetImage('assets/app/photo.jpeg'),
                      ),
                    ),
                  ),
            Container(
              padding: const EdgeInsets.only(left: 100, top: 10, bottom: 10),
              child: Text(
                'Hotel',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            LoginController().isGuest.value
                ? Container()
                : Padding(
                    padding:
                        const EdgeInsets.only(left: 100, top: 6, bottom: 10),
                    child: IconButton(
                      onPressed: () {
                        Get.to(HotelFilterView());
                      },
                      icon: const Icon(
                        Icons.filter_list,
                        size: 22,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("Registered Users").doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
      setState((){
        image = value['user_profile_image'];
      });
    });
  }
}
