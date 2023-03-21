import 'package:flutter/material.dart';

import '../../loading/loading.dart';
import '../../models/book.dart';

class ScrollBookHome extends StatefulWidget {
  final Books books;
  const ScrollBookHome({required this.books, super.key});

  @override
  State<ScrollBookHome> createState() => _ScrollBookHomeState();
}

class _ScrollBookHomeState extends State<ScrollBookHome> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        LoadingDiaLog.showLoadingDiaLog(context);
        Future.delayed(
          const Duration(seconds: 2),
          () {
            LoadingDiaLog.hideDiaLog(context);
            LoadingDataBook.showLoadingDataBook(context);
            Future.delayed(
                const Duration(seconds: 3),
                () => Navigator.of(context)
                    .pushNamed('/about-book', arguments: widget.books));
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage('assets_image/${widget.books.image}'),
                fit: BoxFit.cover)),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.books.isFavorite = !widget.books.isFavorite;
                          if (widget.books.isFavorite == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    duration: Duration(seconds: 2),
                                    content: Text(
                                      "Added my favorite success",
                                      style: TextStyle(fontSize: 16),
                                    )));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    duration: Duration(seconds: 2),
                                    content: Text(
                                      "Removed my favorite success",
                                      style: TextStyle(fontSize: 16),
                                    )));
                          }
                        });
                      },
                      icon: const Icon(Icons.favorite),
                      color:
                          widget.books.isFavorite ? Colors.red : Colors.white,
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      widget.books.name,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
