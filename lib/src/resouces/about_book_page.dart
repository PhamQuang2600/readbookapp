import 'package:flutter/material.dart';
import 'package:readbookapp/animations/fade_animations.dart';
import 'package:readbookapp/data/data_test.dart';
import 'package:readbookapp/src/resouces/drawer_page.dart';
import 'package:readbookapp/src/resouces/read_book_page_page.dart';

import '../../loading/loading.dart';

class AboutBookPage extends StatefulWidget {
  int id;
  AboutBookPage(this.id, {super.key});

  @override
  State<AboutBookPage> createState() => _AboutBookPageState();
}

class _AboutBookPageState extends State<AboutBookPage> {
  Books? book;
  List<Books>? bookRelate;
  @override
  void initState() {
    book = bookDetail(widget.id);
    bookRelate = bookRelated(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerPage(),
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          centerTitle: true,
          leading: Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Icon(Icons.menu, color: Colors.black),
            ),
          ),
          title: FadeAnimation(
            .9,
            Text(
              book!.name,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Author: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 107,
                    child: Text(
                      book!.author,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Category: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 107,
                    child: Text(
                      book!.genre.take(book!.genre.length).toString(),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Description: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 107,
                    child: Text(
                      book!.description,
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
                    Duration(seconds: 2),
                    () {
                      LoadingDiaLog.hideDiaLog(context);

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ReadBookPage(book!.name, 1)));
                    },
                  );
                },
                child: Text(
                  'Read now',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bookRelate!.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        width: 200,
                        child: ListTile(
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
                                          builder: (context) => AboutBookPage(
                                              bookRelate![index].id),
                                        )));
                              },
                            );
                          },
                          contentPadding: const EdgeInsets.all(1),
                          title: FadeAnimation(
                            1.3,
                            makeItem(book: bookRelate![index]),
                          ),
                        ));
                  },
                ),
              )
            ],
          )),
        ));
  }

  Widget makeItem({book}) {
    return GestureDetector(
      child: Container(
        height: 300,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(book.image),
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
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(10),
            child: Text(
              book.name,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
