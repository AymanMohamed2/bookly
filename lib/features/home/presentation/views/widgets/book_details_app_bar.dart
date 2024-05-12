import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 2),
        child: Row(
          children: [
            SizedBox(height: 19, child: Image.asset(AssetsData.logo)),
            const Spacer(),
            IconButton(
              onPressed: () {
                AppRouter.router.pop();
              },
              icon: const Icon(
                Icons.close,
                color: Color.fromARGB(255, 234, 234, 234),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
