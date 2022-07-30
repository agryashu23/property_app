import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_app/app/modules/home/controllers/home_controller.dart';
import 'package:property_app/app/contants/app_colors.dart';

class ChangePersonalDetails extends StatefulWidget {
  ChangePersonalDetails({Key? key}) : super(key: key);

  @override
  State<ChangePersonalDetails> createState() => _ChangePersonalDetailsState();
}

class _ChangePersonalDetailsState extends State<ChangePersonalDetails> {
  HomeController controller = Get.put(HomeController());
  String image='';


  @override
  void initState() {
    super.initState();
// FirebaseFirestore.instance.collection("Registered Users").doc(FirebaseAuth.instance.currentUser!.uid.toString()).get().then((value) {
//   image = value['user_profile_image'];
// });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: Text(
          'Change Personal Details',
          style: TextStyle(
            fontSize: 25,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                    await controller.getProfileImage(ImageSource.gallery,
                        'profile_${controller.userData[0].userId}');
                },
                child: Stack(
                  children: [
                    Obx(
                      () => Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: controller.uploadedImageUrl.isEmpty
                            ? CircleAvatar(
                                minRadius: 150,
                                maxRadius: 150,
                                backgroundImage:
                                    AssetImage('assets/app/photo.jpeg'),
                              )
                            : CircleAvatar(
                                minRadius: 150,
                                maxRadius: 150,
                                backgroundImage: NetworkImage(
                                    controller.uploadedImageUrl.value),
                              ),
                      ),
                    ),
                    controller.uploadedImageUrl.isEmpty?Positioned(
                      top: 200,
                      left: MediaQuery.of(context).size.width / 2 - 170,
                      child: Text('Click to update Image'),
                    ):Positioned(
                      top: 200,
                      left: MediaQuery.of(context).size.width / 2 - 170,
                      child: Text(''),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              personalDetailInputField(
                text: 'Name',
                initText: controller.userData[0].userName!,
                tController: controller.changeName,
              ),
              personalDetailInputField(
                text: 'Email',
                initText: controller.userData[0].userEmail!,
                tController: controller.changeEmail,
              ),
              personalDetailInputField(
                text: 'Mobile No.',
                initText: controller.userData[0].phoneNo.toString(),
                tController: controller.changePhone,
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () async{
                  await controller.updateUserPersonalDetails(
                    name: controller.changeName.text,
                    email: controller.changeEmail.text,
                    image: controller.uploadedImageUrl.value,
                    phone:controller.changePhone.text,
                  );
                  // Get.back();
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(27, 16, 28, 44),
                  alignment: Alignment.center,
                  height: 48,
                  child: Text(
                    'Update Personal Details',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFB5EB49),
                        Color(0xFF7AA721),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column personalDetailInputField({
    required String text,
    required String initText,
    required TextEditingController tController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          child: TextField(
            controller: tController,
            autofocus: false,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFF7AA721),
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFEB5757),
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFF7AA721),
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              fillColor: const Color(0xFFF2F2F3),
              focusColor: const Color(0xFFF2F2F3),
              filled: true,
            ),
          ),
        ),
      ],
    );
  }

}
