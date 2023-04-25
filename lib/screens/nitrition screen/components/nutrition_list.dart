import 'package:flutter/material.dart';

class NutritionListLeft extends StatelessWidget {
  const NutritionListLeft(
      {required this.size,
      required this.nutritionImage,
      required this.nutritionSubTitle,
      required this.nutritionTitle,
      required this.nutritionMargin});

  final Size size;
  final String nutritionImage;
  final String nutritionTitle;
  final String nutritionSubTitle;
  final double nutritionMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: nutritionMargin),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 183, 203, 212),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              nutritionImage,
              width: size.width * 0.5 - 10,
              height: size.height * 0.1 + 10,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                  text: nutritionTitle,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'PragatiNarrow-Bold',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: nutritionSubTitle,
                      style: TextStyle(
                          height: 1.8,
                          fontSize: 13,
                          fontFamily: 'PragatiNarrow-Regular',
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    )
                  ]),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class NutritionListRight extends StatelessWidget {
  const NutritionListRight(
      {required this.size,
      required this.nutritionImage,
      required this.nutritionSubTitle,
      required this.nutritionTitle});

  final Size size;
  final String nutritionImage;
  final String nutritionTitle;
  final String nutritionSubTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: RichText(
              text: TextSpan(
                  text: nutritionTitle,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'PragatiNarrow-Bold',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: nutritionSubTitle,
                      style: TextStyle(
                          height: 1.8,
                          fontSize: 13,
                          fontFamily: 'PragatiNarrow-Regular',
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    )
                  ]),
              textAlign: TextAlign.center,
            ),
          ),
          Image.asset(
            nutritionImage,
            width: size.width * 0.5 - 10,
            height: size.height * 0.1 + 10,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
