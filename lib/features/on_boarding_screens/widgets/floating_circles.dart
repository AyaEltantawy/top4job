import 'package:flutter/material.dart';
import 'package:top4job/core/theming/colors.dart';

class FloatingCircles extends StatelessWidget {
  const FloatingCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 200,
      child: Stack(
        children: const [
          Positioned(
            top: 20,
            left: 100,
            child: CircleDot(radius: 8, color: ColorsManager.blue),
          ),
          Positioned(
            top: 49,
            left: 5,
            child: CircleDot(radius: 11, color: ColorsManager.blue),
          ),
          Positioned(
            top: 70,
            right: 170,
            child: CircleDot(radius: 6, color: ColorsManager.blueTint),
          ),
          Positioned(
            top: 100,
            left: 90,
            child: CircleDot(radius: 10, color: ColorsManager.blueTint),
          ),
        ],
      ),
    );
  }
}

class CircleDot extends StatelessWidget {
  final double radius;
  final Color color;

  const CircleDot({super.key, required this.radius, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
