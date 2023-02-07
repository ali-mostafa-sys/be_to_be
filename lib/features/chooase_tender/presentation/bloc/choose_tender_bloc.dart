import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/brand_entity/brand_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/care_entity/care_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/categories_entity/categories_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/product_entity/product_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/usecsae/get_brand_usecase/get_brand_usecase.dart';
import 'package:be_to_be/features/chooase_tender/domain/usecsae/get_categories_usecase/get_categories_usecase.dart';
import 'package:be_to_be/features/chooase_tender/domain/usecsae/get_pruduct_usecase/get_produts_usecase.dart';
import 'package:be_to_be/features/chooase_tender/domain/usecsae/post_care_usecase/post_care_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'choose_tender_event.dart';

part 'choose_tender_state.dart';

class ChooseTenderBloc extends Bloc<ChooseTenderEvent, ChooseTenderState> {
  static ChooseTenderBloc get(context) => BlocProvider.of(context);
  final GetCategoriesChooseTenderUseCase getCategoriesChooseTenderUseCase;
  final GetBrandsChooseTenderUseCase getBrandsChooseTenderUseCase;
  final GetProductsChooseTenderUseCase getProductsChooseTenderUseCase;
  final PostCareUseCase postCareUseCase;
  final SharedPreferences sharedPreferences;

  /// here for categories drop down button
  List<CategoriesChooseTenderEntity> categoriesEntity = [];
  List<int> selectedCategoryId = [];
  List<CategoriesChooseTenderEntity> categoriesSelected = [];

  ///
  /// here for brands drop down button
  List<BrandChooseTenderEntity> brandEntity = [];
  List<int> selectedBrandId = [];
  List<BrandChooseTenderEntity> brandSelected = [];

  /// here for product drop down button
  List<ProductChooseTenderEntity> productEntity = [];
  List<int> selectedProductId = [];




  /// here for select list of list of brand

  List<List<BrandChooseTenderEntity>> listOfBrandList=[];



  ChooseTenderBloc({
    required this.getCategoriesChooseTenderUseCase,
    required this.getBrandsChooseTenderUseCase,
    required this.getProductsChooseTenderUseCase,
    required this.postCareUseCase,
    required this.sharedPreferences,
  }) : super(ChooseTenderInitial()) {
    on<ChooseTenderEvent>((event, emit) async {
      ///
      /// here for get categories
      ///
      if (event is GetChooseTenderCategoriesEvent) {
        emit(LoadingGetChooseTenderCategoriesState());
        final failureOrGetCategories = await getCategoriesChooseTenderUseCase();
        failureOrGetCategories.fold((failure) {
          emit(ErrorGetChooseTenderCategoriesState(
              error: _mapFailureToMessage(failure)));
        }, (allCategories) {
          categoriesEntity = allCategories;
          emit(LoadedGetChooseTenderCategoriesState());
        });
      }

      ///
      /// here for selected categories
      ///
      if (event is SelectedChooseTenderCategoriesEvent) {
        selectedCategoryId = [];
        categoriesSelected=[];
        event.categories.map((e) {

          selectedCategoryId.add(e.idCategory);
        }).toList();




        print(selectedCategoryId);
        emit(SelectedChooseTenderCategoriesState(categories: event.categories));
      }

      ///
      /// here for get brands event
      ///
      if (event is GetBrandsChooseTenderEvent) {
        emit(LoadingGetBrandsState());
        final failureOrGetBrands = await getBrandsChooseTenderUseCase();
        failureOrGetBrands.fold((failure) {
          emit(ErrorGetBrandsState(error: _mapFailureToMessage(failure)));
        }, (brands) {
          brandEntity = brands;
          emit(LoadedGetBrandsState());
        });
      }

      ///
      /// here for slelected brand event
      ///
      if (event is SelectedChooseTenderBrandEvent) {
        //selectedBrandId = [];
        event.brand.map((e) {
          selectedBrandId.add(e.idBrand);
          brandSelected.add(e);
        }).toList();
        emit(SelectedChooseTenderBrandState(brand: event.brand));
      }

      ///
      /// here for get product event
      ///
      if (event is GetProductChooseTenderEvent) {
        emit(LoadingGetProductState());
        final failureOrGetProduct = await getProductsChooseTenderUseCase();
        failureOrGetProduct.fold((failure) {
          emit(ErrorGetProductState(error: _mapFailureToMessage(failure)));
        }, (products) {
          productEntity = products;
          emit(LoadedGetProductState());
        });
      }

      ///
      /// here for selected product event
      ///
      if (event is SelectedChooseTenderProductEvent) {
        selectedProductId = [];
        event.product.map((e) {
          selectedProductId.add(e.idProduct);
        }).toList();
        emit(SelectedChooseTenderProductState(product: event.product));
      }

      ///
      /// here for post cares event
      ///
      if (event is PostCaresEvent) {
        final dataEntity = DataEntity(
            categoryEntity: selectedCategoryId,
            brandEntity: selectedBrandId,
            productEntity: selectedProductId);
        emit(LoadingPostCareState());
        final failureOrPostCares = await postCareUseCase(dataEntity);

        failureOrPostCares.fold((failure) {
          emit(ErrorPostCareState(error: _mapFailureToMessage(failure)));
        }, (postCare) {
           sharedPreferences.setBool('chooseTender', true);
          // chooseTenders= sharedPreferences.getBool('chooseTender');
          emit(LoadedPostCareState());
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
