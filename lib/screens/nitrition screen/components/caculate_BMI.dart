import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:my_app/screens/nitrition%20screen/components/expandable_BMI.dart';

class CaculateBMI extends StatefulWidget {
  CaculateBMI();

  @override
  _CaculateBMIState createState() => _CaculateBMIState();
}

class _CaculateBMIState extends State<CaculateBMI> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ExpandableNotifier(
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: ScrollOnExpand(
                    scrollOnExpand: true,
                    scrollOnCollapse: false,
                    child: ExpandablePanel(
                      theme: const ExpandableThemeData(
                        hasIcon: false,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToCollapse: true,
                        tapBodyToExpand: true,
                      ),
                      header: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/caculate_BMI.png',
                          width: size.width * 0.9,
                          height: size.height * 0.1 + 10,
                          fit: BoxFit.cover,
                        ),
                      ),
                      expanded: ExpandableInBMI(),
                      collapsed: Text(
                        '',
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      builder: (_, collapsed, expanded) {
                        return Expandable(
                          expanded: expanded,
                          collapsed: collapsed,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
