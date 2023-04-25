import 'package:flutter/material.dart';
import 'package:my_app/components/appBar.dart';
import 'package:my_app/screens/nitrition%20screen/components/body.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar_Components(
          title: "Nutrition",
        ),
      ),
      body: Body(),
    );
  }
}
