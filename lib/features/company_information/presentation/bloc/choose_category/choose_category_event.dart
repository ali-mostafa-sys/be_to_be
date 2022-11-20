part of 'choose_category_bloc.dart';

abstract class ChooseCategoryEvent extends Equatable {
  const ChooseCategoryEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
/// here for product category dropDown Button event
class SelectedValueForProductCategoryEvent extends ChooseCategoryEvent{
  final String selectedProductCategory;
  const SelectedValueForProductCategoryEvent({required this.selectedProductCategory});
  @override
  // TODO: implement props
  List<Object?> get props => [selectedProductCategory];
}






