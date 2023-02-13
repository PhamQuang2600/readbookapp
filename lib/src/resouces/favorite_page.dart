import 'package:flutter/material.dart';
import 'package:readbookapp/data/data_test.dart';
import 'package:readbookapp/src/resouces/home_page.dart';

import '../../animations/fade_animations.dart';
import '../../loading/loading.dart';
import 'about_book_page.dart';

class FavoriteBookPage extends StatefulWidget {
  const FavoriteBookPage({super.key});

  @override
  State<FavoriteBookPage> createState() => _FavoriteBookPageState();
}

class _FavoriteBookPageState extends State<FavoriteBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black26,
          title: Text(
            'Favorite',
            style: TextStyle(color: Colors.black),
          )),
      body: favoriteBook().length == 0
          ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    child: Image.asset('assets_image/five.jpg'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have any books in favorite! \t",
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                          onTap: () {
                            LoadingDiaLog.showLoadingDiaLog(context);
                            Future.delayed(
                              Duration(seconds: 2),
                              () {
                                LoadingDiaLog.hideDiaLog(context);
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (_) => HomePage()));
                              },
                            );
                          },
                          child: Text(
                            "Find book now",
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ))
                    ],
                  ),
                ],
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: double.infinity,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListBody(
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
                    ),
                  ],
                ),
              )),
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
