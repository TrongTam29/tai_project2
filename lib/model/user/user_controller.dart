import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_app/model/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/model/userWorkout/userWorkout_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  CollectionReference _user = FirebaseFirestore.instance.collection("user");
  UserWorkoutController _userWorkoutController =
      Get.put(UserWorkoutController());
  Rx<UserModel> userObj = UserModel().obs;
  var isLoading = true.obs;

  Future createUser(UserModel user) async {
    _user.where('email', isEqualTo: user.email).get().then((value) async {
      if (value.docs.isEmpty) {
        user.id = _user.doc().id;
        await _user.add(user.toJson());
        _userWorkoutController.createUserWorkout(user.id ?? '');
      } else {
        var prefs = await SharedPreferences.getInstance();
        prefs.setString('userId', value.docs.first.id);
      }
    });
  }

  Future findUser(String email, {VoidCallback? onDone}) async {
    await _user.where('email', isEqualTo: email).get().then((value) async {
      if (value.docs.isNotEmpty) {
        userObj.value = UserModel.fromJson(value.docs.first);
        return userObj.value.id;
      }
    });
    onDone?.call();
  }
}
