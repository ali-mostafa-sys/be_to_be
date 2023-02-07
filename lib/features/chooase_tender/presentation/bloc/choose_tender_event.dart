part of 'choose_tender_bloc.dart';

abstract class ChooseTenderEvent extends Equatable {
  const ChooseTenderEvent();
  @override
  List<Object> get props => [];
}

///
/// here for get categories
///
class GetChooseTenderCategoriesEvent extends ChooseTenderEvent{}
///
/// here for selected categories event
///
class SelectedChooseTenderCategoriesEvent extends ChooseTenderEvent{
  final List<dynamic> categories;
  const SelectedChooseTenderCategoriesEvent({
    required this.categories
});
  @override
  List<Object> get props => [categories];
}
///
/// here for get brands event
///
class GetBrandsChooseTenderEvent extends ChooseTenderEvent{}
///
/// here for selected brand event
///
class SelectedChooseTenderBrandEvent extends ChooseTenderEvent{
  final List<dynamic> brand;
  const SelectedChooseTenderBrandEvent({
    required this.brand
  });

  @override
  List<Object> get props => [brand];
}
///
/// here for get all product event
///
class GetProductChooseTenderEvent extends  ChooseTenderEvent{}
///
/// here for selected product event
///

class SelectedChooseTenderProductEvent extends ChooseTenderEvent{
  final List<dynamic> product;
  const SelectedChooseTenderProductEvent({
    required this.product
  });

  @override
  List<Object> get props => [product];
}









///
/// here for post cares
///

class PostCaresEvent extends ChooseTenderEvent{}


