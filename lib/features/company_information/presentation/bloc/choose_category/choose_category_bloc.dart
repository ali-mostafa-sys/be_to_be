import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'choose_category_event.dart';
part 'choose_category_state.dart';

class ChooseCategoryBloc extends Bloc<ChooseCategoryEvent, ChooseCategoryState> {

  static ChooseCategoryBloc get(context)=>BlocProvider.of(context);

  // here for product category dropDown Button
  final List<String> productCategory = ['ali','mo,','sa','ka','da','aa'];
  String? selectedProductCategory;
  int? selectedProductCategoryId;



  ChooseCategoryBloc() : super(ChooseCategoryInitial()) {
    on<ChooseCategoryEvent>((event, emit) {
      ///
      /// here for product category dropDown Button
      ///

      if(event is SelectedValueForProductCategoryEvent){
        selectedProductCategory=event.selectedProductCategory;
        emit(SelectedValueForProductCategoryState(selectedProductCategory: selectedProductCategory!));
      }





    });
  }
}
