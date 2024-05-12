import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'searched_books_state.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  SearchedBooksCubit(this.searchRepo) : super(SearchedBooksInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchedBooks({required String searchedBook}) async {
    emit(SearchedBooksLoading());

    var result =
        await searchRepo.fetchSearchedBooks(searchedBook: searchedBook);
    result.fold((failure) {
      emit(SearchedBooksFailure(failure.errorMessage));
    }, (books) {
      emit(SearchedBooksSuccess(books));
    });
  }
}
