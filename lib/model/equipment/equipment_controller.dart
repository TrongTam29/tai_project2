import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/model/equipment/equipment_model.dart';

class EquipmentController extends GetxController {
  CollectionReference _equipmentCollection =
      FirebaseFirestore.instance.collection("WorkoutEquipment");

  RxList<Equipment> equipmentList = RxList<Equipment>([]);

  void getEquipments() {
    equipmentList.bindStream(_equipmentCollection
        .snapshots()
        .map((query) => query.docs.map((e) => Equipment.fromJson(e)).toList()));
  }
}
