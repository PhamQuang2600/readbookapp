import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readbookapp/bloc/book/book_bloc.dart';
import 'package:readbookapp/bloc/category/category_bloc.dart';
import 'package:readbookapp/bloc/user/user_bloc.dart';
import 'package:readbookapp/repository/book_repo.dart';
import 'package:readbookapp/repository/category_repo.dart';
import 'package:readbookapp/repository/user_repo.dart';
import 'package:readbookapp/src/resouces/home_page.dart';
import 'package:readbookapp/src/resouces/start_page.dart';

import '../config/app_route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BookBloc(bookRepository: BookRepository())..add(GetList()),
        ),
        BlocProvider(
            create: (context) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add(GetCategory())),
        BlocProvider(
            create: (context) =>
                UserBloc(userRepository: UserRepository())..add(GetListUser())),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Roboto'),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute.onGenerateRoute,
        initialRoute: StartPage.routeName,
        home: const HomePage(),
      ),
    );
  }
}
