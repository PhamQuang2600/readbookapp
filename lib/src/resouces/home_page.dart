import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readbookapp/animations/fade_animations.dart';
import 'package:readbookapp/src/widget/Something_went_wrong.dart';
import 'package:readbookapp/src/widget/appbar.dart';
import 'package:readbookapp/src/widget/drawer_page.dart';
import 'package:readbookapp/src/widget/list_book_home.dart';
import 'package:readbookapp/src/widget/scroll_book_home.dart';

import '../../bloc/book/book_bloc.dart';
import '../widget/book_error.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomePage());
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
      backgroundColor: Colors.grey[100],
      appBar: const AppBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeAnimation(
                  1,
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Featured Book',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              BlocBuilder<BookBloc, BookState>(
                builder: (context, state) {
                  if (state is BookLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is BookLoaded) {
                    return SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: state.books.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return SizedBox(
                                width: 200,
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(1),
                                  title: FadeAnimation(
                                    1.3,
                                    ScrollBookHome(books: state.books[index]),
                                  ),
                                ));
                          },
                        ));
                  } else if (state is BookError) {
                    return BookShowError(state.message);
                  } else {
                    return const SomethingWentWrong();
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FadeAnimation(
                  1,
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'New Book',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              BlocBuilder<BookBloc, BookState>(
                builder: (context, state) {
                  if (state is BookLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is BookLoaded) {
                    return SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: state.books.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return SizedBox(
                                width: 200,
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(1),
                                  title: FadeAnimation(
                                    1.3,
                                    ScrollBookHome(books: state.books[index]),
                                  ),
                                ));
                          },
                        ));
                  } else if (state is BookError) {
                    return BookShowError(state.message);
                  } else {
                    return const SomethingWentWrong();
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FadeAnimation(
                  1,
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Hight views',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              BlocBuilder<BookBloc, BookState>(
                builder: (context, state) {
                  if (state is BookLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is BookLoaded) {
                    return FadeAnimation(
                      1.05,
                      ListBody(
                        children: List.generate(
                            state.books.length,
                            (index) => SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(1),
                                    title: FadeAnimation(
                                      1.3,
                                      ListBookHome(state.books[index]),
                                    ),
                                  ),
                                )),
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
          ),
        ),
      ),
    );
  }
}
