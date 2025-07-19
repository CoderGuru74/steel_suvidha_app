import 'package:flutter/material.dart';
import 'dart:math' as math;

class Particle {
  Offset position;
  double radius;
  double speed;
  Color color;
  double opacity;

  Particle({
    required this.position,
    required this.radius,
    required this.speed,
    required this.color,
    required this.opacity,
  });

  // Method to update particle position
  void update(Size size, double animationValue) {
    position = Offset(position.dx + speed, position.dy);

    // If particle moves off-screen, reset its position to the left side
    if (position.dx > size.width + radius) {
      position = Offset(-radius, math.Random().nextDouble() * size.height);
    }
  }
}

class ParticleBackgroundPainter extends CustomPainter {
  final Animation<double> animation;
  final List<Particle> particles; // List to hold all our particles

  // Constructor
  ParticleBackgroundPainter(this.animation, {int numberOfParticles = 50})
      : particles = List.generate(numberOfParticles, (index) {
          final random = math.Random();
          return Particle(
            position: Offset(
              random.nextDouble() * 1000, // Initial x, can be off-screen
              random.nextDouble() * 1000, // Initial y
            ),
            radius: random.nextDouble() * 1.5 + 0.5, // Small radius (0.5 to 2.0)
            speed: random.nextDouble() * 0.5 + 0.1, // Slow speed (0.1 to 0.6)
            color: Color.lerp(
              Colors.white.withOpacity(0.7),
              Colors.blueGrey.shade200.withOpacity(0.7),
              random.nextDouble(),
            )!, // Blend white and light blue-grey
            opacity: random.nextDouble() * 0.5 + 0.5, // Initial opacity (0.5 to 1.0)
          );
        }),
        super(repaint: animation); // Repaint when animation value changes

  @override
  void paint(Canvas canvas, Size size) {
    final double animationValue = animation.value;

    // Update and draw each particle
    for (var particle in particles) {
      // Update particle position (animationValue is used for subtle extra effects or general time progression)
      // Here, we'll let the Particle's own update method handle movement
      particle.update(size, animationValue);

      // Draw particle with pulsating opacity/glow
      final Paint particlePaint = Paint()
        ..color = particle.color.withOpacity(particle.opacity * (0.5 + 0.5 * math.sin(animationValue * math.pi * 2 + particle.position.dx * 0.01).abs()))
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, particle.radius * 2); // Blur for glow effect

      canvas.drawCircle(particle.position, particle.radius, particlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Repaint only if the animation value has changed
    return oldDelegate is ParticleBackgroundPainter && oldDelegate.animation.value != animation.value;
  }
}