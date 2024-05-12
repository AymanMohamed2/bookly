import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/details_view_action_button.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    final double scafoldWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const BookDetailsAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: scafoldWidth * 0.19, vertical: 16),
          child: BookItem(
            imageUrl: item.volumeInfo!.imageLinks?.thumbnail ?? '',
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          item.volumeInfo!.title ?? 'Book Name',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlayfairDisplay',
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          item.volumeInfo!.authors?[0] ?? 'Author Name',
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: Colors.white.withOpacity(0.72),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          count: item.volumeInfo!.pageCount ?? 0,
          ratting: 0,
        ),
        DetailsViewActionButton(
          item: item,
        ),
      ],
    );
  }
}
