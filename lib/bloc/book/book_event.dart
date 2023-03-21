part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class GetList extends BookEvent {}

class GetListBook extends BookEvent {
  final List<Books> books;
  const GetListBook(this.books);

  @override
  List<Object> get props => [books];
}

class GetBook extends BookEvent {
  final String bookId;
  const GetBook(this.bookId);

  @override
  List<Object> get props => [bookId];
}

class GetRelated extends BookEvent {
  final String bookId;
  const GetRelated(this.bookId);

  @override
  List<Object> get props => [bookId];
}

class GetRelatedBook extends BookEvent {
  final List<Books> books;
  const GetRelatedBook(this.books);

  @override
  List<Object> get props => [books];
}
