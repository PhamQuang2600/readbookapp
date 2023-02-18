class Books {
  String id;
  String name;
  String description;
  String author;
  List<String> genre;
  String image;
  bool isFavorite;
  bool isReadMore;
  Books(this.id, this.name, this.description, this.author, this.genre,
      this.image, this.isFavorite, this.isReadMore);

  factory Books.fromJson(Map<String, dynamic> json) => Books(
      json['id'],
      json['name'],
      json['description'],
      json['author'],
      json['genre'],
      json['image'],
      json['isFavorite'],
      json['isReadMore']);
}
