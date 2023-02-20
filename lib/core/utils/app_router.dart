import 'package:bookly/features/home/presentation/views/book_view_details.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
