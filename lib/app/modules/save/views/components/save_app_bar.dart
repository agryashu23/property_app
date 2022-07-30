import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/home/views/profile/profile_view.dart';

class SaveAppBar extends StatefulWidget {
  const SaveAppBar({Key? key}) : super(key: key);

  @override
  State<SaveAppBar> createState() => _SaveAppBarState();
}

class _SaveAppBarState extends State<SaveAppBar> {
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
            InkWell(
              onTap: () {
                Get.to(ProfileView());
              },
              child: Container(
                padding: const EdgeInsets.only(left: 16, top: 6, bottom: 5),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 135, vertical: 10),
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  String image='';
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
