// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:readbookapp/data/data_test.dart';
// import 'package:readbookapp/loading/loading.dart';
// import 'package:readbookapp/src/resouces/profile.dart';

// class EditProfilePage extends StatefulWidget {
//   const EditProfilePage({super.key});

//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   EditProfileBloc bloc = EditProfileBloc();
//   TextEditingController _image = TextEditingController();
//   final _name = TextEditingController();
//   final _email = TextEditingController();
//   final _address = TextEditingController();

//   final ImagePicker _picker = ImagePicker();

//   Future<void> _onImageButtonPressed(ImageSource source,
//       {BuildContext? context}) async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       _image = image.path as TextEditingController;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(20),
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             StreamBuilder(
//                 stream: bloc.image,
//                 builder: (context, snapshot) {
//                   return Stack(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.only(bottom: 10),
//                         height: 200,
//                         width: 200,
//                         child: CircleAvatar(
//                             child: getUser(1).image.isEmpty
//                                 ? const Icon(
//                                     Icons.person,
//                                     size: 100,
//                                   )
//                                 : Image.asset(
//                                     'assets_image/${getUser(1).image}')),
//                       ),
//                       Positioned(
//                         top: 110,
//                         left: 160,
//                         right: 0,
//                         bottom: 50,
//                         child: GestureDetector(
//                           onTap: () {
//                             _onImageButtonPressed(ImageSource.gallery,
//                                 context: context);
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.black54,
//                               borderRadius: BorderRadius.circular(40),
//                             ),
//                             child: const Icon(
//                               Icons.edit,
//                               size: 20,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   );
//                 }),
//             StreamBuilder(
//                 stream: bloc.name,
//                 builder: (context, snapshot) {
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 10),
//                     child: TextField(
//                       controller: _name,
//                       cursorColor: Colors.black,
//                       decoration: InputDecoration(
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   width: 1, color: Colors.black),
//                               borderRadius: BorderRadius.circular(15)),
//                           hintText: getUser(1).name,
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: const BorderSide(width: 1))),
//                     ),
//                   );
//                 }),
//             StreamBuilder(
//                 stream: bloc.email,
//                 builder: (context, snapshot) {
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 10),
//                     child: TextField(
//                       controller: _email,
//                       cursorColor: Colors.black,
//                       decoration: InputDecoration(
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   width: 1, color: Colors.black),
//                               borderRadius: BorderRadius.circular(15)),
//                           hintText: getUser(1).email,
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: const BorderSide(width: 1))),
//                     ),
//                   );
//                 }),
//             StreamBuilder(
//                 stream: bloc.address,
//                 builder: (context, snapshot) {
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 10),
//                     child: TextField(
//                       controller: _address,
//                       cursorColor: Colors.black,
//                       decoration: InputDecoration(
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   width: 1, color: Colors.black),
//                               borderRadius: BorderRadius.circular(15)),
//                           hintText: getUser(1).address,
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: const BorderSide(width: 1))),
//                     ),
//                   );
//                 }),
//             MaterialButton(
//               color: Colors.black,
//               onPressed: () {
//                 setState(() {
//                   if (bloc.isEdited(
//                       1, _name.text, _email.text, _address.text, _image.text)) {
//                     Users user = getUser(1);
//                     user.name = _name.text;
//                     user.address = _address.text;
//                     user.email = _email.text;
//                     user.image = _image.text;

//                     LoadingDiaLog.showLoadingDiaLog(context);
//                     Future.delayed(const Duration(seconds: 2), () {
//                       LoadingDiaLog.hideDiaLog(context);
//                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                           content: Text(
//                         'Edit profile success',
//                         style: TextStyle(fontSize: 16),
//                       )));
//                       Future.delayed(const Duration(milliseconds: 800), () {
//                         Navigator.of(context).pushReplacement(MaterialPageRoute(
//                             builder: (_) => const ProfilePage()));
//                       });
//                     });
//                   }
//                 });
//                 onClick();
//               },
//               child: const Text(
//                 'OK',
//                 style: TextStyle(fontSize: 16, color: Colors.white),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   void onClick() {}
// }
