import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class UserRepository {
  var currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final _firebase = FirebaseAuth.instance;

  Future<void> registerUser(SignUp user) async {
    try {
      await users.add(user.toJson());
    } catch (_) {}
  }

  Future<void> signIn(String account, String password) async {
    try {
      await _firebase.signInWithEmailAndPassword(
          email: account, password: password);
    } catch (_) {}
  }

  Future<void> signOut() async {
    try {
      await Future.wait([_firebase.signOut()]);
    } catch (_) {}
  }

  Future<Users> updateUser(Users user) async {
    try {
      var updateUser = await users.doc(user.id).update({
        'address': user.address,
        'name': user.name,
        'image': user.image,
        'password': user.password
      });
      return updateUser as Users;
    } catch (_) {
      return null as Users;
    }
  }

  Future<Users> getById(String uid) async {
    try {
      currentUser = _firebase.currentUser!.uid;
      Users user = await users.doc(currentUser).get() as Users;
      return user;
    } catch (_) {
      return null as Users;
    }
  }
}
