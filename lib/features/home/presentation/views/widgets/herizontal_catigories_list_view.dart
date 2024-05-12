import 'package:bookly_app/features/home/presentation/view_model/featured_books/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_catigory_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HerizontalCatigoriesListView extends StatefulWidget {
  const HerizontalCatigoriesListView({super.key});

  @override
  State<HerizontalCatigoriesListView> createState() =>
      _HerizontalCatigoriesListViewState();
}

class _HerizontalCatigoriesListViewState
    extends State<HerizontalCatigoriesListView> {
  int currentIndex = 0;

  List<String> catigories = const [
    'Anime',
    'Science',
    'Politician',
    'Economy',
    'Programming',
    'Sports',
    'Games',
    'Languages',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 5),
      child: SizedBox(
        height: 45,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: catigories.length,
          itemBuilder: (context, index) {
            return CatigoryItem(
              isPicked: currentIndex == index,
              catigoryName: catigories[index],
              onPressed: () {
                currentIndex = index;
                BlocProvider.of<FeaturedBooksCubit>(context)
                    .fetchFeaturedBooks(catigory: catigories[index]);
                setState(() {});
              },
            );
          },
        ),
      ),
    );
  }
}
