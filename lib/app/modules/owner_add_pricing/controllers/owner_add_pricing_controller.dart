import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerAddPricingController extends GetxController {
  // Maintenance Charges
  var dropDownValue = 'Monthly'.obs;
  // var isProcessing = false.obs;

  TextEditingController rent = TextEditingController();
  TextEditingController security = TextEditingController();
  TextEditingController maintenance = TextEditingController();
  TextEditingController highlights = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  // Save Owner Property data on firestore
  DocumentReference reference =
      FirebaseFirestore.instance.collection('Owner New Property').doc();

  Future savePropertyData(Map<String, dynamic> data) async {
    try {
      await reference.set(data);
      showSnackBar(
          "New Property", 'New Property Created Successfully', Colors.green);
    } catch (e) {
      showSnackBar("Exception", e.toString(), Colors.red);
    }
  }

  Future updatePropertyData(String docId,
      {required Map<String, dynamic> data}) async {
    print(docId);
    try {
      await FirebaseFirestore.instance.collection('Owner New Property').doc(docId).update(data);
      showSnackBar("Property", 'Property Updated Successfully', Colors.green);
    } catch (e) {
      print(e.toString());
      showSnackBar("Exception", e.toString(), Colors.red);
    }
  }

  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }
}
