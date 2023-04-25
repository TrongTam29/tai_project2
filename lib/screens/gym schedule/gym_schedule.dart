import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/components/appBar.dart';
import 'package:my_app/screens/gym%20schedule/components/friday.dart';
import 'package:my_app/screens/gym%20schedule/components/monday.dart';
import 'package:my_app/screens/gym%20schedule/components/saturday.dart';
import 'package:my_app/screens/gym%20schedule/components/thusday.dart';
import 'package:my_app/screens/gym%20schedule/components/tuesday.dart';
import 'components/wednesday.dart';

final List<Widget> imgList = [
  Monday(),
  Tusesday(),
  Wednesday(),
  Thusday(),
  Friday(),
  Saturday()
];

class GymSchedule extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GymSchedule();
  }
}

class _GymSchedule extends State<GymSchedule> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  int? getDay() {
    int? day;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE').format(now);
    if ((formattedDate == 'Mon') || (formattedDate == 'Sun')) {
      day = 0;
    }
    if (formattedDate == 'Tue') {
      day = 1;
    }
    if (formattedDate == 'Wed') {
      day = 2;
    }
    if (formattedDate == 'Thu') {
      day = 3;
    }
    if (formattedDate == 'Fri') {
      day = 4;
    }
    if (formattedDate == 'Sat') {
      day = 5;
    }
    return day;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar_Components(
          title: "Gym Schedule",
        ),
      ),
      body: Column(
        children: [
          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
                height: size.height * 0.8 + 40,
                initialPage: getDay()!,
                autoPlay: false,
                enlargeCenterPage: false,
                viewportFraction: 1,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: imgList
                .map((item) => Container(
                      child: item,
                    ))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: size.width * 0.1 - 25,
                  height: size.height * 0.1 - 73,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
