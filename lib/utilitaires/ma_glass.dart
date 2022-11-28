import 'dart:ui';

import 'package:flutter/material.dart';

class MaGlass extends StatefulWidget {
  final double blur;
  final double opacity;
  final Widget child;

  const MaGlass({
    Key? key,
    required this.blur,
    required this.opacity,
    required this.child,

  }) : super(key: key);

  @override
  State<MaGlass> createState() => _MaGlassState();
}

class _MaGlassState extends State<MaGlass> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: widget.blur,
            sigmaY: widget.blur,
          ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(widget.opacity),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity(0.2),
            )
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
