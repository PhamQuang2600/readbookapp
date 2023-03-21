import 'package:flutter/material.dart';

import '../../animations/fade_animations.dart';
import '../../loading/loading.dart';
import '../resouces/search_books.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[300],
      elevation: 0,
      leading: Builder(
        builder: (context) => GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: const Icon(Icons.menu, color: Colors.black),
        ),
      ),
      actions: [
        FadeAnimation(
          .9,
          SizedBox(
            width: 300,
            child: Container(
              padding: const EdgeInsets.all(5),
              child: TextField(
                cursorColor: Colors.black,
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
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Search you\'re looking for',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
