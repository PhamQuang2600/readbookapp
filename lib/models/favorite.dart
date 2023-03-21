import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class FavoriteBook extends Equatable {
  final String id;
  final String bookId;
  final String userId;
  const FavoriteBook(this.id, this.bookId, this.userId);

  factory FavoriteBook.fromJson(DocumentSnapshot json) =>
      FavoriteBook(json.id, json['bookId'], json['userId']);

  @override
  List<Object?> get props => [id, bookId, userId];
}
