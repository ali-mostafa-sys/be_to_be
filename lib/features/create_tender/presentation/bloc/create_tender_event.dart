part of 'create_tender_bloc.dart';

abstract class CreateTenderEvent extends Equatable {
  const CreateTenderEvent();
  @override
  List<Object> get props => [];
}
///
/// here for get categories
///
class GetCategoriesCreateTenderEvent extends CreateTenderEvent{}

///
/// here for selected category event
///
class SelectedCategoryCreateTenderEvent extends CreateTenderEvent{
  final String selectedCat;
  const SelectedCategoryCreateTenderEvent({
    required this.selectedCat
});
  @override
  List<Object> get props => [selectedCat];
}
///
/// here for get brand event
///

class GetBrandCreateTenderEvent extends CreateTenderEvent{}
///
/// here for selected brand event
///
class SelectedBrandCreateTenderEvent extends CreateTenderEvent{
  final String selectedBrand;
  const SelectedBrandCreateTenderEvent({
    required this.selectedBrand
});
  @override
  List<Object> get props => [selectedBrand];

}
///
/// here for post add brand event
///
class AddBrandEvent extends CreateTenderEvent{
  final AddBrandEntity addBrandEntity;
  const AddBrandEvent({
    required this.addBrandEntity
});
  @override
  List<Object> get props => [addBrandEntity];

}
///
/// here for pick product image
///
class PickProductImageEvent extends CreateTenderEvent{}

class DeleteProductImageEvent extends CreateTenderEvent{}
///
/// here for upload image
///
class UploadCTImageEvent extends CreateTenderEvent{
  final UploadCTImageEntity uploadCTImageEntity;
  const UploadCTImageEvent({
    required this.uploadCTImageEntity
});
  @override
  List<Object> get props => [uploadCTImageEntity];
}
///
/// here for add new product event
///
class AddNewProductEvent extends CreateTenderEvent{
  final AddProductEntity addProductEntity;
  const AddNewProductEvent({
    required this.addProductEntity,
});
  @override
  List<Object> get props => [addProductEntity];

}
















