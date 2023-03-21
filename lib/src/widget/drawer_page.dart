import 'package:flutter/material.dart';

import '../../loading/loading.dart';

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
          const DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: <Color>[Colors.red, Colors.blue])),
            child: SizedBox(
              width: double.infinity,
              height: 200.0,
              child: Center(
                child: Column(
                  children: <Widget>[
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
                  Navigator.of(context).pushNamed('/');
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
                  Navigator.of(context).pushNamed('/sign-in');
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
                  Navigator.of(context).pushNamed('/favorite');
                },
              );
            },
            leading: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            title: const Text(
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
                  Navigator.of(context).pushNamed('/category');
                },
              );
            },
            leading: const Icon(
              Icons.category,
            ),
            title: const Text(
              'Categories',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
