// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpli implements SearchRepo {
  ApiService apiService;
  SearchRepoImpli(this.apiService);

  @override
  Future<Either<Failure, BookModel>> fetchSearchedBooks(
      {required String searchedBook}) async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?Filtering=free-ebooks&q=$searchedBook&Sorting=relevance');

      BookModel bookModel = BookModel.fromJson(data);

      return Right(bookModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
