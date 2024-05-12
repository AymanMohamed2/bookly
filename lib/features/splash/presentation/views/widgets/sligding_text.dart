import 'package:flutter/material.dart';

class SligdingText extends StatelessWidget {
  const SligdingText({super.key, required this.sligingAnimation});

  final Animation<Offset> sligingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: sligingAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: sligingAnimation,
          child: const Text(
            textAlign: TextAlign.center,
            'Read free books with bookly',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
