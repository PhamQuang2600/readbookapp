// import 'package:flutter/material.dart';
// import 'package:readbookapp/src/widget/list_book_home.dart';

// import '../../animations/fade_animations.dart';
// import '../../loading/loading.dart';

// class FavoriteBookPage extends StatefulWidget {
//   const FavoriteBookPage({super.key});

//   @override
//   State<FavoriteBookPage> createState() => _FavoriteBookPageState();
// }

// class _FavoriteBookPageState extends State<FavoriteBookPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.black26,
//           title: const Text(
//             'Favorite',
//             style: TextStyle(color: Colors.black),
//           )),
//       body: books == 0
//           ? Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   padding:
//                       const EdgeInsets.only(bottom: 10, left: 10, right: 10),
//                   child: Image.asset('assets_image/five.jpg'),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Don't have any books in favorite! \t",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     GestureDetector(
//                         onTap: () {
//                           LoadingDiaLog.showLoadingDiaLog(context);
//                           Future.delayed(
//                             const Duration(seconds: 2),
//                             () {
//                               LoadingDiaLog.hideDiaLog(context);
//                               Navigator.of(context).pushNamedAndRemoveUntil(
//                                   '/', (route) => false);
//                             },
//                           );
//                         },
//                         child: const Text(
//                           "Find book now",
//                           style: TextStyle(color: Colors.blue, fontSize: 16),
//                         ))
//                   ],
//                 ),
//               ],
//             )
//           : Container(
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//               height: double.infinity,
//               width: MediaQuery.of(context).size.width,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     ListBody(
//                       children: List.generate(
//                           books.length,
//                           (index) => SizedBox(
//                                 width: MediaQuery.of(context).size.width,
//                                 child: ListTile(
//                                   contentPadding: const EdgeInsets.all(1),
//                                   title: FadeAnimation(
//                                     1.3,
//                                     ListBookHome(books[index]),
//                                   ),
//                                 ),
//                               )),
//                     ),
//                   ],
//                 ),
//               )),
//     );
//   }
// }
