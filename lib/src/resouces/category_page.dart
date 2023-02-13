import 'package:flutter/material.dart';
import 'package:readbookapp/data/data_test.dart';

import '../../animations/fade_animations.dart';
import '../../loading/loading.dart';
import 'about_book_page.dart';

class CategoryBookPage extends StatefulWidget {
  const CategoryBookPage({super.key});

  @override
  State<CategoryBookPage> createState() => _CategoryBookPageState();
}

class _CategoryBookPageState extends State<CategoryBookPage> {
  bool isSelected = false;
  List<Books> books = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0, backgroundColor: Colors.grey, title: Text('Category')),
      body: SafeArea(
        child: books.length == 0
            ? Column(children: [
                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 3,
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              isSelected == true;
                              books = categoryBooks(categories[index].name);
                            });
                          },
                          contentPadding:
                              const EdgeInsets.only(left: 5, right: 5),
                          title: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelected ? Colors.amber : Colors.grey,
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              child: Text(
                                categories[index].name,
                                textAlign: TextAlign.center,
                              )),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 165,
                  alignment: Alignment.center,
                  child: Text(
                    'Select category',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ])
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width / 3,
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  isSelected == true;
                                  books = categoryBooks(categories[index].name);
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
                                    categories[index].name,
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          );
                        },
                      ),
                    ),
                    books.length == 0
                        ? Container(
                            height: MediaQuery.of(context).size.height,
                            alignment: Alignment.center,
                            child: Text(
                              'Select category',
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        : ListBody(
                            children: List.generate(
                                books.length,
                                (index) => SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ListTile(
                                        contentPadding: const EdgeInsets.all(1),
                                        title: FadeAnimation(
                                          1.3,
                                          listBook(books: books[index]),
                                        ),
                                      ),
                                    )),
                          )
                  ],
                ),
              ),
      ),
    );
  }

  Widget listBook({books}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          FadeAnimation(
            1.4,
            Container(
                height: 300,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(books.image),
                      fit: BoxFit.cover,
                    )),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          stops: const [
                            .1,
                            .4
                          ],
                          colors: [
                            Colors.black.withOpacity(.7),
                            Colors.black.withOpacity(.2)
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
                    width: MediaQuery.of(context).size.width - 234,
                    child: Text(
                      books.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      softWrap: true,
                    ),
                  ),
                ),
                FadeAnimation(
                  1.55,
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 234,
                    child: Text(
                      'Author: ${books.author}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      softWrap: true,
                    ),
                  ),
                ),
                FadeAnimation(
                  1.6,
                  ConstrainedBox(
                    constraints: books.isReadMore
                        ? const BoxConstraints()
                        : const BoxConstraints(maxHeight: 200),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width - 234,
                        child: Text(
                          books.description,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        )),
                  ),
                ),
                Row(
                  children: [
                    books.isReadMore
                        ? SizedBox(
                            height: 30,
                            child: GestureDetector(
                                child: const Text('Read less',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    )),
                                onTap: () =>
                                    setState(() => books.isReadMore = false)),
                          )
                        : SizedBox(
                            height: 30,
                            child: GestureDetector(
                                child: const Text('Read more',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    )),
                                onTap: () =>
                                    setState(() => books.isReadMore = true)),
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
                                () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          AboutBookPage(books.id),
                                    )));
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
