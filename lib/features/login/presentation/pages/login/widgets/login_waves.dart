import 'package:flutter/material.dart';

/// A stateless widget that renders a full-screen custom painted wave design.
///
/// This widget uses a [CustomPaint] widget with a [_HeaderWavePainter] to
/// draw wave patterns that cover the entire screen. It is typically used
/// as a decorative background in the login page.
class LoginWaves extends StatelessWidget {
  const LoginWaves({super.key});

  @override
  Widget build(_) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderWavePainter()),
    );
  }
}

/// A custom painter that draws a wave pattern using quadratic Bezier curves.
///
/// This painter creates a wave design by drawing a path with two quadratic
/// Bezier curves, filling it with a specified color. The wave spans the
/// width of the canvas and occupies a quarter of the height. The painter
/// is used to render decorative wave patterns in the background of a widget.
class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    lapiz.color = Color(0xFF7C4DFF);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = Path();

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.30,
      size.width * 0.5,
      size.height * 0.25,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.20,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
