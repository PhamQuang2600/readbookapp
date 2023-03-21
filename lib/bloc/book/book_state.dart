part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final List<Books> books;
  const BookLoaded(this.books);

  @override
  List<Object> get props => [books];
}

class BookError extends BookState {
  final String message;

  const BookError(this.message);

  @override
  List<Object> get props => [message];
}

//book related
abstract class BookRelatedState extends Equatable {
  const BookRelatedState();

  @override
  List<Object> get props => [];
}

class BookRelatedLoading extends BookRelatedState {}

class BookRelated extends BookRelatedState {
  final List<Books> books;
  const BookRelated(this.books);

  @override
  List<Object> get props => [books];
}

class BookRelatedError extends BookRelatedState {
  final String message;

  const BookRelatedError(this.message);

  @override
  List<Object> get props => [message];
}

//book search
abstract class BookSearchState extends Equatable {
  const BookSearchState();

  @override
  List<Object> get props => [];
}

class BookSearchLoading extends BookSearchState {}

class BookSearched extends BookSearchState {
  final List<Books> books;
  const BookSearched(this.books);

  @override
  List<Object> get props => [books];
}

class BookSearchError extends BookSearchState {
  final String message;

  const BookSearchError(this.message);

  @override
  List<Object> get props => [message];
}

//book favorite
abstract class BookFavoriteState extends Equatable {
  const BookFavoriteState();

  @override
  List<Object> get props => [];
}

class BookFavoriteLoading extends BookFavoriteState {}

class BookFavorited extends BookFavoriteState {
  final List<Books> books;
  const BookFavorited(this.books);

  @override
  List<Object> get props => [books];
}

class BookFavoriteError extends BookFavoriteState {
  final String message;

  const BookFavoriteError(this.message);

  @override
  List<Object> get props => [message];
}
