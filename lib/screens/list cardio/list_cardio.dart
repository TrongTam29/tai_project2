import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_app/components/appBar.dart';
import 'package:my_app/model/cardio/cardio_controller.dart';
import 'package:my_app/screens/detail%20cardio/detail_cardio.dart';

class ListCardio extends StatefulWidget {
  const ListCardio({Key? key}) : super(key: key);

  @override
  _ListCardioState createState() => _ListCardioState();
}

class _ListCardioState extends State<ListCardio> {
  CardioController cardioController = Get.put(CardioController());

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
          title: 'Cardio and Lose weight',
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          return Container(
            margin: EdgeInsets.only(bottom: 20),
            child: ListView.builder(
              itemCount: cardioController.cardioList.length,
              itemBuilder: (context, index) {
                var item = cardioController.cardioList[index];
                return InkWell(
                  onTap: () => Get.to(DetailCardio(
                    id: item.id ?? '',
                    url: item.link ?? '',
                    nameCarido: item.name ?? '',
                    breakTime: item.breakTime ?? '',
                    duration: item.duration ?? '',
                    exerTime: item.exerTime ?? '',
                    focus: item.focus ?? '',
                  )),
                  child: Container(
                    height: size.height * 0.2 - 40,
                    width: size.width * 1,
                    margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              item.image!,
                              fit: BoxFit.cover,
                              height: size.height * 0.2 - 40,
                              width: 130,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  item.name ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.black87),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10, right: 5),
                                child: Text(
                                  'Cardio is a training method that burns calories quickly, contributes to increasing heart rate, improves metabolism, so it is effective for weight loss and fat loss. This method is suitable for many different subjects, suitable for health training, bodybuilding and rapid weight loss.',
                                  maxLines: 3,
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                // Stack(
                //   children: [
                //     GestureDetector(
                //       child: Container(
                //         height: size.height * 0.2 - 40,
                //         width: size.width * 1,
                //         margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                //         child: ClipRRect(
                //           borderRadius: BorderRadius.circular(15),
                //           child: Image.network(
                //             item.image ?? '',
                //             fit: BoxFit.fitWidth,
                //           ),
                //         ),
                //       ),
                //       onTap: () => Get.to(DetailCardio(
                //         id: item.id ?? '',
                //         url: item.link ?? '',
                //         nameCarido: item.name ?? '',
                //         breakTime: item.breakTime ?? '',
                //         duration: item.duration ?? '',
                //         exerTime: item.exerTime ?? '',
                //         focus: item.focus ?? '',
                //       )),
                //     ),
                //     Positioned(
                //       bottom: 10,
                //       left: 25,
                //       child: Container(
                //         padding: EdgeInsets.all(5),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: Colors.blueGrey[100],
                //         ),
                //         child: Text(
                //           item.name!,
                //           style: TextStyle(
                //             fontFamily: 'Poppins-SemiBold',
                //             fontSize: 16,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // );
              },
            ),
          );
        }),
      ),
    );
  }
}
