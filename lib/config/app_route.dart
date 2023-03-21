import 'package:flutter/material.dart';
import 'package:readbookapp/src/resouces/about_book_page.dart';
import 'package:readbookapp/src/resouces/category_page.dart';
import 'package:readbookapp/src/resouces/sign_in.dart';
import 'package:readbookapp/src/resouces/sign_up.dart';
import 'package:readbookapp/src/resouces/start_page.dart';

import '../models/book.dart';
import '../src/resouces/home_page.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomePage.route();

      case CategoryBookPage.routeName:
        return CategoryBookPage.route();

      case StartPage.routeName:
        return StartPage.route();

      case SignInPage.routeName:
        return SignInPage.route();
      case SignUpPage.routeName:
        return SignUpPage.route();

      case AboutBookPage.routeName:
        return AboutBookPage.route(book: settings.arguments as Books);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(title: const Text('Error')),
            ));
  }
}
