import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SimilerBooksListView extends StatelessWidget {
  const SimilerBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CustomBookImage(
              imageUrl:
                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fhuman&psig=AOvVaw0NjYJ87wXxuSoykTTm-xaI&ust=1677324536010000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCOi4qfuGrv0CFQAAAAAdAAAAABAJ',
            ),
          );
        },
      ),
    );
    ;
  }
}
