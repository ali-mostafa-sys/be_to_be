part of 'create_tender_bloc.dart';

abstract class CreateTenderState extends Equatable {
  const CreateTenderState();
  @override
  List<Object> get props => [];
}

class CreateTenderInitial extends CreateTenderState {
  @override
  List<Object> get props => [];
}
///
/// here for get categories state
///

class LoadingGetCategoriesCreateTenderState extends CreateTenderState{}
class LoadedGetCategoriesCreateTenderState extends CreateTenderState{}
class ErrorGetCategoriesCreateTenderState extends CreateTenderState{
  final String error;
  const ErrorGetCategoriesCreateTenderState({
    required this.error
});
  @override
  List<Object> get props => [error];

}
///
/// here for selected category state
///
class SelectedCategoryCreateTenderState extends CreateTenderState{
  final String selectedCategory;
  const SelectedCategoryCreateTenderState({
    required this.selectedCategory
});
  @override
  List<Object> get props => [selectedCategory];
}

///
/// here for get brand state
///
class LoadingGetBrandsCreateTenderState extends CreateTenderState{}
class LoadedGetBrandsCreateTenderState extends CreateTenderState{}
class ErrorGetBrandsCreateTenderState extends CreateTenderState{
  final String error;
  const ErrorGetBrandsCreateTenderState({
    required this.error
});
  @override
  List<Object> get props => [error];

}

///
/// here for selected brand state
///
class SelectedBrandCreateTenderState extends CreateTenderState{
  final String selectedBrand;
  const SelectedBrandCreateTenderState({
    required this.selectedBrand
  });
  @override
  List<Object> get props => [selectedBrand];

}
///
/// here for add brand state
///
class LoadingAddBrandState extends CreateTenderState{}
class LoadedAddBrandState extends CreateTenderState{}
class ErrorAddBrandState extends CreateTenderState{
  final String error;
  const ErrorAddBrandState({
    required this.error
  });
  @override
  List<Object> get props => [error];
}
///
/// here for pick product image state
///

class PickImageForProductState extends CreateTenderState{}
class ErrorPickImageForProductState extends CreateTenderState{}

class DeleteProductImageState extends CreateTenderState{}
///
/// here for upload ct image
///
class LoadingUploadCTImageState extends CreateTenderState{}
class LoadedUploadCTImageState extends CreateTenderState{}
class ErrorUploadCTImageState extends CreateTenderState{
  final String error;
  const ErrorUploadCTImageState({
    required this.error
  });
  @override
  List<Object> get props => [error];
}
///
/// here  for add new product state
///
class LoadingAddProductState extends CreateTenderState{}
class LoadedAddProductState extends CreateTenderState{}
class ErrorAddProductState extends CreateTenderState{
  final String error;
  const ErrorAddProductState({

    required this.error,
  });
  @override
  List<Object> get props => [error];
}


