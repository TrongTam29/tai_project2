import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/home%20screen/components/body.dart';

import '../../../constants.dart';
import '../../../login/FbLogin_controller.dart';
import '../../../login/GgLogin_controller.dart';
import '../../admin/admin.dart';
import '../../alarm/alarm_view.dart';
import '../../hello screen/hello_Screen.dart';
import '../../nitrition screen/nutrition_screen.dart';
import '../home_main.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    GgLoginController ggController = Get.put(GgLoginController());
    FbLoginController fbController = Get.put(FbLoginController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 0),
          child: Text(
            'BeFit',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600,
              fontFamily: 'AdventPro',
            ),
          ),
        ),
        actions: null,
      ),
      drawer: Drawer(
        shadowColor: Colors.blueGrey,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(16.0),
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(user?.photoURL ??
                          'https://i.pinimg.com/236x/d7/5d/22/d75d22e233d069059bb876ed36d1804c.jpg'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Text(
                        user?.displayName ?? '',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      '${user?.email ?? ''}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                  ],
                )),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              onTap: () {
                Get.to(() => HomeSreen());
              },
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {
                Get.defaultDialog(
                  title: 'BeFit app',
                  titleStyle: TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                  content: Column(
                    children: [
                      Text(
                        'An application that guides gym, cardio at the gym center or at home and provides nutrition for users',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Version: 1.0.0',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
              leading: Icon(
                Icons.info,
                color: Colors.black,
              ),
              title: Text(
                'About',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {
                Get.to(() => AlarmPage());
              },
              leading: Icon(
                Icons.alarm,
                color: Colors.black,
              ),
              title: Text(
                'Alarm',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {
                Get.to(NutritionScreen());
              },
              leading: Icon(
                Icons.build,
                color: Colors.black,
              ),
              title: Text(
                'BMI tool',
                style: TextStyle(color: Colors.black),
              ),
            ),
            user?.email == 'doananhtai2k@gmail.com'
                ? ListTile(
                    onTap: () {
                      Get.to(Admin());
                    },
                    leading: Icon(
                      Icons.manage_accounts_rounded,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Admin',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                : SizedBox(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.32,
            ),
            ListTile(
              onTap: () {
                fbController.logOut();
                ggController.logoutGoogle();
                ggController.logOut();
                Get.to(() => HelloScreen());
              },
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      body: Body(),
    );
  }
}

class DrawerMenuWidget extends StatelessWidget {
  final VoidCallback onClicked;
  const DrawerMenuWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.more_horiz_outlined),
      onPressed: onClicked,
      tooltip: 'Menu',
      iconSize: 30,
    );
  }
}
