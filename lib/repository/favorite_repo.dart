import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:readbookapp/models/favorite.dart';

class FavoriteRepository {
  final FirebaseFirestore _firebaseFirestore;

  FavoriteRepository({required FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<FavoriteBook>> getAllFavorite() {
    return _firebaseFirestore
        .collection('favorite')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((e) => FavoriteBook.fromJson(e)).toList();
    });
  }
}
