import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/owner_all_property/all_property_detail_model.dart';

class OwnerAllPropertyController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  RxList<AllPropertyModel> properties = RxList<AllPropertyModel>([]);

  @override
  void onInit() {
    super.onInit();

    collectionReference = firebaseFirestore.collection('Owner New Property');
    properties.bindStream(getPropertyData());
    // properties.bindStream(updatePropertyData());

    // AllPropertyDetailProvider().getAllPropertyDetails().then(
    //   (response) {
    //     change(response, status: RxStatus.success());
    //   },
    //   onError: (error) {
    //     change(
    //       null,
    //       status: RxStatus.error(error.toString()),
    //     );
    //   },
    // );
  }

  Stream<List<AllPropertyModel>> getPropertyData() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) => AllPropertyModel.fromMap(item)).toList());

  Future updatePropertyData(String docId, bool newValue) async {
    try {
      firebaseFirestore
          .collection('Owner New Property')
          .doc(docId)
          .update({'is_active': newValue});
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
