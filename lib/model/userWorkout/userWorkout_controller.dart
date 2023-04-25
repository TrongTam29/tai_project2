import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_app/model/userWorkout/userWorkout_model.dart';

class UserWorkoutController extends GetxController {
  CollectionReference _userworkoutCollection =
      FirebaseFirestore.instance.collection("UserWorkout");

  RxList<UserWorkout> userworkoutList = RxList<UserWorkout>([]);
  Rx<UserWorkout> userWorkoutObj = UserWorkout().obs;

  Future<void> getUserWorkouts(String userId) async {
    _userworkoutCollection
        .where('userId', isEqualTo: userId)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        userWorkoutObj.value = UserWorkout.fromJson(value.docs.first);
        print(userWorkoutObj.value.toJson());
      }
    });
  }

  void createUserWorkout(String userId) async {
    await _userworkoutCollection.add(UserWorkout(userId: userId).toJson());
  }

  void updateWorkout(String id, UserWorkout model) {
    _userworkoutCollection.doc(id).set(model.toJson());
  }

  void updateDayWorkout(String id, String dayName, List<String> dayList) {
    _userworkoutCollection.doc(id).update({dayName: dayList});
  }
}
