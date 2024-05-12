import 'package:bookly_app/features/home/presentation/views/widgets/recommended_books_list_view.dart';
import 'package:flutter/material.dart';

class RecommendedBooksSection extends StatelessWidget {
  const RecommendedBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            'You can also like',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        RecommendedBooksListView(),
      ],
    );
  }
}
