import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/view_model/featured_books/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_list_view_loading_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HerizontalListView extends StatelessWidget {
  const HerizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .25,
              child: CarouselSlider.builder(
                itemCount: state.bookModel.items!.length,
                itemBuilder: (context, index, realIndex) {
                  return GestureDetector(
                    onTap: () {
                      AppRouter.router.push('/BookDetailsView',
                          extra: state.bookModel.items![index]);
                    },
                    child: BookItem(
                        imageUrl: state.bookModel.items![index].volumeInfo!
                                .imageLinks?.thumbnail ??
                            ''),
                  );
                },
                options: CarouselOptions(
                  viewportFraction: 0.45,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeFactor: 0.37,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            );
          } else if (state is FeaturedBooksFailure) {
            return CustomErrorWidget(errorMessage: state.errorMessage);
          } else {
            return const Center(
              child: FeaturedBooksListViewLoadingIndicator(),
            );
          }
        },
      ),
    );
  }
}
