import 'package:cloud_firestore/cloud_firestore.dart';

class Cardio {
  Cardio({
    this.id,
    this.name,
    this.image,
    this.link,
    this.duration,
    this.exerTime,
    this.breakTime,
    this.focus,
  });

  String? id;
  String? name;
  String? image;
  String? link;
  String? duration;
  String? exerTime;
  String? breakTime;
  String? focus;

  factory Cardio.fromJson(DocumentSnapshot json) => Cardio(
        id: json.id,
        name: json["name"],
        image: json["image"],
        link: json["link"],
        duration: json["duration"],
        exerTime: json["exerTime"],
        breakTime: json["breakTime"],
        focus: json["focus"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "link": link,
        "duration": duration,
        "exerTime": exerTime,
        "breakTime": breakTime,
        "focus": focus,
      };
}
