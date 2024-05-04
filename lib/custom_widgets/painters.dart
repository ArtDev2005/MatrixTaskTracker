import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter{
  final Color color;
  CirclePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size){
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 20, Paint()..color = this.color);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}