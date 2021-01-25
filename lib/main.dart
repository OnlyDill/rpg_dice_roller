import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: DicePage()));
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  TextEditingController d4Controller = new TextEditingController();
  TextEditingController d6Controller = new TextEditingController();
  TextEditingController d8Controller = new TextEditingController();
  TextEditingController d10Controller = new TextEditingController();
  TextEditingController d12Controller = new TextEditingController();
  TextEditingController d20Controller = new TextEditingController();
  TextEditingController d100Controller = new TextEditingController();
  TextEditingController eptsController = new TextEditingController();

  int num_d4 = 0; // number of d4 dies
  int num_d6 = 0; // number of d6 dies
  int num_d8 = 0; // number of d8 dies
  int num_d10 = 0; // number of d10 dies
  int num_d12 = 0; // number of d12 dies
  int num_d20 = 0; // number of d20 dies
  int num_d100 = 0; // number of d100 dies
  int num_epts = 0; // number of extra points
  int min = 0; // min value for number of dies and points
  int max = 99; //max value for number of dies and points

  // booleans to check for long holding of buttons
  bool isPressed_d4_minus = false;
  bool isPressed_d4_plus = false;
  bool isPressed_d6_minus = false;
  bool isPressed_d6_plus = false;
  bool isPressed_d8_minus = false;
  bool isPressed_d8_plus = false;
  bool isPressed_d10_minus = false;
  bool isPressed_d10_plus = false;

  void setD4() {
    if (d4Controller.text == '') {
      num_d4 = 0; // if text-box empty, reset num_d4 back to 0
    } else {
      num_d4 = int.parse(d4Controller.text).abs();
    }
  }

  void setD6() {
    if (d6Controller.text == '') {
      num_d6 = 0; // if text-box empty, reset num_d6 back to 0
    } else {
      num_d6 = int.parse(d6Controller.text).abs();
    }
  }

  void setD8() {
    if (d8Controller.text == '') {
      num_d8 = 0; // if text-box empty, reset num_d8 back to 0
    } else {
      num_d8 = int.parse(d8Controller.text).abs();
    }
    print('d8' + num_d8.toString());
  }

  void setD10() {
    if (d10Controller.text == '') {
      num_d10 = 0; // if text-box empty, reset num_d10 back to 0
    } else {
      num_d10 = int.parse(d10Controller.text).abs();
    }
    print('d10' + num_d10.toString());
  }

  void setD12() {
    if (d12Controller.text == '') {
      num_d12 = 0; // if text-box empty, reset num_d12 back to 0
    } else {
      num_d12 = int.parse(d12Controller.text).abs();
    }
    print('d12' + num_d12.toString());
  }

  void setD20() {
    if (d20Controller.text == '') {
      num_d20 = 0; // if text-box empty, reset num_d20 back to 0
    } else {
      num_d20 = int.parse(d20Controller.text).abs();
    }
    print('d20' + num_d20.toString());
  }

  void setD100() {
    if (d100Controller.text == '') {
      num_d100 = 0; // if text-box empty, reset num_d100 back to 0
    } else {
      num_d100 = int.parse(d100Controller.text).abs();
    }
    print('d100' + num_d100.toString());
  }

  void setExtraPts() {
    if (eptsController.text == '') {
      num_epts = 0; // if text-box empty, reset num_epts back to 0
    } else {
      num_epts = int.parse(eptsController.text);
    }
    print('p' + num_epts.toString());
  }

  int roll_total = 0;

  // calcRoll() calculates the roll_total
  void calcRoll() {
    while (num_d4 > 0) {
      roll_total += (Random().nextInt(4) + 1);
      num_d4 -= 1;
    }
    while (num_d6 > 0) {
      roll_total += (Random().nextInt(6) + 1);
      num_d6 -= 1;
    }
    while (num_d8 > 0) {
      roll_total += (Random().nextInt(8) + 1);
      num_d8 -= 1;
    }
    while (num_d10 > 0) {
      roll_total += (Random().nextInt(10) + 1);
      num_d10 -= 1;
    }
    while (num_d12 > 0) {
      roll_total += (Random().nextInt(12) + 1);
      num_d12 -= 1;
    }
    while (num_d20 > 0) {
      roll_total += (Random().nextInt(20) + 1);
      num_d20 -= 1;
    }
    while (num_d100 > 0) {
      roll_total += (Random().nextInt(100) + 1);
      num_d100 -= 1;
    }

    roll_total += num_epts;
  }

  @override
  void initState() {
    super.initState();
    d4Controller.addListener(setD4);
    d6Controller.addListener(setD6);
    d8Controller.addListener(setD8);
    d10Controller.addListener(setD10);
    d12Controller.addListener(setD12);
    d20Controller.addListener(setD20);
    d100Controller.addListener(setD100);
    eptsController.addListener(setExtraPts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff457B9D),
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ColoredBox(
              color: Color(0xfff3722c),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'd4',
                    style: TextStyle(
                      letterSpacing: 7.0,
                      fontFamily: 'DoHyeon',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        child: IconButton(
                          // decreases num_d4 by 1
                          iconSize: 36.0,
                          icon: Icon(Icons.remove),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              if (num_d4 <= min) {
                                // prevent num_d4 from going < min
                                num_d4 = min;
                              } else {
                                // if num_d4 is not min, subtract 1
                                num_d4 -= 1;
                              }
                              d4Controller.text = num_d4.toString();
                            });
                          },
                        ),
                        onLongPressStart: (LongPressStartDetails details) async{
                          isPressed_d4_minus = true;
                          do {
                            if (num_d4 <= min) {
                              // prevent num_d4 from going < min
                              num_d4 = min;
                            } else {
                              // if num_d4 is not min, subtract 1
                              num_d4 -= 1;
                            }
                            setState(() {
                              d4Controller.text = num_d4.toString();
                            });
                            await Future.delayed(Duration(milliseconds: 150));
                          } while (isPressed_d4_minus);
                        },
                        onLongPressEnd: (LongPressEndDetails details) {
                          setState(() {
                            isPressed_d4_minus = false;
                          });
                        },
                      ),
                      SizedBox(
                        width: 100.0,
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.allow(
                                RegExp("[0,1,2,3,4,5,6,7,8,9]")),
                          ],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          controller: d4Controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: '0',
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: IconButton(
                          // increases num_d4 by 1
                          iconSize: 36.0,
                          icon: Icon(Icons.add),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              if (num_d4 >= max) {
                                // prevent num_d4 going over max
                                num_d4 = max;
                              } else {
                                // if num_d4 is not at max,
                                num_d4 += 1;
                              }
                              d4Controller.text = num_d4.toString();
                            });
                          },
                        ),
                        onLongPressStart: (LongPressStartDetails details) async{
                          isPressed_d4_plus = true;
                          do {
                            if (num_d4 >= max) {
                              // prevent num_d4 going over max
                              num_d4 = max;
                            } else {
                              // if num_d4 is not at max,
                              num_d4 += 1;
                            }
                            setState(() {
                              d4Controller.text = num_d4.toString();
                            });
                            await Future.delayed(Duration(milliseconds: 150));
                          } while (isPressed_d4_plus);
                        },
                        onLongPressEnd: (LongPressEndDetails details) {
                          setState(() {
                            isPressed_d4_plus = false;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: Color(0xfff8961e),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'd6',
                    style: TextStyle(
                      letterSpacing: 7.0,
                      fontFamily: 'DoHyeon',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        child: IconButton(
                          // decreases num_d6 by 1
                          iconSize: 36.0,
                          icon: Icon(Icons.remove),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              if (num_d6 <= min) {
                                // prevent num_d6 from going < min
                                num_d6 = min;
                              } else {
                                // if num_d6 is not min, subtract 1
                                num_d6 -= 1;
                              }
                              d6Controller.text = num_d6.toString();
                            });
                          },
                        ),
                        onLongPressStart: (LongPressStartDetails details) async{
                          isPressed_d6_minus = true;
                          do {
                            if (num_d6 <= min) {
                              // prevent num_d6 from going < min
                              num_d6 = min;
                            } else {
                              // if num_d6 is not min, subtract 1
                              num_d6 -= 1;
                            }
                            setState(() {
                              d6Controller.text = num_d6.toString();
                            });
                            await Future.delayed(Duration(milliseconds: 150));
                          } while (isPressed_d6_minus);
                        },
                        onLongPressEnd: (LongPressEndDetails details) {
                          setState(() {
                            isPressed_d6_minus = false;
                          });
                        },
                      ),
                      SizedBox(
                        width: 100.0,
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.allow(
                                RegExp("[0,1,2,3,4,5,6,7,8,9]")),
                          ],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          controller: d6Controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: '0',
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: IconButton(
                          // increases num_d6 by 1
                          iconSize: 36.0,
                          icon: Icon(Icons.add),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              if (num_d6 >= max) {
                                // prevent num_d4 going over max
                                num_d6 = max;
                              } else {
                                // if num_d6 is not at max,
                                num_d6 += 1;
                              }
                              d6Controller.text = num_d6.toString();
                            });
                          },
                        ),
                        onLongPressStart: (LongPressStartDetails details) async{
                          isPressed_d6_plus = true;
                          do {
                            if (num_d6 >= max) {
                              // prevent num_d6 going over max
                              num_d6 = max;
                            } else {
                              // if num_d6 is not at max,
                              num_d6 += 1;
                            }
                            setState(() {
                              d6Controller.text = num_d6.toString();
                            });
                            await Future.delayed(Duration(milliseconds: 150));
                          } while (isPressed_d6_plus);
                        },
                        onLongPressEnd: (LongPressEndDetails details) {
                          setState(() {
                            isPressed_d6_plus = false;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: Color(0xfff9844a),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'd8',
                    style: TextStyle(
                      letterSpacing: 7.0,
                      fontFamily: 'DoHyeon',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        // decreases num_d8 by 1
                        iconSize: 36.0,
                        icon: Icon(Icons.remove),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (num_d8 <= min) {
                              num_d8 = 0;
                            } else {
                              num_d8 -= 1;
                            }
                            d8Controller.text = num_d8.toString();
                          });
                        },
                      ),
                      SizedBox(
                        width: 100.0,
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.allow(
                                RegExp("[0,1,2,3,4,5,6,7,8,9]")),
                          ],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          controller: d8Controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: '0',
                          ),
                        ),
                      ),
                      IconButton(
                        // increases num_d8 by 1
                        iconSize: 36.0,
                        icon: Icon(Icons.add),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (num_d8 >= max) {
                              num_d8 = 99;
                            } else {
                              num_d8 += 1;
                            }
                            d8Controller.text = num_d8.toString();
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: Color(0xfff9c74f),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'd10',
                    style: TextStyle(
                      letterSpacing: 7.0,
                      fontFamily: 'DoHyeon',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        // decreases num_d10 by 1 if num_d10 > min
                        iconSize: 36.0,
                        icon: Icon(Icons.remove),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (num_d10 <= min) {
                              num_d10 = min;
                            } else {
                              num_d10 -= 1;
                            }
                            d10Controller.text = num_d10.toString();
                          });
                        },
                      ),
                      SizedBox(
                        width: 100.0,
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.allow(
                                RegExp("[0,1,2,3,4,5,6,7,8,9]")),
                          ],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          controller: d10Controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: '0',
                          ),
                        ),
                      ),
                      IconButton(
                        // increases num_d10 by 1 if num_d10 < max
                        iconSize: 36.0,
                        icon: Icon(Icons.add),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (num_d10 >= max) {
                              num_d10 = max;
                            } else {
                              num_d10 += 1;
                            }
                            d10Controller.text = num_d10.toString();
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: Color(0xff90be6d),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'd12',
                    style: TextStyle(
                      letterSpacing: 7.0,
                      fontFamily: 'DoHyeon',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        // decreases num_d12 by 1
                        iconSize: 36.0,
                        icon: Icon(Icons.remove),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (num_d12 <= min) {
                              num_d12 = min;
                            } else {
                              num_d12 -= 1;
                            }
                            d12Controller.text = num_d12.toString();
                          });
                        },
                      ),
                      SizedBox(
                        width: 100.0,
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.allow(
                                RegExp("[0,1,2,3,4,5,6,7,8,9]")),
                          ],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          controller: d12Controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: '0',
                          ),
                        ),
                      ),
                      IconButton(
                        // increases num_d12 by 1
                        iconSize: 36.0,
                        icon: Icon(Icons.add),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (num_d12 >= max) {
                              num_d12 = max;
                            } else {
                              num_d12 += 1;
                            }
                            d12Controller.text = num_d12.toString();
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: Color(0xff43aa8b),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'd20',
                    style: TextStyle(
                      letterSpacing: 7.0,
                      fontFamily: 'DoHyeon',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        // decreases num_d20 by 1
                        iconSize: 36.0,
                        icon: Icon(Icons.remove),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (num_d20 <= min) {
                              num_d20 = min;
                            } else {
                              num_d20 -= 1;
                            }
                            d20Controller.text = num_d20.toString();
                          });
                        },
                      ),
                      SizedBox(
                        width: 100.0,
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.allow(
                                RegExp("[0,1,2,3,4,5,6,7,8,9]")),
                          ],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          controller: d20Controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: '0',
                          ),
                        ),
                      ),
                      IconButton(
                        // increases num_d20 by 1
                        iconSize: 36.0,
                        icon: Icon(Icons.add),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (num_d20 >= max) {
                              num_d20 = max;
                            } else {
                              num_d20 += 1;
                            }
                            d20Controller.text = num_d20.toString();
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: Color(0xff4d908e),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'd100',
                    style: TextStyle(
                      letterSpacing: 7.0,
                      fontFamily: 'DoHyeon',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        // decreases num_d100 by 1 if num_d100 < min
                        iconSize: 36.0,
                        icon: Icon(Icons.remove),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (num_d100 <= min) {
                              num_d100 = min;
                            } else {
                              num_d100 -= 1;
                            }
                            d100Controller.text = num_d100.toString();
                          });
                        },
                      ),
                      SizedBox(
                        width: 100.0,
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.allow(
                                RegExp("[0,1,2,3,4,5,6,7,8,9]")),
                          ],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          controller: d100Controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: '0',
                          ),
                        ),
                      ),
                      IconButton(
                        // increases num_d100 by 1 if num_d100 < max
                        iconSize: 36.0,
                        icon: Icon(Icons.add),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (num_d100 >= max) {
                              num_d100 = max;
                            } else {
                              num_d100 += 1;
                            }
                            d100Controller.text = num_d100.toString();
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: Color(0xff577590),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    '+',
                    style: TextStyle(
                      letterSpacing: 7.0,
                      fontFamily: 'DoHyeon',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        // decreases num_epts by 1 if num_epts > min
                        iconSize: 36.0,
                        icon: Icon(Icons.remove),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (num_epts <= min) {
                              num_epts = min;
                            } else {
                              num_epts -= 1;
                            }
                            eptsController.text = num_epts.toString();
                          });
                        },
                      ),
                      SizedBox(
                        width: 100.0,
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.allow(
                                RegExp("[0,1,2,3,4,5,6,7,8,9]")),
                          ],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          controller: eptsController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: '0',
                          ),
                        ),
                      ),
                      IconButton(
                        // increases num_epts by 1 if num_epts < max
                        iconSize: 36.0,
                        icon: Icon(Icons.add),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (num_epts >= max) {
                              num_epts = max;
                            } else {
                              num_epts += 1;
                            }
                            eptsController.text = num_epts.toString();
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xff277da1),
              child: TextButton(
                onPressed: () {
                  calcRoll();
                  showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text('Your Roll'),
                          content: Text('$roll_total'),
                          actions: [
                            FlatButton(
                              child: Text('Roll Again'),
                              onPressed: () {
                                setState(() {
                                  roll_total = 0;
                                  d4Controller.text = "";
                                  d6Controller.text = "";
                                  d8Controller.text = "";
                                  d10Controller.text = "";
                                  d12Controller.text = "";
                                  d20Controller.text = "";
                                  d100Controller.text = "";
                                  eptsController.text = "";
                                });
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      });
                },
                child: ColoredBox(
                  color: Color(0xff277da1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ROLL',
                        style: TextStyle(
                          letterSpacing: 7.0,
                          fontFamily: 'DoHyeon',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 70,
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
    );
  }
}
