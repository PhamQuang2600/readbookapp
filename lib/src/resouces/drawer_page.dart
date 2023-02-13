import 'package:flutter/material.dart';
import 'package:readbookapp/data/data_test.dart';
import 'package:readbookapp/src/resouces/category_page.dart';
import 'package:readbookapp/src/resouces/favorite_page.dart';
import 'package:readbookapp/src/resouces/profile.dart';
import 'package:readbookapp/src/resouces/sign_in.dart';

import '../../animations/fade_animations.dart';
import '../../loading/loading.dart';
import 'home_page.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                      builder: (_) => const FavoriteBookPage()));
                },
              );
            },
            leading: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            title: Text(
              'Favorite',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
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
                      builder: (_) => const CategoryBookPage()));
                },
              );
            },
            leading: Icon(
              Icons.category,
            ),
            title: Text(
              'Categories',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
