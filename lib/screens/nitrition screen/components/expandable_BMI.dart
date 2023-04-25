import 'package:flutter/material.dart';

import '../../../constants.dart';

class ExpandableInBMI extends StatefulWidget {
  @override
  _ExpandableInBMI createState() {
    return _ExpandableInBMI();
  }
}

class _ExpandableInBMI extends State {
  bool _isVisible = false;
  bool _male = true;
  bool _female = true;
  String dropdownValue = 'Rarely or not exercise';
  dynamic bmi, bmr, calor;
  dynamic age, high, weight, sex, active;
  TextEditingController ageController = new TextEditingController();
  TextEditingController highController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();

  //To get Bmi and weight to display in profile

  //It is rounded variable
  String? bmi1, bmr1, calor1;

  void bmiCaculator() {
    bmi = weight / ((high / 100) * (high / 100));
    bmi1 = (bmi).toStringAsFixed(1);
    print('bmi: $bmi');
    print(bmi1);
  }

  void bmrCaculator() {
    if (sex == 1)
      bmr = (10 * weight) + (6.25 * high) - (5 * age) + 5;
    else
      bmr = (10 * weight) + (6.25 * high) - (5 * age) - 161;
    bmr1 = (bmr).toStringAsFixed(1);
  }

  void caloNeeded() {
    switch (dropdownValue) {
      case 'Rarely or not exercise':
        calor = bmr * 1.2;
        calor1 = (calor).toStringAsFixed(1);
        break;
      case 'Lightly (Exercise 1-3 days/week)':
        calor = bmr * 1.35;
        calor1 = (calor).toStringAsFixed(1);
        break;
      case 'Regularly (Exercise 3-5 days/week)':
        calor = bmr * 1.55;
        calor1 = (calor).toStringAsFixed(1);
        break;
      case 'Active (Exercise 6-7 days/week)':
        calor = bmr * 1.8;
        calor1 = (calor).toStringAsFixed(1);
        break;
      case 'Weighly (High intensity exercise 6-7\ndays/week)':
        calor = bmr * 1.95;
        calor1 = (calor).toStringAsFixed(1);
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ageController.dispose();
    highController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var textStyle = TextStyle(
        fontSize: 20,
        height: 2.0,
        fontFamily: 'Poppins-Light',
        fontWeight: FontWeight.w400,
        color: Colors.black);
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            width: size.width * 0.9,
            height: size.height * 0.5 - 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: kBMI_Caculator,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          sex = 1;
                          _male = !_male;
                          _female = !_male;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        height: size.height * 0.1 - 40,
                        width: size.width * 0.3 - 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: _male ? Color(0xE6F6EBEB) : Colors.white,
                        ),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.male),
                                ),
                                TextSpan(
                                  text: ' Male',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: 'Poppin-Light',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          sex = 2;
                          _female = !_female;
                          _male = !_female;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        height: size.height * 0.1 - 40,
                        width: size.width * 0.3 - 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: _female ? Color(0xE6F6EBEB) : Colors.white,
                        ),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.female),
                                ),
                                TextSpan(
                                  text: 'Female',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: 'Poppin-Light',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  leading: Text(
                    'Age',
                    style: textStyle,
                  ),
                  title: SizedBox(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: ageController,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  trailing: Text(
                    'years',
                    style: textStyle,
                  ),
                ),
                ListTile(
                  leading: Text(
                    'High',
                    style: textStyle,
                  ),
                  title: SizedBox(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: highController,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  trailing: Text(
                    'cm',
                    style: textStyle,
                  ),
                ),
                ListTile(
                  leading: Text(
                    'Weight',
                    style: textStyle,
                  ),
                  title: SizedBox(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: weightController,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  trailing: Text(
                    'kg',
                    style: textStyle,
                  ),
                ),
                ListTile(
                  leading: Text(
                    'Active: ',
                    style: textStyle,
                  ),
                  title: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Poppin-Light'),
                    underline: Container(
                      height: 1,
                      color: Colors.black,
                    ),
                    onChanged: (String? newValue) {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
                      'Rarely or not exercise',
                      'Lightly (Exercise 1-3 days/week)',
                      'Regularly (Exercise 3-5 days/week)',
                      'Active (Exercise 6-7 days/week)',
                      'Weighly (High intensity exercise 6-7\ndays/week)'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: ElevatedButton.icon(
                    label: Text(
                      'Calculate BMI',
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                    icon: Icon(
                      Icons.calculate_outlined,
                      size: 18,
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                        age = int.parse(ageController.text);
                        high = double.parse(highController.text);
                        weight = double.parse(weightController.text);
                        bmiCaculator();
                        bmrCaculator();
                        caloNeeded();
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xE68FCB91)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.white))),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: _isVisible,
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              height: size.height * 0.2,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF808FCB91),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Text(
                    'Your BMI is: $bmi1\n Your BMR is: $bmr1\n Minimum daily calorie intake: $calor1',
                    style: TextStyle(
                      fontSize: 18,
                      height: 2.2,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF026606),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
