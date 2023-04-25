import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/model/cardio/cardio_controller.dart';
import 'package:my_app/screens/admin/components/add_cardio.dart';
import 'package:my_app/screens/detail%20cardio/detail_cardio.dart';

import '../../components/appBar.dart';

class CardioList extends StatefulWidget {
  const CardioList();

  @override
  State<CardioList> createState() => _CardioListState();
}

class _CardioListState extends State<CardioList> {
  final CardioController cardioController = Get.put(CardioController());

  @override
  void initState() {
    cardioController.getCardios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar_Components(
          title: 'Exercise List',
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          {
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              child: ListView.builder(
                itemCount: cardioController.cardioList.length,
                itemBuilder: (context, index) {
                  var item = cardioController.cardioList[index];
                  return Stack(
                    children: [
                      GestureDetector(
                        child: Container(
                          height: size.height * 0.2 - 40,
                          width: size.width * 1,
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              item.image!,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        onTap: () => Get.to(DetailCardio(
                          id: item.id ?? '',
                          url: item.link ?? '',
                          nameCarido: item.name ?? '',
                          breakTime: item.breakTime ?? '',
                          duration: item.duration ?? '',
                          exerTime: item.exerTime ?? '',
                          focus: item.focus ?? '',
                        )),
                      ),
                      Positioned(
                        bottom: 10,
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
                                fontFamily: 'Poppins-SemiBold',
                                fontSize: 16,
                                color: Colors.black87),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 25,
                        top: 15,
                        child: GestureDetector(
                          onTap: () => cardioController.remove(item.id ?? ''),
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueGrey[100],
                            ),
                            child: Icon(
                              Icons.delete_forever_rounded,
                              size: 28,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 70,
                        top: 15,
                        child: GestureDetector(
                          onTap: () => Get.to(AddCardio(
                            cardioModel: item,
                          )),
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueGrey[100],
                            ),
                            child: Icon(
                              Icons.mode_edit_rounded,
                              size: 28,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }
        }),
      ),
    );
  }
}
