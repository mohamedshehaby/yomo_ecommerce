part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

@immutable
class CategoryLoadingState extends CategoryState {
  @override
  List<Object> get props => [];
}

@immutable
class CategorySuccessState extends CategoryState {
  final List<Category> categories;

  const CategorySuccessState({
    required this.categories,
  });

  @override
  List<Object> get props => [categories];
}

@immutable
class CategoryFailureState extends CategoryState {
  final Failure failure;

  const CategoryFailureState({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}
