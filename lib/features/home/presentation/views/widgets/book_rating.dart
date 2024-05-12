import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.ratting,
    required this.count,
  });
  final MainAxisAlignment mainAxisAlignment;
  final int ratting;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.star_rate_rounded,
          color: Colors.amber,
        ),
        Text(
          '$ratting',
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        Text(
          ' ($count)',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
