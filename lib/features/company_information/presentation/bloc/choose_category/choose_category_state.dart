part of 'choose_category_bloc.dart';

abstract class ChooseCategoryState extends Equatable {
  const ChooseCategoryState();
  @override
  List<Object> get props => [];
}

class ChooseCategoryInitial extends ChooseCategoryState {
  @override
  List<Object> get props => [];
}

/// here for product category dropDown Button state

class SelectedValueForProductCategoryState extends ChooseCategoryState{
  final String selectedProductCategory;
  const SelectedValueForProductCategoryState({required this.selectedProductCategory});
  @override
  List<Object> get props => [selectedProductCategory];
}








