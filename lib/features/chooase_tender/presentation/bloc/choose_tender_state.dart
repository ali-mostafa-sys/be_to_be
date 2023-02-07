part of 'choose_tender_bloc.dart';

abstract class ChooseTenderState extends Equatable {
  const ChooseTenderState();
  @override
  List<Object> get props => [];
}

class ChooseTenderInitial extends ChooseTenderState {
  @override
  List<Object> get props => [];
}

///
/// here for get categories state
///

class LoadingGetChooseTenderCategoriesState extends ChooseTenderState{}
class LoadedGetChooseTenderCategoriesState extends ChooseTenderState{}
class ErrorGetChooseTenderCategoriesState extends ChooseTenderState{
  final String error;
  const ErrorGetChooseTenderCategoriesState({required this.error});
  @override
  List<Object> get props => [error];
}
///
/// here for selected categories state
///
class SelectedChooseTenderCategoriesState extends ChooseTenderState{
  final List<dynamic> categories;
  const SelectedChooseTenderCategoriesState({
    required this.categories
  });
  @override
  List<Object> get props => [categories];
}

///
/// here for get brands event
///
class LoadingGetBrandsState extends ChooseTenderState{}
class LoadedGetBrandsState extends ChooseTenderState{}
class ErrorGetBrandsState extends ChooseTenderState{
  final String error;
  const ErrorGetBrandsState({
    required this.error
});
  @override
  List<Object> get props => [error];
}

///
/// here for selected Brand state
///
class SelectedChooseTenderBrandState extends ChooseTenderState{
  final List<dynamic> brand;
  const SelectedChooseTenderBrandState({
    required this.brand
  });
  @override
  List<Object> get props => [brand];
}
///
/// here for get product state
///

class LoadingGetProductState extends ChooseTenderState{}
class LoadedGetProductState extends ChooseTenderState{}
class ErrorGetProductState extends ChooseTenderState{
  final String error;
  const ErrorGetProductState({
    required this.error
  });
  @override
  List<Object> get props => [error];
}
///
/// here for selected product state
///

class SelectedChooseTenderProductState extends ChooseTenderState{
  final List<dynamic> product;
  const SelectedChooseTenderProductState({
    required this.product
  });
  @override
  List<Object> get props => [product];
}





///
/// here for post cares state
///
class LoadingPostCareState extends ChooseTenderState{}
class LoadedPostCareState extends ChooseTenderState{}
class ErrorPostCareState extends ChooseTenderState{
  final String error;
  const ErrorPostCareState({
    required this.error,
});
  @override
  List<Object> get props => [error];
}




