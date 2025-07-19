import 'package:flutter/material.dart';
import 'dart:math' as math;

class ScanningBackgroundPainter extends CustomPainter {
  final Animation<double> animation;

  ScanningBackgroundPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final double animationValue = animation.value; // Value from 0.0 to 1.0

    // Define the scanning line's properties
    final double lineHeight = 3.0; // Thickness of the scanning line
    final Color lineColor = const Color(0xFFB8CEE4); // Your primary app color, or another bright color
    final double glowRadius = 15.0; // How far the glow extends

    // Calculate the vertical position of the scanning line
    // The animation value goes from 0.0 to 1.0. We want it to go down then up.
    // So, we use a bounce curve or similar to map 0-1 to 0-1-0 effectively.
    // A simpler way: 0.0 -> 0.5 (moves down), 0.5 -> 1.0 (moves up)
    double yPos;
    if (animationValue <= 0.5) {
      yPos = size.height * (animationValue * 2); // Moves from 0% to 100% height
    } else {
      yPos = size.height * (1 - ((animationValue - 0.5) * 2)); // Moves from 100% to 0% height
    }

    // Ensure the line stays within bounds for its height
    yPos = yPos.clamp(lineHeight / 2, size.height - lineHeight / 2);

    // Create the paint for the line with a glowing effect
    final Paint linePaint = Paint()
      ..color = lineColor.withOpacity(0.8) // Base color for the line
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineHeight
      ..strokeCap = StrokeCap.round // Rounded ends for the line
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, glowRadius * (0.5 + 0.5 * math.sin(animationValue * math.pi * 2).abs())); // Pulsating glow

    // Draw the scanning line
    canvas.drawLine(Offset(0, yPos), Offset(size.width, yPos), linePaint);

    // Optional: Add multiple lines or a subtle background pattern for more detail
    // For example, subtle horizontal grid lines
    final Paint gridPaint = Paint()
      ..color = Colors.white.withOpacity(0.05) // Very faint white lines
      ..strokeWidth = 0.5;
    
    int numGridLines = 20;
    for (int i = 0; i < numGridLines; i++) {
      double gy = (size.height / (numGridLines - 1)) * i;
      canvas.drawLine(Offset(0, gy), Offset(size.width, gy), gridPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is ScanningBackgroundPainter && oldDelegate.animation.value != animation.value;
  }
}