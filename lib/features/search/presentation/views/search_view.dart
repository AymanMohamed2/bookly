import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_impli.dart';
import 'package:bookly_app/features/search/presentation/view_model/searched_books/searched_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchedBooksCubit(
        gitIt.get<SearchRepoImpli>()..fetchSearchedBooks(searchedBook: 'anime'),
      ),
      child: const Scaffold(
        body: SafeArea(
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
