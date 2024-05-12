import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 16),
      child: SafeArea(
        child: Row(
          children: [
            const Spacer(
              flex: 4,
            ),
            SizedBox(height: 22, child: Image.asset(AssetsData.logo)),
            const Spacer(
              flex: 3,
            ),
            IconButton(
              onPressed: () {
                AppRouter.router.push('/SearchView');
              },
              icon: const Icon(
                Icons.search,
                size: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
