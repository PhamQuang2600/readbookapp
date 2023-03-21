import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readbookapp/repository/book_repo.dart';

import '../../models/book.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository _bookRepository;
  StreamSubscription? _bookSubscription;
  BookBloc({required BookRepository bookRepository})
      : _bookRepository = bookRepository,
        super(BookLoading()) {
    on<GetList>(_onGetList);
    on<GetListBook>(_onGetListBook);
  }

  void _onGetList(GetList event, Emitter<BookState> emit) async {
    emit(BookLoading());
    try {
      _bookSubscription?.cancel;
      _bookSubscription = _bookRepository.getAllBook().listen(
            (book) => add(GetListBook(book)),
          );
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }

  void _onGetListBook(GetListBook event, Emitter<BookState> emit) async {
    emit(BookLoaded(event.books));
  }
}
