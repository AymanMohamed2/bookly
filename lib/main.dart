import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/repo/home_repo_impli.dart';
import 'package:bookly_app/features/home/presentation/view_model/featured_books/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/newest_books/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setUpServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            gitIt.get<HomeRepoImpli>(),
          )..fetchFeaturedBooks(catigory: 'anime'),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            gitIt.get<HomeRepoImpli>(),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: ColorsData.scaffoldColor),
      ),
    );
  }
}
