import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/model/exercise/exercise.dart';
import 'package:my_app/model/exercise/exercise_controller.dart';
import 'package:my_app/screens/admin/exercise_list.dart';

import '../../../components/appBar.dart';

class AddExercise extends StatefulWidget {
  final Exercise? exerciseModel;
  const AddExercise({this.exerciseModel});

  @override
  _AddExerciseState createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  ExerciseController exerciseController = Get.put(ExerciseController());
  var textStyle = TextStyle(fontSize: 18, color: Colors.black);
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController repController = TextEditingController();
  TextEditingController setController = TextEditingController();
  TextEditingController breakTimeController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController muscleGroupIDController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.exerciseModel != null) {
      nameController.text = widget.exerciseModel?.name ?? '';
      imageController.text = widget.exerciseModel?.image ?? '';
      linkController.text = widget.exerciseModel?.link ?? '';
      // repController.text = widget.exerciseModel?.reps ?? '';
      // setController.text = widget.exerciseModel?.sets ?? '';
      // breakTimeController.text = widget.exerciseModel?.exerciseBreak ?? '';
      detailController.text = widget.exerciseModel?.detail ?? '';
      muscleGroupIDController.text =
          widget.exerciseModel?.muscleGroupId.toString() ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.exerciseModel != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: AppBar_Components(
                title: 'Update Exercise',
              ),
            )
          : null,
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          ListTile(
            leading: Text(
              'Name',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Input information'),
                controller: nameController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Image',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Input information'),
                controller: imageController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Link',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Input information'),
                controller: linkController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Reps',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Input information'),
                controller: repController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Sets',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Input information'),
                controller: setController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Break',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Input information'),
                controller: breakTimeController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Detail',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Input information'),
                controller: detailController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'MuscleGroup ID',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Input information'),
                controller: muscleGroupIDController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                var exerciseModel = Exercise(
                  name: nameController.text,
                  image: imageController.text,
                  link: linkController.text,
                  // reps: repController.text,
                  // sets: setController.text,
                  // exerciseBreak: breakTimeController.text,
                  detail: detailController.text,
                  muscleGroupId: int.parse((muscleGroupIDController.text)),
                );
                if (widget.exerciseModel != null) {
                  exerciseController.updateExercise(
                      widget.exerciseModel?.id ?? '', exerciseModel);
                  Fluttertoast.showToast(msg: 'Successfully updated');
                } else {
                  exerciseController.postExercise(exerciseModel);
                  Fluttertoast.showToast(msg: 'Successfully added new');
                }
              },
              child: Text(widget.exerciseModel != null ? 'Update' : 'Done'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white))),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 15, horizontal: 45)),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: ElevatedButton(
              onPressed: () {
                Get.to(ExerciseList());
              },
              child: Text('Manage exercise list'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white))),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 15)),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
