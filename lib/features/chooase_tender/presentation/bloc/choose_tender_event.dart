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

///
/// text cat tap///////////////////////////////////////////
///
class TextCatTap extends ChooseTenderEvent{}
/// here for check  box cat  list

class CheckBoxCatSelected extends ChooseTenderEvent{
  final CategoriesChooseTenderEntity categories;
  final int index;
  const CheckBoxCatSelected({
    required this.categories,
    required this.index,
  });
  @override
  List<Object> get props => [categories,index];
}
/// here for close cat expanded
class CloseCheckCatExpanded extends ChooseTenderEvent{
  final int index;
  CloseCheckCatExpanded({
    required this.index
});
  @override
  List<Object> get props => [index];
}

/// here for check box brand of cat event selected
class  CheckBoxBrandOfCatSelectedEvent extends ChooseTenderEvent{
  final int index;
  final BrandChooseTenderEntity brandChooseTenderEntity;
  CheckBoxBrandOfCatSelectedEvent({
    required this.brandChooseTenderEntity,
    required this.index,
});
  @override
  List<Object> get props => [index,brandChooseTenderEntity];
}

///
/// text brand tap///////////////////////////////////////////
///
class TextBrandTap extends ChooseTenderEvent{}

/// here for check  box brand  list

class CheckBoxBrandSelected extends ChooseTenderEvent{

  final int index;
  const CheckBoxBrandSelected({
    required this.index,
  });
  @override
  List<Object> get props => [index];
}

/// here for check box brand of cat event selected
class  CheckBoxProductOfBrandSelectedEvent extends ChooseTenderEvent{
  final int index;
  final ProductChooseTenderEntity productChooseTenderEntity;
  CheckBoxProductOfBrandSelectedEvent({
    required this.productChooseTenderEntity,
    required this.index,
  });
  @override
  List<Object> get props => [index,productChooseTenderEntity];
}

///
/// here for get my interests event
///


class GetMyInterestsEvent extends ChooseTenderEvent{}




