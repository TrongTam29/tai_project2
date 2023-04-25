import 'package:flutter/material.dart';
import 'package:my_app/components/appBar.dart';

import 'components/body.dart';

class GymGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar_Components(
          title: "Gym Guide",
        ),
      ),
      body: Body(),
    );
  }
}
