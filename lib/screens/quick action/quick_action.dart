import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/model/cardio/cardio_model.dart';
import 'package:my_app/screens/gym%20guide/gym_guide.dart';
import 'package:my_app/screens/home%20workout/home_workout.dart';
import 'package:my_app/screens/my%20workouts/my_workout.dart';
import 'package:my_app/screens/nitrition%20screen/nutrition_screen.dart';
import 'package:quick_actions/quick_actions.dart';

class QuickActionsManager extends StatefulWidget {
  final Widget child;
  QuickActionsManager({required this.child});

  _QuickActionsManagerState createState() => _QuickActionsManagerState();
}

class _QuickActionsManagerState extends State<QuickActionsManager> {
  final QuickActions quickActions = QuickActions();

  @override
  void initState() {
    super.initState();

    quickActions.setShortcutItems([
      ShortcutItem(type: 'gym', localizedTitle: 'Gym Guide', icon: 'gym'),
      ShortcutItem(
          type: 'workout',
          localizedTitle: 'Home Workout',
          icon: 'home_workout'),
      ShortcutItem(
          type: 'nutrition', localizedTitle: 'Nutrition', icon: 'nutrition'),
      ShortcutItem(
          type: 'myWorkout', localizedTitle: 'My Workout', icon: 'my_workout'),
      ShortcutItem(type: 'cardio', localizedTitle: 'Cardio', icon: 'cardio')
    ]);
    quickActions.initialize((type) {
      if (type == 'gym') {
        Get.to(() => GymGuide());
      } else if (type == 'workout') {
        Get.to(() => HomeWorkout());
      } else if (type == 'nutrition') {
        Get.to(() => NutritionScreen());
      } else if (type == 'myWorkout') {
        Get.to(() => MyWorkout());
      } else if (type == 'cardio') {
        Get.to(() => Cardio());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
