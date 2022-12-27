import 'package:flutter/material.dart';
import 'package:readbookapp/animations/fade_animations.dart';
import 'package:readbookapp/data/data_test.dart';

import '../../loading/loading.dart';
import 'home_page.dart';

class ReadBookPage extends StatefulWidget {
  int id;
  ReadBookPage(this.id, {super.key});

  @override
  State<ReadBookPage> createState() => _ReadBookPageState();
}

class _ReadBookPageState extends State<ReadBookPage> {
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
                          MaterialPageRoute(builder: (_) => const HomePage()));
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const HomePage()));
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
                      return FadeAnimation(1, alert);
                    },
                  );
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          centerTitle: true,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  book!.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
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
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      ReadBookPage(bookRelate![index].id),
                                ));
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
