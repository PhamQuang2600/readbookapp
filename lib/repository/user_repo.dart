import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class UserRepository {
  var currentUser;
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebase;

  UserRepository({FirebaseFirestore? firebaseFirestore})
      : _firebase = firebaseFirestore ?? FirebaseFirestore.instance;

  registerUser(Users user) {
    _firebase
        .collection('users')
        .add(user.toJson())
        .whenComplete(() => currentUser = user);

    return currentUser;
  }

  Stream<List<Users>> getUser() {
    return _firebase.collection('users').snapshots().map((snap) {
      return snap.docs.map((e) => Users.fromJson(e)).toList();
    });
  }

  updateUser(Users user) {
    _firebase.collection('users').doc(_auth.currentUser!.uid).update({
      'address': user.address,
      'name': user.name,
      'image': user.image,
      'password': user.password
    }).whenComplete(() => currentUser = user);

    return currentUser;
  }

  signOut() {
    _auth.signOut();
    currentUser = const Users(id: '');
    return currentUser;
  }
}
