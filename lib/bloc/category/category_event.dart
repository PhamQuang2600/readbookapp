part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetCategory extends CategoryEvent {}

class GetCategoryLoaded extends CategoryEvent {
  final List<Category> categories;

  const GetCategoryLoaded({required this.categories});

  @override
  List<Object> get props => [categories];
}
