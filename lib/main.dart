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

  setD4() {
    if (d4Controller.text == '') {
      num_d4 = 0;
    } else {
      num_d4 = int.parse(d4Controller.text).abs();
    }
    print('d4' + num_d4.toString());
  }

  setD6() {
    if (d6Controller.text == '') {
      num_d6 = 0;
    } else {
      num_d6 = int.parse(d6Controller.text).abs();
    }
    print('d6' + num_d6.toString());
  }

  setD8() {
    if (d8Controller.text == '') {
      num_d8 = 0;
    } else {
      num_d8 = int.parse(d8Controller.text).abs();
    }
    print('d8' + num_d8.toString());
  }

  setD10() {
    if (d10Controller.text == '') {
      num_d10 = 0;
    } else {
      num_d10 = int.parse(d10Controller.text).abs();
    }
    print('d10' + num_d10.toString());
  }

  setD12() {
    if (d12Controller.text == '') {
      num_d12 = 0;
    } else {
      num_d12 = int.parse(d12Controller.text).abs();
    }
    print('d12' + num_d12.toString());
  }

  setD20() {
    if (d20Controller.text == '') {
      num_d20 = 0;
    } else {
      num_d20 = int.parse(d20Controller.text).abs();
    }
    print('d20' + num_d20.toString());
  }

  setD100() {
    if (d100Controller.text == '') {
      num_d100 = 0;
    } else {
      num_d100 = int.parse(d100Controller.text).abs();
    }
    print('d100' + num_d100.toString());
  }

  setExtraPts() {
    if (eptsController.text == '') {
      num_epts = 0;
    } else {
      num_epts = int.parse(eptsController.text);
    }
    print('p' + num_epts.toString());
  }

  int roll_total = 100;

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
              color: Color(0xffffba08),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'd4',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        // decreases num_d4 by 1
                        iconSize: 36.0,
                        icon: Icon(Icons.remove),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (num_d4 <= 0) {
                              num_d4 = 0;
                            } else {
                              num_d4 -= 1;
                            }
                            d4Controller.text = num_d4.toString();
                          });
                        },
                      ),
                      SizedBox(
                        width: 100.0,
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.allow(RegExp("[0,1,2,3,4,5,6,7,8,9]")),
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
                      IconButton(
                        // increases num_d4 by 1
                        iconSize: 36.0,
                        icon: Icon(Icons.add),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            num_d4 += 1;
                            d4Controller.text = num_d4.toString();
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
              color: Color(0xfffaa307),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'd6',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        // decreases num_d6 by 1
                        iconSize: 36.0,
                        icon: Icon(Icons.remove),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (num_d6 <= 0) {
                              num_d6 = 0;
                            } else {
                              num_d6 -= 1;
                            }
                            d6Controller.text = num_d6.toString();
                          });
                        },
                      ),
                      SizedBox(
                        width: 100.0,
                        child: TextField(
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
                      IconButton(
                        // increases num_d6 by 1
                        iconSize: 36.0,
                        icon: Icon(Icons.add),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            num_d6 += 1;
                            d6Controller.text = num_d6.toString();
                          });
                        },
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: Color(0xfff48c06),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'd8',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
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
                            if (num_d8 <= 0) {
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
                            num_d8 += 1;
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
              color: Color(0xffe85d04),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'd10',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        // decreases num_d10 by 1
                        iconSize: 36.0,
                        icon: Icon(Icons.remove),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (num_d10 <= 0) {
                              num_d10 = 0;
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
                        // increases num_d10 by 1
                        iconSize: 36.0,
                        icon: Icon(Icons.add),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            num_d10 += 1;
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
              color: Color(0xffdc2f02),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'd12',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
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
                            if (num_d12 <= 0) {
                              num_d12 = 0;
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
                            num_d12 += 1;
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
              color: Color(0xffd00000),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'd20',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
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
                            if (num_d20 <= 0) {
                              num_d20 = 0;
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
                            num_d20 += 1;
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
              color: Color(0xff9d0208),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'd100',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        // decreases num_d100 by 1
                        iconSize: 36.0,
                        icon: Icon(Icons.remove),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (num_d100 <= 0) {
                              num_d100 = 0;
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
                        // increases num_d100 by 1
                        iconSize: 36.0,
                        icon: Icon(Icons.add),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            num_d100 += 1;
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
              color: Color(0xff6a040f),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    '+',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        // decreases num_epts by 1
                        iconSize: 36.0,
                        icon: Icon(Icons.remove),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (num_epts <= 0) {
                              num_epts = 0;
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
                        // increases num_epts by 1
                        iconSize: 36.0,
                        icon: Icon(Icons.add),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            num_epts += 1;
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
              color: Color(0xff370617),
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
                  color: Color(0xff370617),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ROLL',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
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
