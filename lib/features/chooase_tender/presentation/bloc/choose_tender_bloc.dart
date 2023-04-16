import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/brand_entity/brand_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/care_entity/care_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/categories_entity/categories_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/my_interests_entity/my_interests_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/product_entity/product_entity.dart';
import 'package:be_to_be/features/chooase_tender/domain/usecsae/get_brand_usecase/get_brand_usecase.dart';
import 'package:be_to_be/features/chooase_tender/domain/usecsae/get_categories_usecase/get_categories_usecase.dart';
import 'package:be_to_be/features/chooase_tender/domain/usecsae/get_my_interests_usecase/get_my_interests_usecase.dart';
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
  final GetMyInterestsUseCase getMyInterestsUseCase;
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


  /// here for new categories and brands
// on tap cat
  bool textCatTap = false;
  List<bool> checkboxCatTapList = [];
  List<bool> expandedCatList = [];
  List<bool> checkBoxBrandOfCatList = [];

  // on tap brand
  bool textBrandTap = false;
  List<bool> expandedBrandList = [];
  List<bool> checkBoxProductOfBrandtList = [];
//  List<>

  // List<bool>checkboxCatTapList=[];
  // List<bool>expandedCatList=[];
  // List<bool>checkBoxBrandOfCatList=[];
///here for get my interests
 List<MyInterestsEntity>myInterestsList=[];

  ChooseTenderBloc({
    required this.getCategoriesChooseTenderUseCase,
    required this.getBrandsChooseTenderUseCase,
    required this.getProductsChooseTenderUseCase,
    required this.postCareUseCase,
    required this.getMyInterestsUseCase,
    required this.sharedPreferences,
  }) : super(ChooseTenderInitial()) {
    on<ChooseTenderEvent>((event, emit) async {
      ///
      /// here for get my interest event
      ///
      if(event is GetMyInterestsEvent){
        emit(LoadingGetMyInterestsState());

        final failureOrGetMyInterests=await getMyInterestsUseCase();
        failureOrGetMyInterests.fold(
                (failure) {
                  emit(ErrorGetMyInterestsState(error: _mapFailureToMessage(failure)));

            },
                (myInterests) {
                  myInterests.map((e) {
                    myInterestsList.add(e);
                  }).toList();
                  print(myInterests);
                  emit(LoadedGetMyInterestsState());
                });
      }







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
          checkboxCatTapList = [];
          expandedCatList = [];
          categoriesEntity = allCategories;
          allCategories.map((e) {
            checkboxCatTapList.add(false);
            expandedCatList.add(false);
          }).toList();
          emit(LoadedGetChooseTenderCategoriesState());
        });
      }

      ///
      /// here for selected categories
      ///
      if (event is SelectedChooseTenderCategoriesEvent) {
        selectedCategoryId = [];
        categoriesSelected = [];
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
        // emit(LoadingGetBrandsState());
        emit(LoadingGetChooseTenderCategoriesState());
        final failureOrGetBrands = await getBrandsChooseTenderUseCase();
        failureOrGetBrands.fold((failure) {
          emit(ErrorGetBrandsState(error: _mapFailureToMessage(failure)));
        }, (brands) {
          checkBoxBrandOfCatList = [];
          expandedBrandList = [];
          brandEntity = brands;
          brands.map((e) {
            checkBoxBrandOfCatList.add(false);
            expandedBrandList.add(false);
          }).toList();
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
        // emit(LoadingGetProductState());
        emit(LoadingGetChooseTenderCategoriesState());
        final failureOrGetProduct = await getProductsChooseTenderUseCase();
        failureOrGetProduct.fold((failure) {
          emit(ErrorGetProductState(error: _mapFailureToMessage(failure)));
        }, (products) {
          checkBoxProductOfBrandtList=[];
          productEntity = products;
          products.map((e) {
            checkBoxProductOfBrandtList.add(false );
          }).toList();
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

      ///
      /// text cat tap event//////////////////////////////////////////////////////
      ///

      if (event is TextCatTap) {
        textCatTap = !textCatTap;
        emit(TextCatTapState(tap: textCatTap));
      }

      ///
      /// here for chexk box cat event
      ///

      if (event is CheckBoxCatSelected) {
        emit(ChecksBoxCatState());
        checkboxCatTapList[event.index] = !checkboxCatTapList[event.index];
        if (checkboxCatTapList[event.index] == true) {
          selectedCategoryId.add(event.categories.idCategory);
          expandedCatList[event.index] = true;
          ///here where i change the brand///////////////////////////////////////////////////////////////////////////////
          for(int i=0;i<brandEntity.length;i++){
            if(brandEntity[i].categoryId==event.categories.idCategory){
              checkBoxBrandOfCatList[i]=true;
              brandSelected.add(brandEntity[i]);
            }
          }
        } else if (checkboxCatTapList[event.index] == false) {
          selectedCategoryId.remove(event.categories.idCategory);
          expandedCatList[event.index] = false;
        }
        print(selectedCategoryId);
        emit(CheckBoxCatState(
            listCheckBool: checkboxCatTapList,
            listExpandedBool: expandedCatList));
      }

      /// here close expanded cat event
      if (event is CloseCheckCatExpanded) {
        emit(CloseExpandedCatsState());
        expandedCatList[event.index] = false;
        emit(CloseExpandedCatState(
            listExpandedBool: expandedCatList, index: event.index));
      }

      /// here for check box brand of cat event selected

      if (event is CheckBoxBrandOfCatSelectedEvent) {
        emit(CheckBoxBrandsOfCatState());

        checkBoxBrandOfCatList[event.index] =
            !checkBoxBrandOfCatList[event.index];
        if (checkBoxBrandOfCatList[event.index] == true) {
          brandSelected.add(event.brandChooseTenderEntity);
          selectedBrandId.add(event.brandChooseTenderEntity.idBrand);
        } else if (checkBoxBrandOfCatList[event.index] == false) {
          brandSelected.remove(event.brandChooseTenderEntity);
          selectedBrandId.remove(event.brandChooseTenderEntity.idBrand);
        }
        print(selectedBrandId);
        emit(CheckBoxBrandOfCatState(value: checkBoxBrandOfCatList));
      }

      ///
      /// text brand tap event//////////////////////////////////////////////////////
      ///

      if (event is TextBrandTap) {
        textBrandTap = !textBrandTap;
        emit(TextBrandTapState(tap: textBrandTap));
      }
      ///
      /// here for expanded box brand event
      ///

      if (event is CheckBoxBrandSelected) {
        emit(ChecksBoxBrandsState());
        expandedBrandList[event.index] = !expandedBrandList[event.index];
        print(expandedBrandList);
        emit(CheckBoxBrandState(listExpandedBool: expandedCatList));
      }
      /// here for check box brand of cat event selected

      if (event is CheckBoxProductOfBrandSelectedEvent) {
        emit(CheckBoxProductOfBrandsState());

        checkBoxProductOfBrandtList[event.index] = !checkBoxProductOfBrandtList[event.index];
        if (checkBoxProductOfBrandtList[event.index] == true) {
          selectedProductId.add(event.productChooseTenderEntity.idProduct);
        } else if (checkBoxProductOfBrandtList[event.index] == false) {
          selectedProductId.remove(event.productChooseTenderEntity.idProduct);
        }
        print(selectedProductId);
        emit(CheckBoxProductOfBrandtState(value: checkBoxProductOfBrandtList));
      }


















    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case OfflineFailure:
        return offlineFailureMessage;
      case MyInterestsIsEmptyFailure:
        return myInterestsIsEmptyMessage;

      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
