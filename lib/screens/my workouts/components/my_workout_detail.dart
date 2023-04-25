import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:my_app/components/appBar.dart';
import 'package:my_app/model/exercise/exercise_controller.dart';
import 'package:my_app/model/user/user_controller.dart';
import 'package:my_app/model/userWorkout/userWorkout_controller.dart';
import 'package:my_app/screens/detail%20video/detail_video.dart';

class MyWorkoutDetail extends StatefulWidget {
  const MyWorkoutDetail({required this.listWorkout, required this.workoutDay});

  final List<String> listWorkout;
  final String workoutDay;
  @override
  _MyWorkoutDetailState createState() => _MyWorkoutDetailState();
}

class _MyWorkoutDetailState extends State<MyWorkoutDetail> {
  final ExerciseController exerciseController = Get.put(ExerciseController());
  UserWorkoutController workoutController = Get.find();
  UserController userController = Get.find();
  @override
  void initState() {
    super.initState();
    exerciseController.getExercisesByLink(widget.listWorkout);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar_Components(
          title: widget.workoutDay,
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          return exerciseController.userWorkoutList.isEmpty
              ? Container(
                  child: Center(
                    child: Text('No data yet'),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: ListView.builder(
                    itemCount: exerciseController.userWorkoutList.length,
                    itemBuilder: (context, index) {
                      var item = exerciseController.userWorkoutList[index];
                      return Slidable(
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              // An action can be bigger than the others.
                              flex: 1,
                              onPressed: (context) => {
                                exerciseController.userWorkoutList
                                    .removeAt(index),
                                widget.listWorkout.removeAt(index),
                                workoutController.updateDayWorkout(
                                    workoutController.userWorkoutObj.value.id ??
                                        '',
                                    widget.workoutDay.toLowerCase(),
                                    widget.listWorkout),
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
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
                                      padding:
                                          EdgeInsets.only(top: 10, right: 5),
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
                      );
                    },
                  ),
                );
        }),
      ),
    );
  }
}
