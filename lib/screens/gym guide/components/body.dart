import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/screens/gym%20schedule/gym_schedule.dart';
import 'package:my_app/screens/list%20video/list_video.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding),
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
                        'assets/images/GymSchedule.jpg',
                        fit: BoxFit.cover,
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
                              color: Colors.black.withOpacity(0.1),
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
                            'GYM',
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
                      Get.to(ListVideo(muscleName: 'Chest', idMuscle: 1)),
                ),
                MuscleGroupWidget(
                  muscleName: 'Biceps',
                  image: 'assets/images/biceps_schedule.jpg',
                  onTap: () =>
                      Get.to(ListVideo(muscleName: 'Chest', idMuscle: 2)),
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
                      Get.to(ListVideo(muscleName: 'Shoulder', idMuscle: 3)),
                ),
                MuscleGroupWidget(
                  muscleName: 'Triceps',
                  image: 'assets/images/triceps_schedule.jpg',
                  onTap: () =>
                      Get.to(ListVideo(muscleName: 'Triceps', idMuscle: 4)),
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
                      Get.to(ListVideo(muscleName: 'Back', idMuscle: 5)),
                ),
                MuscleGroupWidget(
                  muscleName: 'Abs',
                  image: 'assets/images/abs_schedule.jpg',
                  onTap: () =>
                      Get.to(ListVideo(muscleName: 'Abs', idMuscle: 6)),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            MuscleGroupWidget(
              muscleName: 'Leg',
              image: 'assets/images/leg_schedule.jpg',
              onTap: () => Get.to(ListVideo(muscleName: ':Leg', idMuscle: 7)),
            ),
          ],
        ),
      ),
    );
  }
}

class MuscleGroupWidget extends StatelessWidget {
  final String image;
  final String muscleName;
  final Function()? onTap;
  const MuscleGroupWidget({
    Key? key,
    required this.image,
    required this.muscleName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      width: 180,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13), color: kSecondColor),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundImage: AssetImage(image),
              minRadius: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                this.muscleName,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
