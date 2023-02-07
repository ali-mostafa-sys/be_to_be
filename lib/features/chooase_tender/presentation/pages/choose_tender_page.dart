import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/chooase_tender/domain/entity/categories_entity/categories_entity.dart';
import 'package:be_to_be/features/chooase_tender/presentation/bloc/choose_tender_bloc.dart';
import 'package:be_to_be/features/chooase_tender/presentation/widget/drop_down_button_choose_tender_widget.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:be_to_be/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../../core/routs/routes.gr.dart';

class ChooseTenderPage extends StatelessWidget {
  const ChooseTenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) =>
          di.sl<ChooseTenderBloc>()..add(GetChooseTenderCategoriesEvent())..add(GetBrandsChooseTenderEvent())..add(GetProductChooseTenderEvent()),
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
              if(state is LoadedPostCareState){
                SnackBarMessage().showSnackBar(
                    message: 'Added Successfully ',
                    backgroundColor: primaryColor,
                    context: context);
                Future.delayed(Duration(seconds: 2)).then((value) => AutoRouter.of(context)
                    .pushAndPopUntil(MainPage(), predicate: (route) => false)
                );


              }
              if(state is ErrorPostCareState){
                SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);

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
              if (state is LoadingGetBrandsState) {
                return const LoadingWidget();
              }
              if (state is LoadingGetProductState) {
                return const LoadingWidget();
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
                        style: TextStyle(color: primaryColor, fontSize: w * 0.06),
                      ),
                      Text(
                        'belong to your aspirations',
                        style: TextStyle(color: primaryColor, fontSize: w * 0.06),
                      ),
                      SizedBox(
                        height: h * 0.1,
                      ),
                      DropDownButtonChooseTenderWidget(
                        buttonText: 'Enter Product Category',
                        searchHint: 'Search for your Category',
                        items: choBloc.categoriesEntity.map((e) => MultiSelectItem(e, e.nameEn)).toList(),
                        onChange: ( category){
                         // print(category.runtimeType);
                         // print("$category  ali");
                          choBloc.add(SelectedChooseTenderCategoriesEvent(categories: category));

                        },
                      ),
                     // choBloc.selectedCategoryId.isEmpty?Container():
                      SizedBox(
                        height: h * 0.05,
                      ),
                      // choBloc.selectedCategoryId.isEmpty?Container():
                      // Container(
                      //   height: h*0.5,
                      //   width: w,
                      //   child: ListView.separated(
                      //       itemBuilder: (context,index){
                      //         return DropDownButtonChooseTenderWidget(
                      //           buttonText: ' Brand for ${choBloc.categoriesSelected[index].nameEn} ',
                      //           searchHint: 'Search for your Brand',
                      //           items: choBloc.brandEntity.map((e) => MultiSelectItem(e, e.nameEn)).toList(),
                      //           onChange: ( brands){
                      //             // print(category.runtimeType);
                      //             print("$brands  ali");
                      //             choBloc.add(SelectedChooseTenderBrandEvent(brand: brands));
                      //             // choBloc.add(SelectedChooseTenderCategoriesEvent(categories: b));
                      //
                      //           },
                      //         );
                      //       },
                      //       separatorBuilder: (context,index)=>SizedBox(
                      //         height: h * 0.05,
                      //       ),
                      //       itemCount: choBloc.selectedCategoryId.length),
                      // ),

                      DropDownButtonChooseTenderWidget(
                        buttonText: 'Enter Product Brand',
                        searchHint: 'Search for your Brand',
                        items: choBloc.brandEntity.map((e) => MultiSelectItem(e, e.nameEn)).toList(),
                        onChange: ( brands){
                          // print(category.runtimeType);
                           print("$brands  ali");
                           choBloc.add(SelectedChooseTenderBrandEvent(brand: brands));
                         // choBloc.add(SelectedChooseTenderCategoriesEvent(categories: b));

                        },
                      ),
                      SizedBox(
                        height: h * 0.05,
                      ),
                      DropDownButtonChooseTenderWidget(
                        buttonText: 'Enter Product Names',
                        searchHint: 'Search for your Product Names',
                        items: choBloc.productEntity.map((e) => MultiSelectItem(e, e.nameEn)).toList(),
                        onChange: ( products){
                          // print(category.runtimeType);
                          print("$products  ali");
                          choBloc.add(SelectedChooseTenderProductEvent(product: products));

                          // choBloc.add(SelectedChooseTenderCategoriesEvent(categories: b));

                        },
                      ),



                      SizedBox(
                        height: h * 0.05,
                      ),
                      BlocConsumer<MainPageBloc,MainPageState>(
                       listener: (context,state){},
                       builder: (context,state){
                         return Padding(
                           padding:  EdgeInsets.symmetric(horizontal: w*0.3),
                           child: ButtonTextWidget(
                               padding: 0,
                               backgroundColor: primaryColor,
                               text: 'Finish',
                               textColor: Colors.white,
                               textSize: w*0.05,
                               onPressed: (){
                                 if(choBloc.selectedProductId.isEmpty&&
                                     choBloc.selectedBrandId.isEmpty&&
                                     choBloc.selectedCategoryId.isEmpty){
                                   SnackBarMessage().showSnackBar(
                                       message: 'You Should select one of this tender at least ',
                                       backgroundColor: Colors.redAccent,
                                       context: context);
                                 }else{
                                   choBloc.add(PostCaresEvent());
                                   Future.delayed(Duration(seconds: 1)).then((value) {
                                     MainPageBloc.get(context).add(IsLoggedEvent());
                                   });
                                 }






                               }),
                         );
                       },
                      ),
                      SizedBox(
                        height: h * 0.05,
                      ),




                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
