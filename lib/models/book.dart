import 'package:equatable/equatable.dart';

class Books extends Equatable {
  final String id;
  final String name;
  final String description;
  final String author;
  final List<dynamic> genre;
  final List<dynamic> chapter;
  final String image;
  bool isFavorite;
  bool isReadMore;
  bool isFeature;
  Books(
      this.id,
      this.name,
      this.description,
      this.author,
      this.genre,
      this.chapter,
      this.image,
      this.isFavorite,
      this.isReadMore,
      this.isFeature);

  factory Books.fromJson(json) => Books(
        json.id,
        json['name'],
        json['description'],
        json['author'],
        json['genre'],
        json['chapter'],
        json['image'],
        json['isFavorite'],
        json['isReadMore'],
        json['isFeature'],
      );

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        author,
        genre,
        chapter,
        image,
        isFavorite,
        isReadMore,
        isFeature
      ];
}
