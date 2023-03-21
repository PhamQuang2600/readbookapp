import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readbookapp/bloc/book/book_bloc.dart';
import 'package:readbookapp/src/widget/appbar.dart';
import 'package:readbookapp/src/widget/book_error.dart';
import 'package:readbookapp/src/widget/drawer_page.dart';
import 'package:readbookapp/src/widget/something_went_wrong.dart';

import '../../animations/fade_animations.dart';
import '../widget/list_book_home.dart';

class SearchBooksPage extends StatefulWidget {
  final String keyword;
  const SearchBooksPage(this.keyword, {super.key});

  @override
  State<SearchBooksPage> createState() => _SearchBooksPageState();
}

class _SearchBooksPageState extends State<SearchBooksPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is BookLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BookLoaded) {
          var book = state.books
              .where((e) =>
                  e.name.toLowerCase().contains(widget.keyword.toLowerCase()) ||
                  e.author
                      .toLowerCase()
                      .contains(widget.keyword.toLowerCase()) ||
                  e.description
                      .toLowerCase()
                      .contains(widget.keyword.toLowerCase()))
              .toList();

          if (book.isEmpty) {
            return Scaffold(
              drawer: const DrawerPage(),
              appBar: const AppBarWidget(),
              body: FadeAnimation(
                1,
                SafeArea(
                    minimum: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets_image/one.jpg"))),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Not found book with keyword! Please, try looking for.',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    )),
              ),
            );
          } else {
            return Scaffold(
                drawer: const DrawerPage(),
                appBar: const AppBarWidget(),
                body: ListView.builder(
                  itemCount: book.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.all(1),
                      title: FadeAnimation(
                        1.3,
                        ListBookHome(book[index]),
                      ),
                    );
                  },
                ));
          }
        } else if (state is BookError) {
          return BookShowError(state.message);
        } else {
          return const SomethingWentWrong();
        }
      },
    );
  }
}
