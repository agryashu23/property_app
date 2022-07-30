import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/save/model/save_model.dart';

class SaveController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  RxList<SaveModel> favProperties = RxList<SaveModel>([]);

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection('Owner New Property');
    favProperties.bindStream(getFavPropertyData());
  }

  Stream<List<SaveModel>> getFavPropertyData() =>
      collectionReference.snapshots().map((query) => query.docs
          .map((item) => SaveModel.fromMap(item))
          .where((element) =>
              element.isActive == true && element.isFavorate == true)
          .toList());
}
