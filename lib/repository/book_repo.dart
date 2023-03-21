import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:readbookapp/models/favorite.dart';

import '../models/book.dart';

class BookRepository {
  final FirebaseFirestore _firestore;

  BookRepository({FirebaseFirestore? firebaseFirestore})
      : _firestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<Books>> getAllBook() {
    return _firestore.collection('books').snapshots().map((snapshot) {
      return snapshot.docs.map((e) => Books.fromJson(e)).toList();
    });
  }

  Stream<List<Books>> getRelated(String bookId) {
    return _firestore
        .collection('books')
        .where('id', isNotEqualTo: bookId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((e) => Books.fromJson(e)).toList();
    });
  }

  addFavorite(String uid, String bookId) {
    return _firestore
        .collection('favorite')
        .doc()
        .set({'bookid': bookId, 'userid': uid});
  }
}
