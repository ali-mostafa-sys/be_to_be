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

class LoadingGetChooseTenderCategoriesState extends ChooseTenderState {}

class LoadedGetChooseTenderCategoriesState extends ChooseTenderState {}

class ErrorGetChooseTenderCategoriesState extends ChooseTenderState {
  final String error;

  const ErrorGetChooseTenderCategoriesState({required this.error});

  @override
  List<Object> get props => [error];
}

///
/// here for selected categories state
///
class SelectedChooseTenderCategoriesState extends ChooseTenderState {
  final List<dynamic> categories;

  const SelectedChooseTenderCategoriesState({required this.categories});

  @override
  List<Object> get props => [categories];
}

///
/// here for get brands event
///
class LoadingGetBrandsState extends ChooseTenderState {}

class LoadedGetBrandsState extends ChooseTenderState {}

class ErrorGetBrandsState extends ChooseTenderState {
  final String error;

  const ErrorGetBrandsState({required this.error});

  @override
  List<Object> get props => [error];
}

///
/// here for selected Brand state
///
class SelectedChooseTenderBrandState extends ChooseTenderState {
  final List<dynamic> brand;

  const SelectedChooseTenderBrandState({required this.brand});

  @override
  List<Object> get props => [brand];
}

///
/// here for get product state
///

class LoadingGetProductState extends ChooseTenderState {}

class LoadedGetProductState extends ChooseTenderState {}

class ErrorGetProductState extends ChooseTenderState {
  final String error;

  const ErrorGetProductState({required this.error});

  @override
  List<Object> get props => [error];
}

///
/// here for selected product state
///

class SelectedChooseTenderProductState extends ChooseTenderState {
  final List<dynamic> product;

  const SelectedChooseTenderProductState({required this.product});

  @override
  List<Object> get props => [product];
}

///
/// here for post cares state
///
class LoadingPostCareState extends ChooseTenderState {}

class LoadedPostCareState extends ChooseTenderState {}

class ErrorPostCareState extends ChooseTenderState {
  final String error;

  const ErrorPostCareState({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

/// text cat tap state////////////////////////
class TextCatTapState extends ChooseTenderState {
  final bool tap;

  const TextCatTapState({required this.tap});

  @override
  List<Object> get props => [tap];
}

/// here for check box cat state
class ChecksBoxCatState extends ChooseTenderState{}
class CheckBoxCatState extends ChooseTenderState {
  final List<bool> listCheckBool;
  final List<bool> listExpandedBool;

  CheckBoxCatState({
    required this.listCheckBool,
    required this.listExpandedBool,
  });

  @override
  List<Object> get props => [listCheckBool,
    listExpandedBool
  ];
}
/// here for close check expanded

class CloseExpandedCatsState extends ChooseTenderState {}
class CloseExpandedCatState extends ChooseTenderState {
  final int  index;
  final List<bool> listExpandedBool;
  CloseExpandedCatState({
    required this.index,
    required this.listExpandedBool,
});

  @override
  List<Object> get props => [index,listExpandedBool];
}
/// here for check box brand of cat state selected
class CheckBoxBrandsOfCatState extends ChooseTenderState {}

class CheckBoxBrandOfCatState extends ChooseTenderState {
  final List<bool> value;
  CheckBoxBrandOfCatState({
    required this.value
});
  @override
  List<Object> get props => [value];
}


/// text brand tap state////////////////////////
class TextBrandTapState extends ChooseTenderState {
  final bool tap;

  const TextBrandTapState({required this.tap});

  @override
  List<Object> get props => [tap];
}

/// here for check box brand state
class ChecksBoxBrandsState extends ChooseTenderState{}
class CheckBoxBrandState extends ChooseTenderState {

  final List<bool> listExpandedBool;

  CheckBoxBrandState({

    required this.listExpandedBool,
  });

  @override
  List<Object> get props => [listExpandedBool];
}

/// here for check box brand of cat state selected
class CheckBoxProductOfBrandsState extends ChooseTenderState {}

class CheckBoxProductOfBrandtState extends ChooseTenderState {
  final List<bool> value;
  CheckBoxProductOfBrandtState({
    required this.value
  });
  @override
  List<Object> get props => [value];
}


///
/// here for get my interests state
///

class LoadingGetMyInterestsState extends ChooseTenderState{}
class LoadedGetMyInterestsState extends ChooseTenderState{}
class ErrorGetMyInterestsState extends ChooseTenderState{
  final String error;

  const ErrorGetMyInterestsState({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}







