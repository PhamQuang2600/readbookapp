class ChapterBook {
  int idChapter;

  String detailChapter;
  String nameChapter;

  ChapterBook(this.idChapter, this.detailChapter, this.nameChapter);

  factory ChapterBook.fromJson(Map<String, dynamic> json) =>
      ChapterBook(json['id'], json['idChapter'], json['nameChapter']);
}
