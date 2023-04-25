import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/model/user/user_controller.dart';
import 'package:my_app/model/userWorkout/userWorkout_controller.dart';
import 'package:my_app/screens/gym%20guide/gym_guide.dart';
import 'package:my_app/screens/hello%20screen/hello_Screen.dart';
import 'package:my_app/screens/home%20workout/home_workout.dart';
import 'package:my_app/screens/list%20cardio/list_cardio.dart';
import 'package:my_app/screens/my%20workouts/my_workout.dart';
import 'package:my_app/screens/nitrition%20screen/nutrition_screen.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // HeaderAndSearchbox(),
          MethodsInBody(),
        ],
      ),
    );
  }
}

class MethodsInBody extends StatefulWidget {
  MethodsInBody({Key? key}) : super(key: key);

  @override
  _MethodsInBodyState createState() => _MethodsInBodyState();
}

class _MethodsInBodyState extends State<MethodsInBody> {
  UserWorkoutController workoutController = Get.put(UserWorkoutController());
  UserController userController = Get.find();
  User? user = FirebaseAuth.instance.currentUser;
  late String userEmail = user?.email ?? 'username';
  @override
  void initState() {
    super.initState();
    userController.findUser(userEmail, onDone: () {
      workoutController.getUserWorkouts(userController.userObj.value.id ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white54,
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Hi ${user?.displayName ?? ''}',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Text(
                      '${user?.email ?? ''}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Do Not Miss The Fitness! ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(user?.photoURL ??
                      'https://i.pinimg.com/236x/d7/5d/22/d75d22e233d069059bb876ed36d1804c.jpg'),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 30, bottom: 15),
            child: Text(
              'Practice',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          containerWidget(
            size,
            'assets/images/GymGuide.png',
            'Gym guide',
            () => Get.to(
              GymGuide(),
            ),
          ),
          containerWidget(
            size,
            'assets/images/HomeWorkout.png',
            'Home Workouts',
            () => Get.to(HomeWorkout()),
          ),
          containerWidget(
            size,
            'assets/images/nutrition.png',
            'Nutrition',
            () => Get.to(
              NutritionScreen(),
            ),
          ),
          containerWidget(
              size,
              'assets/images/MyWorkout.png',
              'My Workouts',
              () => {
                    if (userEmail == 'username')
                      {
                        Get.defaultDialog(
                            title: 'Notification',
                            titleStyle: TextStyle(
                              fontSize: 22,
                              color: kPrimaryColor,
                              fontFamily: 'Wellfleet',
                              fontWeight: FontWeight.w400,
                            ),
                            content: Column(
                              children: [
                                Text(
                                    "You need to Login to use this function. Sorry for this inconvenience"),
                                SizedBox(
                                  height: 15,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.to(() => HelloScreen());
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(horizontal: 25)),
                                    backgroundColor: MaterialStateProperty.all(
                                        kPrimaryColor),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side: BorderSide(
                                                color: Colors.white))),
                                  ),
                                ),
                              ],
                            )),
                      }
                    else
                      Get.to(() => MyWorkout()),
                  }),
          containerWidget(
            size,
            'assets/images/cardio.png',
            'Cardio and Lose weight',
            () => Get.to(
              ListCardio(),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector containerWidget(
      Size size, String image, String text, Function() onTap) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            width: size.width * 1,
            height: 170,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 148, 181, 197),
              ),
              child: Text(
                text,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
