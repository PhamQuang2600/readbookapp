import 'package:flutter/material.dart';
import 'package:readbookapp/src/resouces/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
