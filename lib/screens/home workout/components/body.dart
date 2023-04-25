import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/screens/eqiupment/equipment_screen.dart';
import 'package:my_app/screens/gym%20guide/components/body.dart';
import 'package:my_app/screens/gym%20schedule/gym_schedule.dart';
import 'package:my_app/screens/list%20video/list_video.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () => Get.to(GymSchedule()),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/WorkoutPlan.png',
                        fit: BoxFit.cover,
                        height: 200,
                        width: size.width * 1,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 1,
                            sigmaY: 1,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                        child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WORKOUT',
                            style: TextStyle(
                                fontSize: 60,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Schedule',
                            style: TextStyle(
                                fontSize: 60,
                                color: Colors.white54,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => Get.to(EquipmentScreen()),
              child: Container(
                height: size.height * 0.2 - 40,
                width: size.width * 1,
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/images/Eqiupment.png',
                          fit: BoxFit.cover,
                          height: size.height * 0.2 - 40,
                          width: 130,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Home workout equipment',
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 10, right: 5, left: 5),
                            child: Text(
                              'Support you to buy the necessary equipment when exercising at home',
                              maxLines: 3,
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "The muscle groups for the gym:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins-SemiBold',
                ),
              ),
              alignment: Alignment(-0.75, 0),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MuscleGroupWidget(
                  muscleName: 'Chest',
                  image: 'assets/images/chest_schedule.jpg',
                  onTap: () =>
                      Get.to(ListVideo(muscleName: 'Chest', idMuscle: 8)),
                ),
                MuscleGroupWidget(
                  muscleName: 'Biceps',
                  image: 'assets/images/biceps_schedule.jpg',
                  onTap: () =>
                      Get.to(ListVideo(muscleName: 'Chest', idMuscle: 9)),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MuscleGroupWidget(
                  muscleName: 'Shoulder',
                  image: 'assets/images/shoulder_schedule.jpg',
                  onTap: () =>
                      Get.to(ListVideo(muscleName: 'Shoulder', idMuscle: 10)),
                ),
                MuscleGroupWidget(
                  muscleName: 'Triceps',
                  image: 'assets/images/triceps_schedule.jpg',
                  onTap: () =>
                      Get.to(ListVideo(muscleName: 'Triceps', idMuscle: 11)),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MuscleGroupWidget(
                  muscleName: 'Back',
                  image: 'assets/images/back_schedule.jpg',
                  onTap: () =>
                      Get.to(ListVideo(muscleName: 'Back', idMuscle: 12)),
                ),
                MuscleGroupWidget(
                  muscleName: 'Abs',
                  image: 'assets/images/abs_schedule.jpg',
                  onTap: () =>
                      Get.to(ListVideo(muscleName: 'Abs', idMuscle: 13)),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            MuscleGroupWidget(
              muscleName: 'Leg',
              image: 'assets/images/leg_schedule.jpg',
              onTap: () => Get.to(ListVideo(muscleName: ':Leg', idMuscle: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
