import 'package:flutter/material.dart';
import 'dart:math' as math; // For sine/cosine functions

class AnimatedBackgroundPainter extends CustomPainter {
  final Animation<double> animation; // The animation value (0.0 to 1.0)

  AnimatedBackgroundPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final double animationValue = animation.value;

    // Base colors (can be customized for your metal theme)
    final Color color1 = Color.lerp(
      const Color(0xFFE0E0E0), // Light grey/steel
      const Color(0xFFA0A0A0), // Medium grey/steel
      animationValue,
    )!;
    final Color color2 = Color.lerp(
      const Color(0xFFC0C0C0), // Another light grey
      const Color(0xFF808080), // Darker grey
      animationValue,
    )!;
    final Color accentColor = Color.lerp(
      const Color(0xFFFFCC80), // Warm copper/orange (for subtle glow)
      const Color(0xFFFFB74D), // Deeper orange
      animationValue,
    )!;

    // Paint for the main waves
    final Paint wavePaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        colors: [color1, color2],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Paint for the accent (glowing) lines
    final Paint accentWavePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0 + (math.sin(animationValue * math.pi * 2) * 1.5) // Oscillating width
      ..color = accentColor.withOpacity(0.8) // Semi-transparent glow
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3.0); // Subtle blur for glow effect

    // --- Drawing Animated Waves ---
    final double waveHeight = size.height * 0.15;
    final double waveLength = size.width * 0.8;
    final double offsetX = animationValue * size.width * 0.5; // Move waves horizontally

    // Wave 1
    Path path1 = Path();
    path1.moveTo(0, size.height * 0.3 + (math.sin(animationValue * math.pi * 2) * waveHeight * 0.2));
    for (double i = 0; i <= size.width; i += 10) {
      path1.lineTo(
        i,
        size.height * 0.3 +
            (math.sin((i / waveLength * math.pi * 2) + animationValue * math.pi * 2) * waveHeight) - offsetX,
      );
    }
    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    path1.close();
    canvas.drawPath(path1, wavePaint);

    // Wave 2 (offset from wave 1)
    Path path2 = Path();
    path2.moveTo(0, size.height * 0.6 + (math.cos(animationValue * math.pi * 2) * waveHeight * 0.2));
    for (double i = 0; i <= size.width; i += 10) {
      path2.lineTo(
        i,
        size.height * 0.6 +
            (math.cos((i / waveLength * math.pi * 2) + animationValue * math.pi * 2) * waveHeight) + offsetX,
      );
    }
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.close();
    canvas.drawPath(path2, wavePaint);


    // --- Drawing Accent Lines / Streaks ---
    // These lines move and change opacity
    final int numberOfStreaks = 5;
    for (int i = 0; i < numberOfStreaks; i++) {
      final double startY = (size.height / (numberOfStreaks + 1)) * (i + 1);
      final double endY = startY;

      // Calculate x position based on animation value for horizontal movement
      final double animatedX = (size.width + 100) * ((animationValue + (i * 0.1)) % 1.0) - 50;

      // Draw a short horizontal line
      canvas.drawLine(Offset(animatedX, startY), Offset(animatedX + 80, endY), accentWavePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Only repaint if the animation value has changed
    return oldDelegate is AnimatedBackgroundPainter && oldDelegate.animation.value != animation.value;
  }
}