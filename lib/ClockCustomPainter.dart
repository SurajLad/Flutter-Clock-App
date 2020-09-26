import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClockCustomPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var centerPoint = Offset(centerX, centerY);
    var radius = centerX / 1.25;

    var centerFillBrush = Paint()..color = Colors.white24; //  White
    var centerSmallFillBrush = Paint()..color = Colors.white; //  Blue

    var outlineBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    var secHandBrush = Paint()
      ..color = Color(0xFFFA1F28)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;

    var minHandBrush = Paint()
      ..color = Color(0xFFF4F4F5)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7;

    var hourHandBrush = Paint()
      ..color = Color(0xFFF4F4F5)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 11;

    var hourHandX = centerX +
        40 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX +
        40 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    var minHandX = centerX + 70 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 70 * sin(dateTime.minute * 6 * pi / 180);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);

    canvas.drawCircle(centerPoint, radius, outlineBrush); // White Outline

    canvas.drawCircle(
        centerPoint, radius / 1.8, centerFillBrush); // White24 Small Center

    // Clock hr/Min/Sec Strokes
    canvas.drawLine(centerPoint, Offset(hourHandX, hourHandY), hourHandBrush);
    canvas.drawLine(centerPoint, Offset(minHandX, minHandY), minHandBrush);
    canvas.drawLine(centerPoint, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(centerPoint, radius / 8.5, centerSmallFillBrush);

    for (double i = 0; i < 360; i += 30) {
      var x2 = centerX + (radius - 25) * cos(i * pi / 180);
      var y2 = centerX + (radius - 25) * sin(i * pi / 180);

      canvas.drawCircle(
          Offset(x2, y2), 3, centerSmallFillBrush); // White Extra Small Center
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
