import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:my_app/components/appBar.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/model/exercise/exercise_controller.dart';
import 'package:my_app/model/userWorkout/userWorkout_controller.dart';
import 'package:my_app/model/userWorkout/userWorkout_model.dart';
import 'package:my_app/screens/detail%20video/detail_video.dart';
import 'package:my_app/screens/hello%20screen/hello_Screen.dart';

import '../../model/user/user_controller.dart';

class ListVideo extends StatefulWidget {
  const ListVideo({required this.muscleName, required this.idMuscle});

  final String muscleName;
  final int idMuscle;
  @override
  _ListVideoState createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {
  final ExerciseController exerciseController = Get.put(ExerciseController());
  UserWorkoutController workoutController = Get.find();
  UserController userController = Get.find();
  User? user = FirebaseAuth.instance.currentUser;
  late String userId;
  late String userEmail = user?.email ?? 'username';
  @override
  void initState() {
    super.initState();
    exerciseController.getExercises(widget.idMuscle);
  }

  List<String>? mondayList;
  List<String>? tuesdayList;
  List<String>? wednesdayList;
  List<String>? thursdayList;
  List<String>? fridayList;
  List<String>? saturdayList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar_Components(
          title: widget.muscleName,
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          {
            mondayList = workoutController.userWorkoutObj.value.monday ?? [];
            tuesdayList = workoutController.userWorkoutObj.value.tuesday ?? [];
            wednesdayList =
                workoutController.userWorkoutObj.value.wednesday ?? [];
            thursdayList =
                workoutController.userWorkoutObj.value.thursday ?? [];
            fridayList = workoutController.userWorkoutObj.value.friday ?? [];
            saturdayList =
                workoutController.userWorkoutObj.value.saturday ?? [];
            print(exerciseController.exerciseList);
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              child: ListView.builder(
                itemCount: exerciseController.exerciseList.length,
                itemBuilder: (context, index) {
                  var item = exerciseController.exerciseList[index];
                  bool mondayCheck = false;
                  bool tuesdayCheck = false;
                  bool wednesdayCheck = false;
                  bool thusdayCheck = false;
                  bool fridayCheck = false;
                  bool saturdayCheck = false;
                  return GestureDetector(
                    onTap: () => Get.to(DetailVideo(
                      id: item.id!,
                      url: item.link!,
                      nameExercise: item.name!,
                      // reps: item.reps!,
                      // sets: item.sets!,
                      // breaks: item.exerciseBreak.toString(),
                      detail: item.detail.toString(),
                    )),
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            // An action can be bigger than the others.
                            flex: 1,
                            onPressed: (context) => {
                              if (userEmail != 'username')
                                {
                                  Get.defaultDialog(
                                    title: 'Save to...',
                                    titleStyle: TextStyle(
                                      fontSize: 25,
                                      color: kPrimaryColor,
                                      fontFamily: 'Wellfleet',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    content: StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter setState) {
                                        return Column(
                                          children: [
                                            Divider(),
                                            CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                activeColor: kPrimaryColor,
                                                title: Text('Monday'),
                                                value: mondayCheck,
                                                onChanged: (value) =>
                                                    setState(() => {
                                                          mondayCheck = value!,
                                                          if (value = true)
                                                            {
                                                              mondayList?.add(
                                                                  item.link ??
                                                                      '')
                                                            }
                                                          else
                                                            {
                                                              mondayList
                                                                  ?.remove(
                                                                      item.link)
                                                            }
                                                        })),
                                            CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                activeColor: kPrimaryColor,
                                                title: Text('Tuesday'),
                                                value: tuesdayCheck,
                                                onChanged: (value) =>
                                                    setState(() => {
                                                          tuesdayCheck = value!,
                                                          if (value = true)
                                                            {
                                                              tuesdayList?.add(
                                                                  item.link ??
                                                                      '')
                                                            }
                                                          else
                                                            {
                                                              tuesdayList
                                                                  ?.remove(
                                                                      item.link)
                                                            }
                                                        })),
                                            CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                activeColor: kPrimaryColor,
                                                title: Text('Wednesday'),
                                                value: wednesdayCheck,
                                                onChanged: (value) =>
                                                    setState(() => {
                                                          wednesdayCheck =
                                                              value!,
                                                          if (value = true)
                                                            {
                                                              wednesdayList?.add(
                                                                  item.link ??
                                                                      '')
                                                            }
                                                          else
                                                            {
                                                              wednesdayList
                                                                  ?.remove(
                                                                      item.link)
                                                            }
                                                        })),
                                            CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                activeColor: kPrimaryColor,
                                                title: Text('Thusday'),
                                                value: thusdayCheck,
                                                onChanged: (value) =>
                                                    setState(() => {
                                                          thusdayCheck = value!,
                                                          if (value = true)
                                                            {
                                                              thursdayList?.add(
                                                                  item.link ??
                                                                      '')
                                                            }
                                                          else
                                                            {
                                                              thursdayList
                                                                  ?.remove(
                                                                      item.link)
                                                            }
                                                        })),
                                            CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                activeColor: kPrimaryColor,
                                                title: Text('Friday'),
                                                value: fridayCheck,
                                                onChanged: (value) =>
                                                    setState(() => {
                                                          fridayCheck = value!,
                                                          if (value = true)
                                                            {
                                                              fridayList?.add(
                                                                  item.link ??
                                                                      '')
                                                            }
                                                          else
                                                            {
                                                              fridayList
                                                                  ?.remove(
                                                                      item.link)
                                                            }
                                                        })),
                                            CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                activeColor: kPrimaryColor,
                                                title: Text('Saturday'),
                                                value: saturdayCheck,
                                                onChanged: (value) =>
                                                    setState(() => {
                                                          saturdayCheck =
                                                              value!,
                                                          if (value = true)
                                                            {
                                                              saturdayList?.add(
                                                                  item.link ??
                                                                      '')
                                                            }
                                                          else
                                                            {
                                                              saturdayList
                                                                  ?.remove(
                                                                      item.link)
                                                            }
                                                        })),
                                            ElevatedButton(
                                              onPressed: () {
                                                Get.back();

                                                workoutController.updateWorkout(
                                                  workoutController
                                                          .userWorkoutObj
                                                          .value
                                                          .id ??
                                                      '',
                                                  UserWorkout(
                                                    id: workoutController
                                                        .userWorkoutObj
                                                        .value
                                                        .id,
                                                    monday: mondayList,
                                                    tuesday: tuesdayList,
                                                    wednesday: wednesdayList,
                                                    thursday: thursdayList,
                                                    friday: fridayList,
                                                    saturday: saturdayList,
                                                    userId: userController
                                                        .userObj.value.id,
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                'Save',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              style: ButtonStyle(
                                                padding:
                                                    MaterialStateProperty.all(
                                                        EdgeInsets.symmetric(
                                                            horizontal: 25)),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        kPrimaryColor),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    side: BorderSide(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                }
                              else
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
                                                EdgeInsets.symmetric(
                                                    horizontal: 25)),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    kPrimaryColor),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    side: BorderSide(
                                                        color: Colors.white))),
                                          ),
                                        ),
                                      ],
                                    )),
                            },
                            backgroundColor: Color(0xFF7BC043),
                            foregroundColor: Colors.white,
                            icon: Icons.archive,
                            label: 'Add to home workout',
                          ),
                        ],
                      ),
                      child: Container(
                        height: size.height * 0.2 - 40,
                        width: size.width * 1,
                        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[100],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  item.image!,
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
                                      item.name ?? "",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Colors.black87),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10, right: 5),
                                    child: Text(
                                      item.detail ?? '',
                                      maxLines: 3,
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        }),
      ),
    );
  }
}
