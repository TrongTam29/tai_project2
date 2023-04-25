import 'package:cloud_firestore/cloud_firestore.dart';

class Nutrition {
  Nutrition({
    this.name,
    this.detail,
    this.nutritionId,
  });

  String? name;
  String? detail;
  int? nutritionId;

  factory Nutrition.fromJson(DocumentSnapshot json) => Nutrition(
        name: json["name"],
        detail: json["detail"],
        nutritionId: json["nutritionId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "detail": detail,
        "nutritionId": nutritionId,
      };
}
