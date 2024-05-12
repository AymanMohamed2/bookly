import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchedBookItem extends StatelessWidget {
  const SearchedBookItem(
      {super.key, required this.item, required this.controller});

  final Item item;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: GestureDetector(
        onTap: () {
          AppRouter.router.push('/BookDetailsView', extra: item);
          controller!.clear();
        },
        child: Row(
          children: [
            SizedBox(
              height: 120,
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: CachedNetworkImage(
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  imageUrl: item.volumeInfo!.imageLinks?.thumbnail ?? '',
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) {
                    return Container(
                      color: const Color.fromARGB(255, 109, 108, 108),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error,
                            size: 25,
                            color: Color.fromARGB(255, 255, 17, 0),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'Image is not\navailable',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Text(
                      item.volumeInfo!.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    width: 210,
                    child: Text(
                      item.volumeInfo!.authors?[0] ?? 'Auther Name',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Free',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      BookRating(
                        count: item.volumeInfo!.pageCount ?? 0,
                        ratting: 0,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
