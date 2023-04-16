import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/error_page_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/chooase_tender/presentation/bloc/choose_tender_bloc.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:be_to_be/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../core/routs/routes.gr.dart';

class ChooseTenderPage extends StatelessWidget {
  const ChooseTenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => di.sl<ChooseTenderBloc>()
        ..add(GetChooseTenderCategoriesEvent())
        ..add(GetBrandsChooseTenderEvent())
        ..add(GetProductChooseTenderEvent())..add(GetMyInterestsEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Receive Tender',
              style: TextStyle(color: Colors.white),
            ),
            leading: Container(),
            backgroundColor: primaryColor,
          ),
          body: BlocConsumer<ChooseTenderBloc, ChooseTenderState>(
            listener: (context, state) {
              print(state);
              if (state is LoadedPostCareState) {
                SnackBarMessage().showSnackBar(
                    message: 'Added Successfully ',
                    backgroundColor: primaryColor,
                    context: context);
                Future.delayed(Duration(seconds: 2)).then((value) =>
                    AutoRouter.of(context).pushAndPopUntil(MainPage(),
                        predicate: (route) => false));
              }
              if (state is ErrorPostCareState) {
                SnackBarMessage().showSnackBar(
                    message: state.error,
                    backgroundColor: Colors.redAccent,
                    context: context);
              }
            },
            builder: (context, state) {
              var choBloc = ChooseTenderBloc.get(context);
              if (state is LoadingPostCareState) {
                return const LoadingWidget();
              }
              if (state is LoadingGetChooseTenderCategoriesState) {
                return const LoadingWidget();
              }
              // if (state is LoadingGetBrandsState) {
              //   return const LoadingWidget();
              // }
              // if (state is LoadingGetProductState) {
              //   return const LoadingWidget();
              // }
              if(state is ErrorGetChooseTenderCategoriesState){
                return ErrorPageWidget(errorText: state.error, onTap: (){
                  choBloc.add(GetChooseTenderCategoriesEvent());
                });
              }
              if(state is ErrorGetBrandsState){
                return ErrorPageWidget(errorText: state.error, onTap: (){
                  choBloc.add(GetBrandsChooseTenderEvent());
                });
              }
              if(state is ErrorGetProductState){
                return ErrorPageWidget(errorText: state.error, onTap: (){
                  choBloc.add(GetProductChooseTenderEvent());
                });
              }
              return BackgroundWidget(
                widgets: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Text(
                        'Receive tenders which',
                        style:
                            TextStyle(color: primaryColor, fontSize: w * 0.06),
                      ),
                      Text(
                        'belong to your aspirations',
                        style:
                            TextStyle(color: primaryColor, fontSize: w * 0.06),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Text(
                        'My Interests',
                        style:
                        TextStyle(color: primaryColor, fontSize: w * 0.06),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      state is LoadingGetMyInterestsState?const LoadingWidget():
                      Container(
                        height: h*0.3,
                        width: w*0.9,
                        padding: EdgeInsets.symmetric(horizontal: w*0.03),
                        decoration: BoxDecoration(
                          
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: SingleChildScrollView(
                          child:
                          state is ErrorGetMyInterestsState?ErrorPageWidget(onTap: (){
                            choBloc.add(GetMyInterestsEvent());
                          },errorText: '${state.error}',):
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width:w*0.28,
                                      height: h*0.04,
                                      child: Center(child: Text('Categories',style: TextStyle(color: primaryColor),)),
                                  ),
                          Container(
                            width:w*0.28,
                            height: h*0.04,
                                child:  Center(child: Text('Brands',style: TextStyle(color: primaryColor),))),
                          Container(
                            width:w*0.28,
                            height: h*0.04,
                            child:
                                  Center(child: Text('Products',style: TextStyle(color: primaryColor),))),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                             Column(
                               children: choBloc.myInterestsList.map((e) {
                                 return Row(
                                   children: [
                                     Container(
                                       width: w*0.28,
                                       height: h*0.07,
                                       color: primaryColor.withOpacity(0.8),
                                       child: Center(child: Text(e.categoryName==null?'-':'${e.categoryName}')),
                                     ),
                                     Container(
                                       width: w*0.28,
                                       height: h*0.07,
                                       color: primaryColor.withOpacity(0.6),
                                       child: Center(child: Text(e.brandName==null?'-':'${e.brandName}')),
                                     ),
                                     Container(
                                       width: w*0.28,
                                       height: h*0.07,
                                       color: primaryColor.withOpacity(0.4),
                                       child: Center(child: Text(e.productName==null?'-':'${e.productName}')),
                                     ),

                                   ],
                                 );
                               }).toList(),
                             )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.1,
                      ),

                      /// here for cat and brand

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                        child: TextFormField(
                          keyboardType: TextInputType.none,
                          decoration: InputDecoration(
                              hintText: 'Select categories and brands',
                              hintStyle: TextStyle(color: primaryColor),
                              suffixIcon: Icon(
                                Icons.arrow_drop_down_outlined,
                                color: primaryColor,
                                size: 30,
                              )),
                          onTap: () {
                            choBloc.add(TextCatTap());
                          },
                        ),
                      ),
                      choBloc.textCatTap == false
                          ? Container()
                          : Container(
                              width: w * 0.8,
                              height: h * 0.5,
                              padding: EdgeInsets.symmetric(
                                  horizontal: w * 0.01, vertical: w * 0.01),
                              decoration: BoxDecoration(
                                  color: HexColor("#DCDCDC"),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: choBloc.categoriesEntity.map((cat) {
                                    int index = choBloc.categoriesEntity.indexOf(cat);
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text('${cat.nameEn}'),
                                            const Spacer(),
                                            Checkbox(
                                                value: choBloc.checkboxCatTapList[index],
                                                onChanged: (value) {
                                                  choBloc.add(CheckBoxCatSelected(categories: choBloc.categoriesEntity[index],index: index));
                                                }),
                                          ],
                                        ),
                                        choBloc.expandedCatList[index] == false
                                            ? Container()
                                            : Column(
                                            children: [
                                                Column(
                                                  children: choBloc.brandEntity.map((brand) {
                                                    int indexs = choBloc.brandEntity.indexOf(brand);
                                                    return choBloc.categoriesEntity[index].idCategory == choBloc.brandEntity[indexs].categoryId
                                                        ? Container(
                                                            width: w * 0.5,
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                    '${choBloc.brandEntity[indexs].nameEn}'),
                                                                Spacer(),
                                                                Checkbox(
                                                                    value: choBloc.checkBoxBrandOfCatList[indexs],
                                                                    onChanged: (onChanged) {
                                                                      print(indexs);
                                                                      choBloc.add(CheckBoxBrandOfCatSelectedEvent(index: indexs, brandChooseTenderEntity: choBloc.brandEntity[indexs]));
                                                                    })
                                                              ],
                                                            ),
                                                          )
                                                        : Container();
                                                  }).toList(),
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      choBloc.add(CloseCheckCatExpanded(index: index));
                                                    },
                                                    child: Text('Ok',
                                                      style: TextStyle(
                                                          color: primaryColor),
                                                    ),
                                                ),
                                              ])
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                      /// here second drop down button
                      // choBloc.textCatTap==false?Container():
                      // Container(
                      //   height: h*0.4,
                      //   width:w*0.8,
                      //   padding: EdgeInsets.symmetric(horizontal: w*0.01,vertical:w*0.01 ),
                      //
                      //   decoration: BoxDecoration(
                      //     color: HexColor("#DCDCDC"),
                      //
                      //     borderRadius: BorderRadius.all(Radius.circular(25))
                      //   ),
                      //   child: ListView.separated(
                      //       itemBuilder: (context,index){
                      //         return Container(
                      //           child: Column(
                      //             children: [
                      //               Row(
                      //
                      //                 children: [
                      //                   Text('${choBloc.categoriesEntity[index].nameEn}'),
                      //                   Spacer(),
                      //                   Checkbox(value: choBloc.checkboxCatTapList[index], onChanged: (value){
                      //                     choBloc.add(CheckBoxCatSelected(categories: choBloc.categoriesEntity[index], index: index));
                      //
                      //                   }),
                      //                 ],
                      //               ),
                      //               choBloc.expandedCatList[index]==false?Container():
                      //
                      //               Container(
                      //                 height: h*0.3,
                      //                 width:w*0.5,
                      //                 child:Column(
                      //                   children: [
                      //                     Container(
                      //                       height: h*0.2,
                      //                       child: ListView.separated(
                      //                           itemBuilder: (context,indexs){
                      //                             return
                      //                               choBloc.categoriesEntity[index].idCategory==choBloc.brandEntity[indexs].categoryId?
                      //                               Container(
                      //                                 child: Row(
                      //                                   children: [
                      //                                     Text(
                      //
                      //                                         '${ choBloc.brandEntity[indexs].nameEn}'
                      //                                     ),
                      //                                     Spacer(),
                      //                                     Checkbox(value: choBloc.checkBoxBrandOfCatList[indexs], onChanged: (onChanged){
                      //                                       print(indexs);
                      //
                      //                                       choBloc.add(CheckBoxBrandOfCatSelectedEvent(index: indexs,brandChooseTenderEntity: choBloc.brandEntity[indexs]));
                      //                                     })
                      //                                   ],
                      //                                 ),
                      //                               ):Container();
                      //                           },
                      //                           separatorBuilder: (context,indexs)=>Container(),
                      //                           itemCount:  choBloc.brandEntity.length),
                      //                     ),
                      //                     TextButton(onPressed: (){
                      //                       choBloc.add(CloseCheckCatExpanded(index:index ));
                      //                     }, child: Text('Ok',style: TextStyle(
                      //                       color: primaryColor
                      //                     ),))
                      //
                      //                   ],
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //
                      //         );
                      //       },
                      //       separatorBuilder: (context,index)=>Container(),
                      //       itemCount: choBloc.categoriesEntity.length),
                      // ),

                      SizedBox(
                        height: h * 0.05,
                      ),

                      /// here for brand

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                        child: TextFormField(
                          keyboardType: TextInputType.none,
                          decoration: InputDecoration(
                              hintText: 'Select products',
                              hintStyle: TextStyle(color: primaryColor),
                              suffixIcon: Icon(
                                Icons.arrow_drop_down_outlined,
                                color: primaryColor,
                                size: 30,
                              )),
                          onTap: () {
                            choBloc.add(TextBrandTap());
                          },
                        ),
                      ),
                      choBloc.textBrandTap == false
                          ? Container()
                          : Container(
                        width: w * 0.8,
                        height: h * 0.5,
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.01, vertical: w * 0.01),
                        decoration: BoxDecoration(
                            color: HexColor("#DCDCDC"),
                            borderRadius:
                            BorderRadius.all(Radius.circular(25))),
                        child: SingleChildScrollView(
                          child: Column(

                            children: choBloc.brandSelected.map((brand) {

                              int index = choBloc.brandSelected.indexOf(brand);

                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          '${choBloc.brandSelected[index].nameEn}'),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          choBloc.add(CheckBoxBrandSelected(index: index));
                                        },
                                        child: Icon(
                                          Icons
                                              .arrow_drop_down_outlined,
                                          color: primaryColor,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  choBloc.expandedBrandList[index] == false
                                      ? Container()
                                      : Column(
                                      children: [
                                        Column(
                                          children: choBloc.productEntity.map((product) {
                                            int indexs = choBloc.productEntity.indexOf(product);
                                            return choBloc.brandSelected[index].idBrand == choBloc.productEntity[indexs].brandId
                                                ? Container(
                                              width: w * 0.5,
                                              child: Row(
                                                children: [
                                                  Text(
                                                      '${choBloc.productEntity[indexs].nameEn}'),
                                                  Spacer(),
                                                  Checkbox(
                                                      value: choBloc.checkBoxProductOfBrandtList[indexs],
                                                      onChanged: (onChanged) {
                                                        print(indexs);
                                                        choBloc.add(CheckBoxProductOfBrandSelectedEvent(index: indexs, productChooseTenderEntity: choBloc.productEntity[indexs]));
                                                      })
                                                ],
                                              ),
                                            )
                                                : Container();
                                          }).toList(),
                                        ),
                                        // TextButton(
                                        //   onPressed: () {
                                        //     choBloc.add(CloseCheckCatExpanded(index: index));
                                        //   },
                                        //   child: Text('Ok',
                                        //     style: TextStyle(
                                        //         color: primaryColor),
                                        //   ),
                                        // ),
                                      ])
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),


/// here second drop down button
                      // choBloc.textBrandTap == false
                      //     ? Container()
                      //     : Container(
                      //         height: h * 0.4,
                      //         width: w * 0.8,
                      //         padding: EdgeInsets.symmetric(
                      //             horizontal: w * 0.01, vertical: w * 0.01),
                      //         decoration: BoxDecoration(
                      //             color: HexColor("#DCDCDC"),
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(25))),
                      //         child: ListView.separated(
                      //             itemBuilder: (context, index) {
                      //               return Container(
                      //                 child: Column(
                      //                   children: [
                      //                     Row(
                      //                       children: [
                      //                         Text(
                      //                             '${choBloc.brandEntity[index].nameEn}'),
                      //                         Spacer(),
                      //                         InkWell(
                      //                           onTap: () {
                      //                             choBloc.add(
                      //                                 CheckBoxBrandSelected(
                      //                                     index: index));
                      //                           },
                      //                           child: Icon(
                      //                             Icons
                      //                                 .arrow_drop_down_outlined,
                      //                             color: primaryColor,
                      //                             size: 30,
                      //                           ),
                      //                         )
                      //                         //   Checkbox(value: true
                      //                         // //  choBloc.checkboxCatTapList[index]
                      //                         //       , onChanged: (value){
                      //                         //   //  choBloc.add(CheckBoxCatSelected(categories: choBloc.categoriesEntity[index], index: index));
                      //                         //
                      //                         //   }),
                      //                       ],
                      //                     ),
                      //                     choBloc.expandedBrandList[index] ==
                      //                             false
                      //                         ? Container()
                      //                         : Container(
                      //                             height: h * 0.3,
                      //                             width: w * 0.5,
                      //                             child: Column(
                      //                               children: [
                      //                                 Container(
                      //                                   height: h * 0.2,
                      //                                   child:
                      //                                       ListView.separated(
                      //                                           itemBuilder:
                      //                                               (context,
                      //                                                   indexs) {
                      //                                             return choBloc
                      //                                                         .brandEntity[
                      //                                                             index]
                      //                                                         .idBrand ==
                      //                                                     choBloc
                      //                                                         .productEntity[indexs]
                      //                                                         .brandId
                      //                                                 ? Container(
                      //                                                     child:
                      //                                                         Row(
                      //                                                       children: [
                      //                                                         Text('${choBloc.productEntity[indexs].nameEn}'),
                      //                                                         Spacer(),
                      //                                                         Checkbox(
                      //                                                             value: choBloc.checkBoxProductOfBrandtList[indexs],
                      //                                                             onChanged: (onChanged) {
                      //                                                               print(indexs);
                      //
                      //                                                               choBloc.add(CheckBoxProductOfBrandSelectedEvent(index: indexs, productChooseTenderEntity: choBloc.productEntity[indexs]));
                      //                                                             })
                      //                                                       ],
                      //                                                     ),
                      //                                                   )
                      //                                                 : Container();
                      //                                           },
                      //                                           separatorBuilder:
                      //                                               (context,
                      //                                                       indexs) =>
                      //                                                   Container(),
                      //                                           itemCount: choBloc
                      //                                               .productEntity
                      //                                               .length),
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                           )
                      //                   ],
                      //                 ),
                      //               );
                      //             },
                      //             separatorBuilder: (context, index) =>
                      //                 Container(),
                      //             itemCount: choBloc.categoriesEntity.length),
                      //       ),
                    /// here fist drop down button
                      //  SizedBox(
                      //    height: h * 0.05,
                      //  ),
                      //
                      //
                      //
                      //
                      //  DropDownButtonChooseTenderWidget(
                      //    buttonText: 'Enter Product Category',
                      //    searchHint: 'Search for your Category',
                      //    items: choBloc.categoriesEntity.map((e) => MultiSelectItem(e, e.nameEn)).toList(),
                      //    onChange: ( category){
                      //     // print(category.runtimeType);
                      //     // print("$category  ali");
                      //      choBloc.add(SelectedChooseTenderCategoriesEvent(categories: category));
                      //
                      //    },
                      //  ),
                      // // choBloc.selectedCategoryId.isEmpty?Container():
                      //  SizedBox(
                      //    height: h * 0.05,
                      //  ),
                      //  // choBloc.selectedCategoryId.isEmpty?Container():
                      //  // Container(
                      //  //   height: h*0.5,
                      //  //   width: w,
                      //  //   child: ListView.separated(
                      //  //       itemBuilder: (context,index){
                      //  //         return DropDownButtonChooseTenderWidget(
                      //  //           buttonText: ' Brand for ${choBloc.categoriesSelected[index].nameEn} ',
                      //  //           searchHint: 'Search for your Brand',
                      //  //           items: choBloc.brandEntity.map((e) => MultiSelectItem(e, e.nameEn)).toList(),
                      //  //           onChange: ( brands){
                      //  //             // print(category.runtimeType);
                      //  //             print("$brands  ali");
                      //  //             choBloc.add(SelectedChooseTenderBrandEvent(brand: brands));
                      //  //             // choBloc.add(SelectedChooseTenderCategoriesEvent(categories: b));
                      //  //
                      //  //           },
                      //  //         );
                      //  //       },
                      //  //       separatorBuilder: (context,index)=>SizedBox(
                      //  //         height: h * 0.05,
                      //  //       ),
                      //  //       itemCount: choBloc.selectedCategoryId.length),
                      //  // ),
                      //
                      //  DropDownButtonChooseTenderWidget(
                      //    buttonText: 'Enter Product Brand',
                      //    searchHint: 'Search for your Brand',
                      //    items: choBloc.brandEntity.map((e) => MultiSelectItem(e, e.nameEn)).toList(),
                      //    onChange: ( brands){
                      //      // print(category.runtimeType);
                      //       print("$brands  ali");
                      //       choBloc.add(SelectedChooseTenderBrandEvent(brand: brands));
                      //     // choBloc.add(SelectedChooseTenderCategoriesEvent(categories: b));
                      //
                      //    },
                      //  ),
                      //  SizedBox(
                      //    height: h * 0.05,
                      //  ),
                      //  DropDownButtonChooseTenderWidget(
                      //    buttonText: 'Enter Product Names',
                      //    searchHint: 'Search for your Product Names',
                      //    items: choBloc.productEntity.map((e) => MultiSelectItem(e, e.nameEn)).toList(),
                      //    onChange: ( products){
                      //      // print(category.runtimeType);
                      //      print("$products  ali");
                      //      choBloc.add(SelectedChooseTenderProductEvent(product: products));
                      //
                      //      // choBloc.add(SelectedChooseTenderCategoriesEvent(categories: b));
                      //
                      //    },
                      //  ),

                      SizedBox(
                        height: h * 0.05,
                      ),
                      BlocConsumer<MainPageBloc, MainPageState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.3),
                            child: ButtonTextWidget(
                                padding: 0,
                                backgroundColor: primaryColor,
                                text: 'Finish',
                                textColor: Colors.white,
                                textSize: w * 0.05,
                                onPressed: () {
                                  if (choBloc.selectedProductId.isEmpty &&
                                      choBloc.selectedBrandId.isEmpty &&
                                      choBloc.selectedCategoryId.isEmpty) {
                                    SnackBarMessage().showSnackBar(
                                        message:
                                            'You Should select one of this tender at least ',
                                        backgroundColor: Colors.redAccent,
                                        context: context);
                                  } else {
                                    choBloc.add(PostCaresEvent());
                                    Future.delayed(Duration(seconds: 1))
                                        .then((value) {
                                      MainPageBloc.get(context)
                                          .add(IsLoggedEvent());
                                    });
                                  }
                                }),
                          );
                        },
                      ),
                      SizedBox(
                        height: h * 0.05,
                      ),

                      // FlutterTreePro(
                      //     listData:
                      //     choBloc.categoriesEntity as List<Map<String, dynamic>>
                      //     ,
                      //     initialListData:choBloc.brandEntity as List<Map<String, dynamic>>,
                      //     config: Config(
                      //      // parentId:choBloc.categoriesEntity as List<Map<String, dynamic>>,
                      //       dataType: DataType.DataList,
                      //       label: 'value',
                      //     ),
                      //
                      //     onChecked: (List<Map<String, dynamic>> checkedList) {
                      //       logger.v(checkedList);
                      //     }
                      // ),
                      ///gfgyt///////////

                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                      //   child: MultiSelectDialogField(
                      //
                      //     items:
                      //     choBloc.categoriesEntity.map((e){
                      //       return  MultiSelectItem(
                      //           e,
                      //           e.nameEn,
                      //
                      //
                      //       );
                      //     }).toList()
                      //     ,
                      //     onConfirm:
                      //     //onChange
                      //         (List<CategoriesChooseTenderEntity> n) {
                      //       print(n);
                      //     }
                      //     ,
                      //     listType: MultiSelectListType.LIST,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.all(Radius.circular(25)),
                      //       color: HexColor('#DCDCDC'),
                      //       border: Border.all(
                      //           color: primaryColor, width: 1, style: BorderStyle.solid),
                      //     ),
                      //     backgroundColor: HexColor('#DCDCDC'),
                      //     selectedColor: primaryColor.withOpacity(0.3),
                      //     searchHint: 'searchHint',
                      //     searchHintStyle: TextStyle(fontSize: w * 0.03),
                      //     searchable: true,
                      //     title: Text('searchHint',
                      //         style: TextStyle(color: primaryColor, fontSize: w * 0.03)),
                      //     buttonText: Text(
                      //       'buttonText',
                      //       style: TextStyle(color: primaryColor),
                      //     ),
                      //     buttonIcon: Icon(
                      //       Icons.keyboard_arrow_down_sharp,
                      //       color: primaryColor,
                      //       size: w * 0.07,
                      //     ),
                      //     dialogHeight: h * 0.2,
                      //     dialogWidth: w * 0.4,
                      //   ),
                      // ),

                      // SizedBox(
                      //   height: h * 0.05,
                      // ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
