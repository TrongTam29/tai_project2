import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class AppBar_Components extends StatelessWidget {
  const AppBar_Components({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            fontFamily: 'AdventPro',
          ),
        ),
      ),
      actions: [],
    );
  }
}
