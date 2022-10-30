import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:yomo_ecommerce/data/error_handling/failure.dart';
import 'package:yomo_ecommerce/domain/models/category.dart';
import 'package:yomo_ecommerce/domain/repository/repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final Repository repository;

  CategoryBloc({required this.repository}) : super(CategoryLoadingState()) {
    on<CategoryStarted>((event, emit) async {
      emit(CategoryLoadingState());
      (await repository.getAllCategories()).fold((failure) {
        emit(CategoryFailureState(failure: failure));
      }, (categories) {
        emit(CategorySuccessState(categories: categories));
      });
    });
  }
}
