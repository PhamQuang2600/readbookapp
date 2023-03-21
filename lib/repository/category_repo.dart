import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/category.dart';

class CategoryRepository {
  final FirebaseFirestore _fireStore;
  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _fireStore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<Category>> getAllCategory() {
    return _fireStore.collection('category').snapshots().map((snapshot) {
      return snapshot.docs.map((e) => Category.fromJson(e)).toList();
    });
  }
}
