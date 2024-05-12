import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:bookly_app/core/utils/functions/lunch_url.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DetailsViewActionButton extends StatelessWidget {
  const DetailsViewActionButton({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () {},
              text: '0.0 \$',
              backgroundColor: const Color.fromARGB(255, 237, 236, 236),
              textColor: Colors.black,
              rightDimetions: 0,
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                lunchCustomUrl(context, item.volumeInfo!.previewLink);
              },
              text: 'Free preview',
              backgroundColor: const Color.fromARGB(216, 6, 196, 38),
              textColor: Colors.white,
              leftDimetions: 0,
            ),
          ),
        ],
      ),
    );
  }
}
