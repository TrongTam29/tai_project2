import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/admin/components/add_cardio.dart';
import 'package:my_app/screens/admin/components/add_exercise.dart';

class Admin extends StatelessWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.chevron_left_outlined),
            onPressed: () {
              Get.back();
            },
            tooltip: 'Back',
            iconSize: 30,
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 0),
            child: Text(
              'Admin',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                fontFamily: 'AdventPro',
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                  child: Text(
                    'Exercise',
                    style: TextStyle(fontSize: 16),
                  ),
                  icon: Icon(Icons.fitness_center)),
              Tab(
                  child: Text(
                    'Carido',
                    style: TextStyle(fontSize: 16),
                  ),
                  icon: Icon(Icons.directions_run)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AddExercise(),
            AddCardio(),
          ],
        ),
      ),
    );
  }
}
