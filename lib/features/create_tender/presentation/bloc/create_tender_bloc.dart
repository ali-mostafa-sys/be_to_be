import 'dart:async';
import 'dart:io';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/create_tender/domain/entity/add_brand_entity/add_brand_entity.dart';
import 'package:be_to_be/features/create_tender/domain/entity/add_product_entity/add_product_entity.dart';
import 'package:be_to_be/features/create_tender/domain/entity/brand_entity/brand_create_tender_entity.dart';
import 'package:be_to_be/features/create_tender/domain/entity/category_entity/category_create_tender_entity.dart';
import 'package:be_to_be/features/create_tender/domain/entity/upload_ct_image_entity/upload_ct_image_entity.dart';
import 'package:be_to_be/features/create_tender/domain/usecase/add_brand_usecase/add_brand_usecase.dart';
import 'package:be_to_be/features/create_tender/domain/usecase/add_product_usecase/add_product_usecase.dart';
import 'package:be_to_be/features/create_tender/domain/usecase/get_brands_usecase/get_create_tender_brands_usecase.dart';
import 'package:be_to_be/features/create_tender/domain/usecase/get_categories_usecase/get_create_tender_categories_usecase.dart';
import 'package:be_to_be/features/create_tender/domain/usecase/upload_ct_image_usecase/upload_ct_image_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'create_tender_event.dart';
part 'create_tender_state.dart';

class CreateTenderBloc extends Bloc<CreateTenderEvent, CreateTenderState> {
  static CreateTenderBloc get(context)=> BlocProvider.of(context);
  final GetCreateTenderCategoriesUseCase getCreateTenderCategoriesUseCase;
  final GetCreateTenderBrandsUseCase getCreateTenderBrandsUseCase;
  final AddBrandUseCase addBrandUseCase;
  final UploadCTImageUseCase uploadCTImageUseCase;
  final AddProductUseCase addProductUseCase;
  /// here for categories
  List<CategoriesCreateTenderEntity>categoriesList=[];
  String? selectedCategory;
  int? selectedCategoryId;
/// here for brands
List<BrandCreateTenderEntity>brandsList=[];
String? selectedBrand;
int? selectedBrandId;
  /// here for pick product image
  File? productImage;
  ImagePicker pickedProductImage = ImagePicker();
  String? imageUrl;

  Future getProductImage() async {
    final imagePicked =
    await pickedProductImage.pickImage(source: ImageSource.gallery);
    if (imagePicked == null) return;

    if (imagePicked != null) {
      File imageTemporary = File(imagePicked.path);
      productImage = imageTemporary;
      emit(PickImageForProductState());

      print('Success');
    } else {
      print('Error');
      emit(ErrorPickImageForProductState());
    }
  }




  CreateTenderBloc({
    required this.getCreateTenderCategoriesUseCase,
    required this.getCreateTenderBrandsUseCase,
    required this.addBrandUseCase,
    required this.uploadCTImageUseCase,
    required this.addProductUseCase,

}) : super(CreateTenderInitial()) {
    on<CreateTenderEvent>((event, emit)async {
      ///
      /// here for get categories
      ///
      if(event is GetCategoriesCreateTenderEvent){
        emit(LoadingGetCategoriesCreateTenderState());
        final failureOrGetCategories=await getCreateTenderCategoriesUseCase();
        failureOrGetCategories.fold(
                (failure) {
                  emit(ErrorGetCategoriesCreateTenderState(error: _mapFailureToMessage(failure)));
                  },
                (categories) {
                  categoriesList=categories;


                  emit(LoadedGetCategoriesCreateTenderState());
            });




      }
      ///
      /// here for selected category event
      ///
  if(event is SelectedCategoryCreateTenderEvent){
    selectedCategory=event.selectedCat;

    categoriesList.map((e) {
      if(event.selectedCat==e.nameEn){
        selectedCategoryId=e.idCategory;
      }
    }).toList();
    print(selectedCategoryId);
    emit(SelectedCategoryCreateTenderState(selectedCategory:event.selectedCat));
  }
  ///
      /// here for get brands event
      ///
if(event is GetBrandCreateTenderEvent){
  emit(LoadingGetBrandsCreateTenderState());
  final failureOrGetBrands=await getCreateTenderBrandsUseCase();
  failureOrGetBrands.fold(
          (failure) {
            emit(ErrorGetBrandsCreateTenderState(error: _mapFailureToMessage(failure)));
      },
          (brands) {
            brandsList=brands;
            emit(LoadedGetBrandsCreateTenderState());


          });
}
///
      /// here for selected brand
      ///
if(event is SelectedBrandCreateTenderEvent){
  selectedBrand=event.selectedBrand;
  brandsList.map((e) {
    if(event.selectedBrand==e.nameEn){
      selectedBrandId=e.idBrand;
    }
  }).toList();
  emit(SelectedBrandCreateTenderState(selectedBrand: event.selectedBrand));
}
///
      /// here for add new brand event
      ///
if(event is AddBrandEvent){

  emit(LoadingAddBrandState());

  final failureOrAddBrand=await addBrandUseCase(event.addBrandEntity);
  failureOrAddBrand.fold(
          (failure) {
            emit(ErrorAddBrandState(error: _mapFailureToMessage(failure)));
          },
          (addBrand) {
            emit(LoadedAddBrandState());

      });

}

///
      /// here for pick product image event
      ///
if(event is PickProductImageEvent){
  getProductImage();

}
///
      /// here for delete product image event
      ///
if(event is DeleteProductImageEvent){

  productImage=null;
  emit(DeleteProductImageState());
}
///
      /// here for upload image event
      ///

if(event is UploadCTImageEvent){
  emit(LoadingUploadCTImageState());

  final failureOrUploadImage = await uploadCTImageUseCase(event.uploadCTImageEntity);
  failureOrUploadImage.fold(
          (failure) {
            emit(ErrorUploadCTImageState(error: _mapFailureToMessage(failure)));

          },
          (uploaded) {
            imageUrl=uploaded;
            print(imageUrl);
            emit(LoadedUploadCTImageState());

          });

}
///
      /// here for add new product event
      ///

      if(event is AddNewProductEvent){
        emit(LoadingAddProductState());
        final failureOrAddProduct=await addProductUseCase(event.addProductEntity);
        failureOrAddProduct.fold(
                (failure) {
                  emit(ErrorAddProductState(error: _mapFailureToMessage(failure)));
                },
                (addProduct) {
                  emit(LoadedAddProductState());

            });

      }









    });
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case OfflineFailure:
        return offlineFailureMessage;

      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
