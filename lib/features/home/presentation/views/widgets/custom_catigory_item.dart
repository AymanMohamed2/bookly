import 'package:flutter/material.dart';

class CatigoryItem extends StatelessWidget {
  const CatigoryItem({
    super.key,
    required this.catigoryName,
    required this.onPressed,
    required this.isPicked,
  });

  final void Function()? onPressed;
  final String catigoryName;
  final bool isPicked;

  @override
  Widget build(BuildContext context) {
    return isPicked
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: onPressed,
              child: Text(
                catigoryName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromARGB(255, 74, 5, 223),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 74, 5, 223),
              ),
              onPressed: onPressed,
              child: Text(
                catigoryName,
              ),
            ),
          );
  }
}
