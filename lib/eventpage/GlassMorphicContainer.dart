import 'dart:ui';
import 'package:flutter/material.dart';

class GlassmorphicContainer1 extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double sigmaX;
  final double sigmaY;
  const GlassmorphicContainer1(
      {super.key,
        required this.child,
        required this.borderRadius,
        this.sigmaX = 2,
        this.sigmaY = 3});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 15 ,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white38,
          width: 3,
        ),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.4),
            Colors.white.withOpacity(0),
            Colors.white.withOpacity(0.4),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
          child: child,
        ),
      ),
    );
  }
}