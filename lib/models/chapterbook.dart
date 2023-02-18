class ChapterBook {
  String id;
  int idChapter;
  String bookId;
  String detailChapter;
  String nameChapter;
  String nameBook;
  ChapterBook(this.id, this.idChapter, this.bookId, this.detailChapter,
      this.nameChapter, this.nameBook);

  factory ChapterBook.fromJson(Map<String, dynamic> json) => ChapterBook(
      json['id'],
      json['idChapter'],
      json['bookId'],
      json['detailChapter'],
      json['nameChapter'],
      json['nameBook']);
}
