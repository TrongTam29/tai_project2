import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_app/components/appBar.dart';
import 'package:my_app/model/cardio/cardio_controller.dart';
import 'package:my_app/model/cardio/cardio_model.dart';
import 'package:my_app/screens/admin/cardio_list.dart';

import '../../../constants.dart';

class AddCardio extends StatefulWidget {
  final Cardio? cardioModel;
  const AddCardio({Key? key, this.cardioModel}) : super(key: key);

  @override
  State<AddCardio> createState() => _AddCardioState();
}

class _AddCardioState extends State<AddCardio> {
  TextEditingController name = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController link = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController exerTime = TextEditingController();
  TextEditingController breakTime = TextEditingController();
  TextEditingController focus = TextEditingController();
  CardioController cardioController = Get.put(CardioController());

  @override
  void initState() {
    super.initState();
    if (widget.cardioModel != null) {
      name.text = widget.cardioModel?.name ?? '';
      image.text = widget.cardioModel?.image ?? '';
      link.text = widget.cardioModel?.link ?? '';
      duration.text = widget.cardioModel?.duration ?? '';
      exerTime.text = widget.cardioModel?.exerTime ?? '';
      breakTime.text = widget.cardioModel?.breakTime ?? '';
      focus.text = widget.cardioModel?.focus ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 18, color: Colors.black);
    return Scaffold(
      appBar: widget.cardioModel != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: AppBar_Components(
                title: 'Update Cardio',
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Text(
                'Name',
                style: textStyle,
              ),
              title: SizedBox(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Input information'),
                  controller: name,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Text(
                'Image',
                style: textStyle,
              ),
              title: SizedBox(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Input information'),
                  controller: image,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Text(
                'Link',
                style: textStyle,
              ),
              title: SizedBox(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Input information'),
                  controller: link,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Text(
                'Duration',
                style: textStyle,
              ),
              title: SizedBox(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Input information'),
                  controller: duration,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Text(
                'ExerTime',
                style: textStyle,
              ),
              title: SizedBox(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Input information'),
                  controller: exerTime,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Text(
                'Break',
                style: textStyle,
              ),
              title: SizedBox(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Input information'),
                  controller: breakTime,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: Text(
                'Focus',
                style: textStyle,
              ),
              title: SizedBox(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Input information'),
                  controller: focus,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  var cardioModel = Cardio(
                    name: name.text,
                    image: image.text,
                    link: link.text,
                    duration: duration.text,
                    exerTime: exerTime.text,
                    breakTime: breakTime.text,
                    focus: focus.text,
                  );
                  if (widget.cardioModel != null) {
                    cardioController.updateCardio(
                        widget.cardioModel?.id ?? '', cardioModel);
                    Fluttertoast.showToast(msg: 'Successfully updated');
                  } else {
                    cardioController.postCardio(cardioModel);
                    Fluttertoast.showToast(msg: 'Successfully added new');
                  }
                },
                child: Text(widget.cardioModel != null ? 'Update' : 'Done'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.white))),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 15)),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(CardioList());
                },
                child: Text('Manage exercise list'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.white))),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 15)),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
