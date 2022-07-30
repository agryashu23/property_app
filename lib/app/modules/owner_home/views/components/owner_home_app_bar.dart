import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/owner_home/views/profile/owner_profile_view.dart';

class OwnerHomeAppBar extends StatefulWidget {
  const OwnerHomeAppBar({Key? key}) : super(key: key);

  @override
  State<OwnerHomeAppBar> createState() => _OwnerHomeAppBarState();
}

class _OwnerHomeAppBarState extends State<OwnerHomeAppBar> {
  String image='';


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 42,
                width: 42,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/app/Image-4.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'House Rent',
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              // Get.to(ProfileView());
            },
            child: InkWell(
              onTap: () {
                Get.to(OwnerProfileView());
              },
              child: SizedBox(
                height: 42,
                width: 42,
                child: Container(
                  height: 80,
                  width: 80,
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
            ),
          ),
        ],
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
