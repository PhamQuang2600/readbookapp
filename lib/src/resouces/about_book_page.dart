import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readbookapp/animations/fade_animations.dart';
import 'package:readbookapp/bloc/book/book_bloc.dart';
import 'package:readbookapp/src/widget/drawer_page.dart';
import 'package:readbookapp/src/resouces/read_book_page.dart';

import '../../loading/loading.dart';
import '../../models/book.dart';
import '../widget/Something_went_wrong.dart';
import '../widget/book_error.dart';
import '../widget/scroll_book_home.dart';

class AboutBookPage extends StatefulWidget {
  final Books book;
  const AboutBookPage({required this.book, super.key});

  static const String routeName = '/about-book';
  static Route route({required Books book}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => AboutBookPage(book: book));
  }

  @override
  State<AboutBookPage> createState() => _AboutBookPageState();
}

class _AboutBookPageState extends State<AboutBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerPage(),
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          centerTitle: true,
          leading: Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(Icons.menu, color: Colors.black),
            ),
          ),
          title: FadeAnimation(
            .9,
            Text(
              widget.book.name,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          backgroundColor: Colors.grey[300],
          elevation: 0,
        ),
        body: FadeAnimation(
          1,
          SingleChildScrollView(
              child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Author: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 107,
                    child: Text(
                      widget.book.author,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Category: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 107,
                    child: Text(
                      widget.book.genre
                          .take(widget.book.genre.length)
                          .toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Description: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 107,
                    child: Text(
                      widget.book.description,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              MaterialButton(
                color: Colors.black,
                onPressed: () {
                  LoadingDiaLog.showLoadingDiaLog(context);
                  Future.delayed(
                    const Duration(seconds: 2),
                    () {
                      LoadingDiaLog.hideDiaLog(context);

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ReadBookPage(book: widget.book, idChapter: 1),
                          ),
                          (route) => false);
                    },
                  );
                },
                child: const Text(
                  'Read now',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              BlocBuilder<BookBloc, BookState>(
                builder: (context, state) {
                  if (state is BookLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is BookLoaded) {
                    var book = state.books
                        .where((book) => book.id != widget.book.id)
                        .toList();
                    return SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: book.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                              width: 200,
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(1),
                                title: FadeAnimation(
                                  1.3,
                                  ScrollBookHome(books: book[index]),
                                ),
                              ));
                        },
                      ),
                    );
                  } else if (state is BookError) {
                    return BookShowError(state.message);
                  } else {
                    return const SomethingWentWrong();
                  }
                },
              )
            ],
          )),
        ));
  }
}
