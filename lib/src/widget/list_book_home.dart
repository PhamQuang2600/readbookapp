import 'package:flutter/material.dart';

import '../../animations/fade_animations.dart';
import '../../loading/loading.dart';
import '../../models/book.dart';

class ListBookHome extends StatefulWidget {
  final Books books;
  const ListBookHome(this.books, {super.key});

  @override
  State<ListBookHome> createState() => _ListBookHomeState();
}

class _ListBookHomeState extends State<ListBookHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          FadeAnimation(
            1.4,
            Container(
                height: 300,
                width: 180,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets_image/${widget.books.image}'),
                      fit: BoxFit.cover,
                    )),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          stops: const [
                            .2,
                            .9
                          ],
                          colors: [
                            Colors.black.withOpacity(.9),
                            Colors.black.withOpacity(.3)
                          ])),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimation(
                  1.5,
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 214,
                    child: Text(
                      widget.books.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      softWrap: true,
                    ),
                  ),
                ),
                FadeAnimation(
                  1.55,
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 214,
                    child: Text(
                      'Author: ${widget.books.author}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      softWrap: true,
                    ),
                  ),
                ),
                FadeAnimation(
                  1.6,
                  ConstrainedBox(
                    constraints: widget.books.isReadMore
                        ? const BoxConstraints()
                        : const BoxConstraints(maxHeight: 200),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width - 214,
                        child: Text(
                          widget.books.description,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        )),
                  ),
                ),
                Row(
                  children: [
                    widget.books.isReadMore
                        ? SizedBox(
                            height: 30,
                            child: GestureDetector(
                                child: const Text('Read less',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    )),
                                onTap: () => setState(
                                    () => widget.books.isReadMore = false)),
                          )
                        : SizedBox(
                            height: 30,
                            child: GestureDetector(
                                child: const Text('Read more',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    )),
                                onTap: () => setState(
                                    () => widget.books.isReadMore = true)),
                          ),
                    GestureDetector(
                      onTap: () {
                        LoadingDiaLog.showLoadingDiaLog(context);
                        Future.delayed(
                          const Duration(seconds: 2),
                          () {
                            LoadingDiaLog.hideDiaLog(context);
                            LoadingDataBook.showLoadingDataBook(context);
                            Future.delayed(
                                const Duration(seconds: 3),
                                () => Navigator.of(context).pushNamed(
                                    '/about-book',
                                    arguments: widget.books));
                          },
                        );
                      },
                      child: Container(
                        height: 30,
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text(
                          'Read book',
                          style: TextStyle(color: Colors.blue, fontSize: 15.8),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
