import 'package:flutter/material.dart';
import 'package:readbookapp/animations/fade_animations.dart';
import 'package:readbookapp/src/widget/drawer_page.dart';

import '../../loading/loading.dart';
import '../../models/book.dart';

class ReadBookPage extends StatefulWidget {
  final Books book;
  final int idChapter;
  const ReadBookPage({super.key, required this.book, required this.idChapter});

  @override
  State<ReadBookPage> createState() => _ReadBookPageState();
}

class _ReadBookPageState extends State<ReadBookPage> {
  var totalChapter;
  bool selectedBook = false;

  @override
  void initState() {
    super.initState();
    totalChapter = widget.book.chapter.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
      endDrawer: Drawer(
          elevation: 0,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    widget.book.name,
                    style: const TextStyle(fontSize: 18),
                  )),
              Expanded(
                child: ListView.builder(
                  itemCount: totalChapter,
                  itemBuilder: (context, index) {
                    return Container(
                      color: selectedBook ? Colors.black26 : Colors.white,
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            selectedBook = true;
                          });
                          LoadingDiaLog.showLoadingDiaLog(context);
                          Future.delayed(
                            const Duration(seconds: 2),
                            () {
                              LoadingDiaLog.hideDiaLog(context);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReadBookPage(
                                        book: widget.book,
                                        idChapter: widget.book.chapter[index]
                                            ['id']),
                                  ),
                                  (route) => false);
                            },
                          );
                        },
                        title: Text('Chapter ' '${(index + 1)}: ' +
                            widget.book.chapter[index]['nameChapter']),
                      ),
                    );
                  },
                ),
              )
            ],
          )),
      appBar: AppBar(
        centerTitle: true,
        title: FadeAnimation(
          1.2,
          Text(
            widget.book.name,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return FadeAnimation(
            1.3,
            GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          );
        }),
        actions: [
          Builder(builder: (context) {
            return FadeAnimation(
              1.3,
              GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child:
                      Image.asset('assets_image/icons8-menu-vertical-24.png')),
            );
          }),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        child: buttonNextPage(widget.idChapter),
      )),
      body: FadeAnimation(
        1.4,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                widget.book.chapter[widget.idChapter - 1]['nameChapter'] == null
                    ? Text(
                        textAlign: TextAlign.center,
                        'Chapter ' + widget.idChapter.toString(),
                        style: const TextStyle(fontSize: 20),
                      )
                    : Text(
                        textAlign: TextAlign.center,
                        'Chapter ' +
                            widget.idChapter.toString() +
                            ': ' +
                            widget.book.chapter[widget.idChapter - 1]
                                ['nameChapter'],
                        style: const TextStyle(fontSize: 20),
                      ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Text(
                    widget.book.chapter[widget.idChapter - 1]['detailChapter'],
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonNextPage(int numberChapter) {
    if (numberChapter <= 1) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            MaterialButton(
              height: 40,
              disabledColor: Colors.black26,
              color: Colors.black,
              minWidth: (MediaQuery.of(context).size.width / 2) - 12.5,
              onPressed: () {},
              child: const Text(
                'Previous',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            MaterialButton(
              height: 40,
              color: Colors.black,
              minWidth: (MediaQuery.of(context).size.width / 2) - 12.5,
              onPressed: () {
                LoadingDiaLog.showLoadingDiaLog(context);
                Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    LoadingDiaLog.showLoadingDiaLog(context);
                    Future.delayed(
                      const Duration(milliseconds: 800),
                      () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => ReadBookPage(
                                book: widget.book,
                                idChapter: widget.idChapter + 1)));
                      },
                    );
                  },
                );
              },
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      );
    } else if (numberChapter >= totalChapter) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            MaterialButton(
              height: 40,
              color: Colors.black,
              minWidth: (MediaQuery.of(context).size.width / 2) - 12.5,
              onPressed: () {
                LoadingDiaLog.showLoadingDiaLog(context);
                Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    LoadingDiaLog.showLoadingDiaLog(context);
                    Future.delayed(
                      const Duration(milliseconds: 800),
                      () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => ReadBookPage(
                                book: widget.book,
                                idChapter: widget.idChapter - 1)));
                      },
                    );
                  },
                );
              },
              child: const Text(
                'Previous',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            MaterialButton(
              height: 40,
              disabledColor: Colors.black26,
              color: Colors.black,
              minWidth: (MediaQuery.of(context).size.width / 2) - 12.5,
              onPressed: () {},
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      );
    } else if (numberChapter > 1 && numberChapter < totalChapter) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            MaterialButton(
              height: 40,
              color: Colors.black,
              minWidth: (MediaQuery.of(context).size.width / 2) - 12.5,
              onPressed: () {
                LoadingDiaLog.showLoadingDiaLog(context);
                Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    LoadingDiaLog.showLoadingDiaLog(context);
                    Future.delayed(
                      const Duration(milliseconds: 800),
                      () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => ReadBookPage(
                                book: widget.book,
                                idChapter: widget.idChapter - 1)));
                      },
                    );
                  },
                );
              },
              child: const Text(
                'Previous',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            MaterialButton(
              height: 40,
              color: Colors.black,
              minWidth: (MediaQuery.of(context).size.width / 2) - 12.5,
              onPressed: () {
                LoadingDiaLog.showLoadingDiaLog(context);
                Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    LoadingDiaLog.showLoadingDiaLog(context);
                    Future.delayed(
                      const Duration(milliseconds: 800),
                      () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => ReadBookPage(
                                book: widget.book,
                                idChapter: widget.idChapter + 1)));
                      },
                    );
                  },
                );
              },
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
