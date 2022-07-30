import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerAddPropertyController extends GetxController {
  TextEditingController contactPerson = TextEditingController();
  TextEditingController contactNo = TextEditingController();

  var propertyType = ''.obs;
  var selectedPropertyTypeIndex = 0.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
