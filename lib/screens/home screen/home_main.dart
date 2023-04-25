import 'package:flutter/material.dart';
import 'package:my_app/screens/home%20screen/components/home_screen.dart';
import 'package:my_app/screens/menu%20profile/menu_profile.dart';
import 'package:quick_actions/quick_actions.dart';

class HomeSreen extends StatefulWidget {
  HomeSreen({Key? key}) : super(key: key);

  @override
  _HomeSreenState createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawerOpen;
  bool isDragging = false;
  final QuickActions quickActions = QuickActions();

  @override
  void initState() {
    super.initState();
    closeDrawer();
  }

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });

  void openDrawer() => setState(() {
        xOffset = 210;
        yOffset = 150;
        scaleFactor = 0.7;
        isDrawerOpen = true;
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // MenuProfile(),
          // buildHomePage(),
          Home()
        ],
      ),
    );
  }

  Widget buildHomePage() {
    return GestureDetector(
      onTap: closeDrawer,
      onHorizontalDragStart: (details) => isDragging = true,
      onHorizontalDragUpdate: (details) {
        if (!isDragging) return;
        const delta = 1;
        if (details.delta.dx > delta) {
          openDrawer();
        } else if (details.delta.dx < -delta) {
          closeDrawer();
        }

        isDragging = false;
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        child: AbsorbPointer(
          absorbing: isDrawerOpen,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(isDrawerOpen ? 30 : 0),
              child: Home()),
        ),
      ),
    );
  }
}
