import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_app/components/appBar.dart';
import 'package:my_app/model/equipment/equipment_controller.dart';

import 'package:url_launcher/url_launcher.dart';

class EquipmentScreen extends StatefulWidget {
  const EquipmentScreen({Key? key}) : super(key: key);

  @override
  _EquipmentScreenState createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
  EquipmentController equipmentController = Get.put(EquipmentController());
  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    equipmentController.getEquipments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar_Components(
          title: 'Workout Equipments',
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          return Container(
            margin: EdgeInsets.only(bottom: 20),
            child: ListView.builder(
              itemCount: equipmentController.equipmentList.length,
              itemBuilder: (context, index) {
                var item = equipmentController.equipmentList[index];
                return Stack(
                  children: [
                    GestureDetector(
                      child: Container(
                        height: size.height * 0.3 - 40,
                        width: size.width * 1,
                        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            item.image!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      onTap: () async => {_launchUrl(item.link ?? '')},
                    ),
                    Positioned(
                      top: 25,
                      left: 25,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey[100],
                        ),
                        child: Text(
                          item.name!,
                          style: TextStyle(
                              fontFamily: 'Poppins-SemiBold', fontSize: 18),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 15,
                      child: Container(
                        child: Image.asset(
                          'assets/images/buy_now.png',
                          width: 130,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
