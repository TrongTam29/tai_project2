import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/components/appBar.dart';
import 'package:my_app/model/user/user_controller.dart';
import 'package:my_app/model/userWorkout/userWorkout_controller.dart';
import 'package:my_app/screens/my%20workouts/components/my_workout_detail.dart';

class MyWorkout extends StatefulWidget {
  const MyWorkout({Key? key}) : super(key: key);

  @override
  _MyWorkoutState createState() => _MyWorkoutState();
}

class _MyWorkoutState extends State<MyWorkout> {
  UserWorkoutController workoutController = Get.find();
  UserController userController = Get.find();

  var mondayList;
  var tuesdayList;
  var wednesdayList;
  var thursdayList;
  var fridayList;
  var saturdayList;

  @override
  void initState() {
    super.initState();
    workoutController.getUserWorkouts(userController.userObj.value.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar_Components(
          title: 'My Workout',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => {
                mondayList = workoutController.userWorkoutObj.value.monday,
                Get.to(
                  () => MyWorkoutDetail(
                    listWorkout: mondayList ?? [],
                    workoutDay: 'Monday',
                  ),
                ),
              },
              child: StackDay(
                size: size,
                image:
                    'https://cdn.shopify.com/s/files/1/0141/5242/t/16/assets/fitsix-4-bright_LIQo.jpg?v=1620121722618',
                day: 'Monday',
              ),
            ),
            GestureDetector(
              onTap: () => {
                tuesdayList = workoutController.userWorkoutObj.value.tuesday,
                Get.to(
                  () => MyWorkoutDetail(
                    listWorkout: tuesdayList ?? [],
                    workoutDay: 'Tuesday',
                  ),
                ),
              },
              child: StackDay(
                size: size,
                image:
                    'https://cdn.shopify.com/s/files/1/0141/5242/t/16/assets/fitsix-4-bright_LIQo.jpg?v=1620121722618',
                day: 'Tuesday',
              ),
            ),
            GestureDetector(
              onTap: () => {
                wednesdayList =
                    workoutController.userWorkoutObj.value.wednesday,
                Get.to(
                  () => MyWorkoutDetail(
                    listWorkout: wednesdayList ?? [],
                    workoutDay: 'Wednesday',
                  ),
                ),
              },
              child: StackDay(
                size: size,
                image:
                    'https://cdn.shopify.com/s/files/1/0141/5242/t/16/assets/fitsix-4-bright_LIQo.jpg?v=1620121722618',
                day: 'Wednesday',
              ),
            ),
            GestureDetector(
              onTap: () => {
                thursdayList = workoutController.userWorkoutObj.value.thursday,
                Get.to(
                  () => MyWorkoutDetail(
                    listWorkout: thursdayList ?? [],
                    workoutDay: 'Thursday',
                  ),
                ),
              },
              child: StackDay(
                size: size,
                image:
                    'https://cdn.shopify.com/s/files/1/0141/5242/t/16/assets/fitsix-4-bright_LIQo.jpg?v=1620121722618',
                day: 'Thursday',
              ),
            ),
            GestureDetector(
              onTap: () => {
                fridayList = workoutController.userWorkoutObj.value.friday,
                Get.to(
                  () => MyWorkoutDetail(
                    listWorkout: fridayList ?? [],
                    workoutDay: 'Friday',
                  ),
                ),
              },
              child: StackDay(
                size: size,
                image:
                    'https://cdn.shopify.com/s/files/1/0141/5242/t/16/assets/fitsix-4-bright_LIQo.jpg?v=1620121722618',
                day: 'Friday',
              ),
            ),
            GestureDetector(
              onTap: () async {
                saturdayList = workoutController.userWorkoutObj.value.saturday;
                await Get.to(
                  () => MyWorkoutDetail(
                    listWorkout: saturdayList ?? [],
                    workoutDay: 'Saturday',
                  ),
                );
              },
              child: StackDay(
                size: size,
                image:
                    'https://cdn.shopify.com/s/files/1/0141/5242/t/16/assets/fitsix-4-bright_LIQo.jpg?v=1620121722618',
                day: 'Saturday',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StackDay extends StatelessWidget {
  const StackDay({required this.size, required this.day, required this.image});

  final Size size;
  final String image;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          child: Container(
            height: size.height * 0.2 - 70,
            width: size.width * 1,
            margin: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 110,
          child: Text(
            day,
            style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontSize: 40,
                color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
