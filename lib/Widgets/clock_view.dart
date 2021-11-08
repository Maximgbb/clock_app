import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key, required this.size}) : super(key: key);

  final double size;

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final dateTime = DateTime.now();
  //60sec -> 360deg, 1sez -> 6deg

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);

    final fillBrush = Paint()..color = const Color(0xFF444974);

    final outlineBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 20;

    final centerFillBrush = Paint()..color = const Color(0xFFEAECFF);

    final secHandBrush = Paint()
      ..color = Colors.orange[300] ?? Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 60;

    final minHandBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 30;

    final hourHandBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFF6279AB)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 24;

    final dashBrush = Paint()
      ..color = const Color(0xFF7F7F99)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.5;

    canvas.drawCircle(center, radius * 0.75, fillBrush);
    canvas.drawCircle(center, radius * 0.75, outlineBrush);

    final hourHandX = centerX +
        radius *
            0.4 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    final hourHandY = centerY +
        radius *
            0.4 *
            -cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    final minHandX = centerX +
        radius *
            0.6 *
            sin((dateTime.minute * 6 + dateTime.second * 0.1) * pi / 180);
    final minHandY = centerY +
        radius *
            0.6 *
            -cos((dateTime.minute * 6 + dateTime.second * 0.1) * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    final secHandX =
        centerX + radius * 0.6 * sin(dateTime.second * 6 * pi / 180);
    final secHandY =
        centerY + radius * 0.6 * -cos(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, radius * 0.11, centerFillBrush);

    final outerCircleRadius = radius;
    final innerCircleRadius = radius * 0.9;
    for (double i = 0; i < 360; i += 12) {
      final x1 = centerX + outerCircleRadius * sin(i * pi / 180);
      final y1 = centerY + outerCircleRadius * -cos(i * pi / 180);

      final x2 = centerX + innerCircleRadius * sin(i * pi / 180);
      final y2 = centerY + innerCircleRadius * -cos(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
