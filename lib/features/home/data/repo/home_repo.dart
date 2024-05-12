import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, BookModel>> fetchFeaturedBooks(
      {required String catigory});
  Future<Either<Failure, BookModel>> fetchNewestBooks();

  Future<Either<Failure, BookModel>> fetchSimilarBooks(
      {required String catigory});
}
