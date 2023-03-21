import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readbookapp/repository/category_repo.dart';

import '../../models/category.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySub;
  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<GetCategory>(_onGetCategory);
    on<GetCategoryLoaded>(_onLoaded);
  }

  void _onGetCategory(GetCategory event, Emitter<CategoryState> emit) {
    emit(CategoryLoading());
    try {
      _categorySub?.cancel();
      _categorySub = _categoryRepository
          .getAllCategory()
          .listen((category) => add(GetCategoryLoaded(categories: category)));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }

  void _onLoaded(GetCategoryLoaded event, Emitter<CategoryState> emit) {
    emit(CategoryLoaded(categories: event.categories));
  }
}
