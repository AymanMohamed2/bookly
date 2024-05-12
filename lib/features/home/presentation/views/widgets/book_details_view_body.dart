import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/recommended_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              BookDetailsSection(
                item: item,
              ),
              const Expanded(
                child: SizedBox(
                  height: 1,
                ),
              ),
              const RecommendedBooksSection(),
              const SizedBox(
                height: 28,
              ),
            ],
          ),
        )
      ],
    );
  }
}
