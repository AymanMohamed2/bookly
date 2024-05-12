import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/herizontal_catigories_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/herizontal_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              Padding(
                padding: EdgeInsets.only(left: 15, bottom: 12, top: 5),
                child: Text(
                  'Catigories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              HerizontalCatigoriesListView(),
              SizedBox(
                height: 15,
              ),
              HerizontalListView(),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 26, bottom: 18),
                child: Text(
                  'Trendy Books',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: NewsetBooksListView(),
        )
      ],
    );
  }
}
