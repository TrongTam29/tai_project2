import 'package:cloud_firestore/cloud_firestore.dart';

class Equipment {
  Equipment({
    this.name,
    this.link,
    this.image,
  });

  String? name;
  String? link;
  String? image;

  factory Equipment.fromJson(DocumentSnapshot json) => Equipment(
        name: json["name"],
        link: json["link"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "link": link,
        "image": image,
      };
}
