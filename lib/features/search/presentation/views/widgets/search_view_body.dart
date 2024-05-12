import 'package:bookly_app/features/search/presentation/view_model/searched_books/searched_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSearchTextField(
          controller: controller,
          onChanged: (value) {
            BlocProvider.of<SearchedBooksCubit>(context)
                .fetchSearchedBooks(searchedBook: value);
          },
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15, top: 8, bottom: 20),
          child: Text(
            'Search Result',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SearchResultListView(
          controller: controller,
        ),
      ],
    );
  }
}
