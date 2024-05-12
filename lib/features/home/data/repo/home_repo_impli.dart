import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/repo/home_repo.dart';
import 'package:dio/dio.dart';

class HomeRepoImpli implements HomeRepo {
  ApiService apiService;
  HomeRepoImpli(this.apiService);
  @override
  Future<Either<Failure, BookModel>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?Filtering=free-ebooks&q=subject:cinema&Sorting=newest');

      BookModel bookModel = BookModel.fromJson(data);

      return Right(bookModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchFeaturedBooks(
      {required String catigory}) async {
    try {
      var data = await apiService.get(
          endpoint: 'volumes?Filtering=free-ebooks&q=subject:$catigory');

      BookModel bookModel = BookModel.fromJson(data);

      return Right(bookModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchSimilarBooks(
      {required String catigory}) async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?Filtering=free-ebooks&q=subject:$catigory&Sorting=relevance');

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
