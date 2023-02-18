import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:readbookapp/models/favorite.dart';

import '../models/book.dart';
import '../models/category.dart';
import '../models/chapterbook.dart';

class BookRepository {
  final _fireCloud = FirebaseFirestore.instance.collection('books');
  final _chapterFire = FirebaseFirestore.instance.collection('chapterbook');
  final _categoriesFire = FirebaseFirestore.instance.collection('category');
  final _favoriteFire = FirebaseFirestore.instance.collection('favorite');

  Future<List<Books>> getAllBook() async {
    List<Books> books = [];
    try {
      final book = await _fireCloud.get();
      book.docs.forEach((element) {
        books.add(Books.fromJson(element.data()));
      });
      return books;
    } catch (e) {
      print(e.toString());
      return null as List<Books>;
    }
  }

  Future<Books> getById(String bookId) async {
    Books book;
    try {
      final getBook = await _fireCloud.doc(bookId).get();
      book = getBook.data() as Books;
      return book;
    } catch (e) {
      print(e.toString());
      return null as Books;
    }
  }

  Future<List<ChapterBook>> chapterByBookId(String bookId) async {
    List<ChapterBook> chapter = [];
    try {
      final chapterById =
          await _chapterFire.where('bookId', isEqualTo: bookId).get();
      chapterById.docs.forEach((element) {
        chapter.add(ChapterBook.fromJson(element.data()));
      });

      return chapter;
    } catch (e) {
      print(e.toString());
      return null as List<ChapterBook>;
    }
  }

  Future<List<Category>> getAllCategory() async {
    List<Category> cate = [];
    try {
      final getAll = await _categoriesFire.get();
      getAll.docs.forEach((element) {
        cate.add(Category.fromJson(element.data()));
      });
      return cate;
    } catch (e) {
      print(e.toString());
      return null as List<Category>;
    }
  }

  Future<List<FavoriteBook>> getAllFavorite(String uid) async {
    List<FavoriteBook> favorite = [];
    try {
      final getAll = await _favoriteFire.where('uid', isEqualTo: uid).get();
      getAll.docs.forEach((element) {
        favorite.add(FavoriteBook.fromJson(element.data()));
      });
      return favorite;
    } catch (e) {
      print(e.toString());
      return null as List<FavoriteBook>;
    }
  }

  Future<bool> addFavorite(String uid, String bookId) async {
    try {
      await _favoriteFire.doc().set({'bookid': bookId, 'userid': uid});
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
