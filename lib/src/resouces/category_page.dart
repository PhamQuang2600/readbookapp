import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readbookapp/src/widget/list_book_home.dart';

import '../../animations/fade_animations.dart';
import '../../bloc/book/book_bloc.dart';
import '../../bloc/category/category_bloc.dart';
import '../widget/Something_went_wrong.dart';
import '../widget/book_error.dart';

class CategoryBookPage extends StatefulWidget {
  const CategoryBookPage({super.key});

  static const String routeName = '/category';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CategoryBookPage());
  }

  @override
  State<CategoryBookPage> createState() => _CategoryBookPageState();
}

class _CategoryBookPageState extends State<CategoryBookPage> {
  bool isSelected = false;
  var category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey,
          title: const Text('Category')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CategoryLoaded) {
                return Column(
                  children: [
                    SizedBox(
                      height: 70,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 60,
                            width: MediaQuery.of(context).size.width / 3,
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  isSelected == true;
                                  category = state.categories[index].name;
                                });
                              },
                              contentPadding:
                                  const EdgeInsets.only(left: 5, right: 5),
                              title: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey,
                                  ),
                                  alignment: Alignment.center,
                                  height: 60,
                                  child: Text(
                                    state.categories[index].name,
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          );
                        },
                      ),
                    ),
                    BlocBuilder<BookBloc, BookState>(
                      builder: (context, state) {
                        if (state is BookLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is BookLoaded) {
                          var book = state.books
                              .where((e) => e.genre.contains(category))
                              .toList();
                          return book.isEmpty
                              ? Container(
                                  height: MediaQuery.of(context).size.height,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Select category',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                )
                              : ListBody(
                                  children: List.generate(
                                      book.length,
                                      (index) => SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ListTile(
                                              contentPadding:
                                                  const EdgeInsets.all(1),
                                              title: FadeAnimation(
                                                1.3,
                                                ListBookHome(book[index]),
                                              ),
                                            ),
                                          )),
                                );
                        } else if (state is BookError) {
                          return BookShowError(state.message);
                        } else {
                          return const SomethingWentWrong();
                        }
                      },
                    )
                  ],
                );
              } else if (state is CategoryError) {
                return BookShowError(state.message);
              } else {
                return const SomethingWentWrong();
              }
            },
          ),
        ),
      ),
    );
  }
}
