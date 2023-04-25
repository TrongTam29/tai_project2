import 'package:cloud_firestore/cloud_firestore.dart';

class ExerciseComment {
  ExerciseComment({
    this.name,
    this.image,
    this.comment,
    this.exerciseId,
    this.createdAt,
  });

  String? name;
  String? image;
  String? comment;
  String? exerciseId;
  DateTime? createdAt;

  factory ExerciseComment.fromJson(DocumentSnapshot json) => ExerciseComment(
        name: json["name"],
        image: json["image"],
        comment: json["comment"],
        exerciseId: json["exerciseId"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "comment": comment,
        "exerciseId": exerciseId,
        "createdAt": (createdAt ?? DateTime.now()).toIso8601String(),
      };
}
