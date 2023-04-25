import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.image,
  });

  String? id;
  String? name;
  String? email;
  String? image;

  factory UserModel.fromJson(DocumentSnapshot json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
      };
}
