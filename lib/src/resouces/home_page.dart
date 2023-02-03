import 'package:flutter/material.dart';
import 'package:readbookapp/animations/fade_animations.dart';
import 'package:readbookapp/loading/loading.dart';
import 'package:readbookapp/src/resouces/profile.dart';
import 'package:readbookapp/src/resouces/read_book_page.dart';
import 'package:readbookapp/src/resouces/search_books.dart';
import 'package:readbookapp/src/resouces/sign_in.dart';

import '../../data/data_test.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: <Color>[Colors.red, Colors.blue])),
              child: SizedBox(
                width: double.infinity,
                height: 200.0,
                child: Center(
                  child: Column(
                    children: const <Widget>[
                      CircleAvatar(
                        radius: 40.0,
                        child: Icon(Icons.person, size: 50),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, size: 30),
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Future.delayed(
                  Duration.zero,
                  () {
                    LoadingDiaLog.showLoadingDiaLog(context);
                  },
                );
                Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    LoadingDiaLog.hideDiaLog(context);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const HomePage()));
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                size: 30,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Future.delayed(
                  Duration.zero,
                  () {
                    LoadingDiaLog.showLoadingDiaLog(context);
                  },
                );
                Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    LoadingDiaLog.hideDiaLog(context);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const ProfilePage()));
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                size: 30,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                AlertDialog alert = AlertDialog(
                  title: const Text('Book'),
                  content: const Text('Do you want leave?'),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Future.delayed(
                            Duration.zero,
                            () {
                              LoadingDiaLog.showLoadingDiaLog(context);
                            },
                          );
                          Future.delayed(
                            const Duration(seconds: 2),
                            () {
                              LoadingDiaLog.hideDiaLog(context);
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (_) => const SignInPage()),
                                (Route<dynamic> route) => false,
                              );
                            },
                          );
                        },
                        child: const Text('OK')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('No'))
                  ],
                );
                showDialog(
                  context: context,
                  builder: (context) {
                    return FadeAnimation(.6, alert);
                  },
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        actions: [
          FadeAnimation(
            .9,
            SizedBox(
              width: 300,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  onSubmitted: (value) {
                    if (value.isEmpty) {
                    } else {
                      Future.delayed(
                        Duration.zero,
                        () {
                          LoadingDiaLog.showLoadingDiaLog(context);
                        },
                      );
                      Future.delayed(
                        const Duration(seconds: 2),
                        () {
                          LoadingDiaLog.hideDiaLog(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => SearchBooksPage(value)));
                        },
                      );
                    }
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Search you\'re looking for',
                      prefixIcon: const Icon(Icons.search)),
                ),
              ),
            ),
          ),
        ],
      ),
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
              SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: books.length,
                    scrollDirection: Axis.horizontal,
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
                                            builder: (context) =>
                                                ReadBookPage(books[index].id),
                                          )));
                                },
                              );
                            },
                            contentPadding: const EdgeInsets.all(1),
                            title: FadeAnimation(
                              1.3,
                              makeItem(books: books[index]),
                            ),
                          ));
                    },
                  )),
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
              SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: books.length,
                    scrollDirection: Axis.horizontal,
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
                                            builder: (context) =>
                                                ReadBookPage(books[index].id),
                                          )));
                                },
                              );
                            },
                            contentPadding: const EdgeInsets.all(1),
                            title: FadeAnimation(
                              1.3,
                              makeItem(books: books[index]),
                            ),
                          ));
                    },
                  )),
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem({books}) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(books.image), fit: BoxFit.cover)),
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
                          books.favorite = !books.favorite;
                          if (books.favorite == true) {
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
                      color: books.favorite ? Colors.red : Colors.white,
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      books.name,
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
                padding: const EdgeInsets.all(5),
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
                    width: MediaQuery.of(context).size.width - 214,
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
                        width: MediaQuery.of(context).size.width - 214,
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
                                          ReadBookPage(books.id),
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
