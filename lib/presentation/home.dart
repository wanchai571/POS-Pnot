// ignore_for_file: avoid_unnecessary_containers, sort_child_properties_last

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  int _total = 0;
  int _green = 0;
  int _red = 0;
  int _other = 0;
  int _ups = 0;
  int _skl = 0;
  int _l = 0;

  int _foundItems = 0;
  int _readyLeave = 0;
  int _leave = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _selectDate(context);
                              },
                              child: Text(
                                'Select date',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "${selectedDate.toLocal()}".split(' ')[0],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        alignment: Alignment.center,
                        child: Text("Total: $_total"),
                      ),
                      _colorItems(_green, _red, _other),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        alignment: Alignment.center,
                        child: DottedLine(
                          lineThickness: 2,
                          dashLength: 3,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        alignment: Alignment.center,
                        child: Text("Pick Up"),
                      ),
                      _disposeItems(_ups, _skl, _l),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        alignment: Alignment.center,
                        child: DottedLine(
                          lineThickness: 2,
                          dashLength: 3,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "เจอของ (",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "$_foundItems",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "/ 6)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ของพร้อมปล่อย (",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "$_readyLeave",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "/ 6)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ปล่อยของ (",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "$_leave",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "/ 6)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Column(
                      children: [
                        _scanButton(),
                        SizedBox(height: 20),
                        _disposeItemButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Widget _colorItems(int green, int red, int other) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Text(
              "Green",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ": $green",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Red",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ": $red",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Other",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ": $other",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _disposeItems(int ups, int skl, int l) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Text(
              "UPS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ": $ups",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "SKL",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ": $skl",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "L",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ": $l",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _scanButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/scanList",
              arguments: {"datePick": "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}"});
        },
        child: Text("สแกนหาของ"),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.lightGreenAccent),
          textStyle: WidgetStateProperty.all(
            TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _disposeItemButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/disposeItem",
              arguments: {"datePick": "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}"});
        },
        child: Text("ปล่อยของ"),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.lightGreenAccent),
          textStyle: WidgetStateProperty.all(
            TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
