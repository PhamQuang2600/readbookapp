import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  const Category(this.id, this.name);

  factory Category.fromJson(DocumentSnapshot json) {
    return Category(json.id, json['name']);
  }

  @override
  List<Object?> get props => [id, name];
}
