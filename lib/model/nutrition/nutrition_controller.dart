import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/model/nutrition/nutrition.dart';

class NutritionController extends GetxController {
  CollectionReference _dayCollection =
      FirebaseFirestore.instance.collection("Day");
  Rx<Nutrition> nutritionObj = Nutrition().obs;

  void getNutritionDay(int nutritionId, String nameDay) async {
    _dayCollection
        .where('nutritionId', isEqualTo: nutritionId)
        .where('name', isEqualTo: nameDay)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        nutritionObj.value = Nutrition.fromJson(value.docs.first);
        print(nutritionObj.value);
      } else {
        nutritionObj.value = Nutrition();
      }
    });
  }
}
