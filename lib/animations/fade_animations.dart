import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  const FadeAnimation(this.delay, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: const Duration(milliseconds: 500),
      child: child,
    );
  }
}
