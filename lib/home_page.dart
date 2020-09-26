import 'dart:async';
import 'dart:math';

import 'package:clock_app/ClockCustomPainter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1416B8),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Clock - Using CustomPainter",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 300,
              height: 300,
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockCustomPainter(),
                ),
              ),
            ),
            Text(DateFormat('dd-MM-yyyy – hh:mm:ss').format(DateTime.now()),
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
