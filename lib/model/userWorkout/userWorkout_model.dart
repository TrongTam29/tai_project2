// To parse this JSON data, do
//
//     final userWorkout = userWorkoutFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserWorkout userWorkoutFromJson(String str) =>
    UserWorkout.fromJson(json.decode(str));

String userWorkoutToJson(UserWorkout data) => json.encode(data.toJson());

class UserWorkout {
  UserWorkout({
    this.id,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.userId,
  });

  String? id;
  List<String>? monday;
  List<String>? tuesday;
  List<String>? wednesday;
  List<String>? thursday;
  List<String>? friday;
  List<String>? saturday;
  String? userId;

  factory UserWorkout.fromJson(DocumentSnapshot json) => UserWorkout(
      id: json.id,
      monday: json["monday"] == null
          ? []
          : List<String>.from(json["monday"].map((x) => x)),
      tuesday: json["tuesday"] == null
          ? []
          : List<String>.from(json["tuesday"].map((x) => x)),
      wednesday: json["wednesday"] == null
          ? []
          : List<String>.from(json["wednesday"].map((x) => x)),
      thursday: json["thursday"] == null
          ? []
          : List<String>.from(json["thursday"].map((x) => x)),
      friday: json["friday"] == null
          ? []
          : List<String>.from(json["friday"].map((x) => x)),
      saturday: json["saturday"] == null
          ? []
          : List<String>.from(json["saturday"].map((x) => x)),
      userId: json["userId"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "monday":
            monday == null ? [] : List<dynamic>.from(monday!.map((x) => x)),
        "tuesday":
            tuesday == null ? [] : List<dynamic>.from(tuesday!.map((x) => x)),
        "wednesday": wednesday == null
            ? []
            : List<dynamic>.from(wednesday!.map((x) => x)),
        "thursday":
            thursday == null ? [] : List<dynamic>.from(thursday!.map((x) => x)),
        "friday":
            friday == null ? [] : List<dynamic>.from(friday!.map((x) => x)),
        "saturday":
            saturday == null ? [] : List<dynamic>.from(saturday!.map((x) => x)),
        "userId": userId,
      };
}
