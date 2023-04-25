import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/model/exercise/exercise.dart';
import 'package:my_app/model/exerciseComment/exerciseComment_model.dart';

class ExerciseController extends GetxController {
  CollectionReference _exerciseCollection =
      FirebaseFirestore.instance.collection("Exercise");
  CollectionReference _exerciseCommentCollection =
      FirebaseFirestore.instance.collection("ExerciseComment");

  RxList<Exercise> exerciseList = RxList<Exercise>([]);
  RxList<Exercise> allExerciseList = RxList<Exercise>([]);
  RxList<Exercise> userWorkoutList = RxList<Exercise>([]);
  RxList<ExerciseComment> exerciseCommentList = RxList<ExerciseComment>([]);

  void getExercises(int muscleGroupId) {
    exerciseList.bindStream(_exerciseCollection
        .where('muscleGroupId', isEqualTo: muscleGroupId)
        .snapshots()
        .map((query) => query.docs.map((e) => Exercise.fromJson(e)).toList()));
  }

  void getAllExercises() {
    allExerciseList.bindStream(_exerciseCollection
        .snapshots()
        .map((query) => query.docs.map((e) => Exercise.fromJson(e)).toList()));
  }

  void postExercise(Exercise exerciseModel) {
    _exerciseCollection.add(exerciseModel.toJson());
  }

  void updateExercise(String id, Exercise model) {
    _exerciseCollection.doc(id).set(model.toJson());
  }

  void remove(String id) {
    _exerciseCollection.doc(id).delete();
  }

  void getExercisesComment(String exerciseId) {
    exerciseCommentList.bindStream(_exerciseCommentCollection
        .where('exerciseId', isEqualTo: exerciseId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((query) =>
            query.docs.map((e) => ExerciseComment.fromJson(e)).toList()));
  }

  void comment(ExerciseComment model) {
    _exerciseCommentCollection.add(model.toJson());
  }

  void getExercisesByLink(List<String> workoutList) {
    userWorkoutList = RxList<Exercise>([]);

    workoutList.forEach((link) {
      _exerciseCollection.where('link', isEqualTo: link).get().then((value) {
        if (value.docs.isNotEmpty) {
          userWorkoutList.add(Exercise.fromJson(value.docs.first));
        }
      });
    });
  }
}
