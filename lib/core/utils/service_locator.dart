import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/repo/home_repo_impli.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_impli.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final gitIt = GetIt.instance;

void setUpServiceLocator() {
  gitIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  gitIt.registerSingleton<HomeRepoImpli>(
    HomeRepoImpli(
      gitIt.get<ApiService>(),
    ),
  );
  gitIt.registerSingleton<SearchRepoImpli>(
    SearchRepoImpli(
      gitIt.get<ApiService>(),
    ),
  );
}
