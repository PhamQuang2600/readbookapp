class FavoriteBook {
  String id;
  String bookId;
  String userId;
  FavoriteBook(this.id, this.bookId, this.userId);

  factory FavoriteBook.fromJson(Map<String, dynamic> json) =>
      FavoriteBook(json['id'], json['bookId'], json['userId']);
}
