// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:readbookapp/animations/fade_animations.dart';
// import 'package:readbookapp/src/resouces/editprofile_page.dart';
// import 'package:readbookapp/src/resouces/sign_in.dart';

// import '../../loading/loading.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final user = FirebaseAuth.instance.currentUser!;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey[300],
//         elevation: 0,
//         centerTitle: true,
//         title: const Text('Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const FadeAnimation(
//                 .9,
//                 SizedBox(
//                   height: 100,
//                   width: 100,
//                   child: CircleAvatar(
//                       child: Icon(
//                     Icons.person,
//                     size: 80,
//                   )),
//                 ),
//               ),
//               FadeAnimation(
//                 .9,
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     height: 50,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                         border: Border.all(width: 1),
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Text(
//                       user.displayName.toString(),
//                       style:
//                           const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//               ),
//               FadeAnimation(
//                 .9,
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     height: 50,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                         border: Border.all(width: 1),
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Text(
//                       user.email.toString(),
//                       style:
//                           const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//               ),
//               FadeAnimation(
//                 .9,
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     height: 50,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                         border: Border.all(width: 1),
//                         borderRadius: BorderRadius.circular(10)),
//                     child:  Text(
//                       user.uid,
//                       style:
//                           const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   FadeAnimation(
//                       .9,
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: MaterialButton(
//                           color: Colors.black,
//                           onPressed: () {
//                             LoadingDiaLog.showLoadingDiaLog(context);
//                             Future.delayed(
//                               const Duration(seconds: 2),
//                               () {
//                                 LoadingDiaLog.hideDiaLog(context);
//                                 Navigator.of(context).pushReplacement(
//                                     MaterialPageRoute(
//                                         builder: (_) => const EditProfilePage()));
//                               },
//                             );
//                           },
//                           child: const Text(
//                             'Edit',
//                             style: TextStyle(fontSize: 18, color: Colors.white),
//                           ),
//                         ),
//                       )),
//                   FadeAnimation(
//                       .9,
//                       Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: MaterialButton(
//                           color: Colors.black,
//                           onPressed: () {
//                             AlertDialog alert = AlertDialog(
//                               title: const Text('Book'),
//                               content: const Text('Do you want leave?'),
//                               actions: [
//                                 ElevatedButton(
//                                     onPressed: () {
//                                       Future.delayed(
//                                         Duration.zero,
//                                         () {
//                                           LoadingDiaLog.showLoadingDiaLog(
//                                               context);
//                                         },
//                                       );
//                                       Future.delayed(
//                                         const Duration(seconds: 2),
//                                         () {
//                                           LoadingDiaLog.hideDiaLog(context);
//                                           Navigator.of(context)
//                                               .pushAndRemoveUntil(
//                                             MaterialPageRoute(
//                                                 builder: (_) =>
//                                                     const SignInPage()),
//                                             (Route<dynamic> route) => false,
//                                           );
//                                         },
//                                       );
//                                     },
//                                     child: const Text('OK')),
//                                 ElevatedButton(
//                                     onPressed: () {
//                                       Navigator.of(context).pop();
//                                     },
//                                     child: const Text('No'))
//                               ],
//                             );
//                             showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return FadeAnimation(.6, alert);
//                               },
//                             );
//                           },
//                           child: const Text(
//                             'Logout',
//                             style: TextStyle(fontSize: 18, color: Colors.white),
//                           ),
//                         ),
//                       ))
//                 ],
//               )
//             ]),
//       ),
//     );
//   }
// }
