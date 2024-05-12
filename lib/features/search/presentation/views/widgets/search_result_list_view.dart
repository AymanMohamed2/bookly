import 'package:bookly_app/features/search/presentation/view_model/searched_books/searched_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/searched_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
      builder: (context, state) {
        if (state is SearchedBooksSuccess) {
          return Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.bookModel.items?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 25, left: 16),
                  child: SearchedBookItem(
                    controller: controller,
                    item: state.bookModel.items![index],
                  ),
                );
              },
            ),
          );
        } else if (state is SearchedBooksFailure) {
          return Container();
        } else if (state is SearchedBooksInitial) {
          return Container();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
