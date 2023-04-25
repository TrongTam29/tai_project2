import 'package:flutter/material.dart';
import 'package:my_app/components/appBar.dart';

import 'components/body.dart';

class HomeWorkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar_Components(
          title: "Home Workout",
        ),
      ),
      body: Body(),
    );
  }
}
