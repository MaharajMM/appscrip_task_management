import 'package:flutter/material.dart';

class CustomAnimatedWidget extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;
  final Widget child;
  const CustomAnimatedWidget({
    super.key,
    required this.fadeAnimation,
    required this.slideAnimation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: slideAnimation,
        child: child,
      ),
    );
  }
}
