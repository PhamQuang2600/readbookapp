import 'package:flutter/material.dart';
import 'package:readbookapp/animations/fade_animations.dart';
import 'package:readbookapp/data/data_test.dart';
import 'package:readbookapp/src/resouces/drawer_page.dart';

import '../../loading/loading.dart';

class ReadBookPage extends StatefulWidget {
  String nameBook;
  int id;
  ReadBookPage(this.nameBook, this.id, {super.key});

  @override
  State<ReadBookPage> createState() => _ReadBookPageState();
}

class _ReadBookPageState extends State<ReadBookPage> {
  var totalChapter;
  bool selectedBook = false;

  @override
  void initState() {
    super.initState();
    totalChapter = ListChapterBooks(widget.nameBook).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      endDrawer: Drawer(
          elevation: 0,
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 30),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'List Chapter',
                    style: TextStyle(fontSize: 18),
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
                            Duration(seconds: 2),
                            () {
                              LoadingDiaLog.hideDiaLog(context);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => ReadBookPage(
                                          widget.nameBook, index+1)));
                            },
                          );
                        },
                        title: Container(
                          child: Text('Chapter ' +
                              (index + 1).toString() +
                              ' ' +
                              ListChapterBooks(widget.nameBook)[index]
                                  .nameChapter),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )),
      appBar: AppBar(
        title: FadeAnimation(
          1.2,
          Text(
            widget.nameBook,
            style: TextStyle(color: Colors.black),
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
              child: Icon(
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
      body: FadeAnimation(
        1.4,
        Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Text(
                    'Chapter ' +
                        ReadChapterBook(widget.nameBook, widget.id)
                            .idChapter
                            .toString() +
                        ': ' +
                        ReadChapterBook(widget.nameBook, widget.id).nameChapter,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Text(
                    ReadChapterBook(widget.nameBook, widget.id).detailChapter,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                buttonNextPage(widget.id)
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
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            MaterialButton(
              height: 40,
              disabledColor: Colors.black26,
              color: Colors.black,
              minWidth: (MediaQuery.of(context).size.width / 2) - 12.5,
              onPressed: () {
                print(numberChapter);
              },
              child: Text(
                'Previous',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            MaterialButton(
              height: 40,
              color: Colors.black,
              minWidth: (MediaQuery.of(context).size.width / 2) - 12.5,
              onPressed: () {
                LoadingDiaLog.showLoadingDiaLog(context);
                Future.delayed(
                  Duration(seconds: 2),
                  () {
                    LoadingDiaLog.showLoadingDiaLog(context);
                    Future.delayed(
                      Duration(milliseconds: 800),
                      () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) =>
                                ReadBookPage(widget.nameBook, widget.id + 1)));
                      },
                    );
                  },
                );
              },
              child: Text(
                'Next',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      );
    } else if (numberChapter >= totalChapter) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  Duration(seconds: 2),
                  () {
                    LoadingDiaLog.showLoadingDiaLog(context);
                    Future.delayed(
                      Duration(milliseconds: 800),
                      () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) =>
                                ReadBookPage(widget.nameBook, widget.id - 1)));
                      },
                    );
                  },
                );
              },
              child: Text(
                'Previous',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            MaterialButton(
              height: 40,
              disabledColor: Colors.black26,
              color: Colors.black,
              minWidth: (MediaQuery.of(context).size.width / 2) - 12.5,
              onPressed: () {},
              child: Text(
                'Next',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      );
    } else if (numberChapter > 1 && numberChapter < totalChapter) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  Duration(seconds: 2),
                  () {
                    LoadingDiaLog.showLoadingDiaLog(context);
                    Future.delayed(
                      Duration(milliseconds: 800),
                      () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) =>
                                ReadBookPage(widget.nameBook, widget.id - 1)));
                      },
                    );
                  },
                );
              },
              child: Text(
                'Previous',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            MaterialButton(
              height: 40,
              color: Colors.black,
              minWidth: (MediaQuery.of(context).size.width / 2) - 12.5,
              onPressed: () {
                LoadingDiaLog.showLoadingDiaLog(context);
                Future.delayed(
                  Duration(seconds: 2),
                  () {
                    LoadingDiaLog.showLoadingDiaLog(context);
                    Future.delayed(
                      Duration(milliseconds: 800),
                      () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) =>
                                ReadBookPage(widget.nameBook, widget.id + 1)));
                      },
                    );
                  },
                );
              },
              child: Text(
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
