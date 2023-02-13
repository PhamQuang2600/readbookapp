import 'package:flutter/material.dart';
import 'package:readbookapp/data/data_test.dart';
import 'package:readbookapp/src/resouces/drawer_page.dart';
import 'package:readbookapp/src/resouces/profile.dart';
import 'package:readbookapp/src/resouces/about_book_page.dart';
import 'package:readbookapp/src/resouces/sign_in.dart';

import '../../animations/fade_animations.dart';
import '../../loading/loading.dart';
import 'home_page.dart';

class SearchBooksPage extends StatefulWidget {
  String keyword;
  SearchBooksPage(this.keyword, {super.key});

  @override
  State<SearchBooksPage> createState() => _SearchBooksPageState();
}

class _SearchBooksPageState extends State<SearchBooksPage> {
  List search = [];
  @override
  void initState() {
    search = searchBooks(widget.keyword.toLowerCase());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (search.isEmpty) {
      return Scaffold(
        drawer: DrawerPage(),
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
                        Navigator.of(context).pop();
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const HomePage()));
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const ProfilePage()));
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
          appBar: AppBar(
            backgroundColor: Colors.grey[100],
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
          body: ListView.builder(
            itemCount: search.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: const EdgeInsets.all(1),
                title: FadeAnimation(
                  1.3,
                  listBook(books: search[index]),
                ),
              );
            },
          ));
    }
  }

  Widget listBook({books}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          FadeAnimation(
            1,
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
                  1.1,
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
                  1.2,
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
                        : GestureDetector(
                            child: const SizedBox(
                              height: 30,
                              child: Text('Read more',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  )),
                            ),
                            onTap: () =>
                                setState(() => books.isReadMore = true)),
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
