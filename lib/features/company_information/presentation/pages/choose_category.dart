import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/company_information/presentation/bloc/choose_category/choose_category_bloc.dart';
import 'package:be_to_be/features/company_information/presentation/bloc/company_information/company_information_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ChooseCategoryPage extends StatelessWidget {
  ChooseCategoryPage({Key? key}) : super(key: key);
  var ali = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery
        .of(context)
        .size
        .width;
    final h = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: _buildBody(h: h, w: w),

    );
  }

  Widget _buildBody({required double h, required double w}) {
    return BlocProvider(
      create: (context) => ChooseCategoryBloc(),
      child: BlocConsumer<ChooseCategoryBloc, ChooseCategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          var blocCat = ChooseCategoryBloc.get(context);
          return BlocConsumer<CompanyInformationBloc, CompanyInformationState>(
            listener: (context, state) {},
            builder: (context, state) {
              var blocCompany = CompanyInformationBloc.get(context);
              return BackgroundWidget(
                  widgets: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    SizedBox(
                    height: h*0.05,
                  ),
                  Text('Receive tenders which', style: TextStyle(
                      color: primaryColor,
                      fontSize: w * 0.07,
                      fontWeight: FontWeight.bold),),
                  Text('belong to your aspirations', style: TextStyle(
                      color: primaryColor,
                      fontSize: w * 0.07,
                      fontWeight: FontWeight.bold),),


                  Container(
                      padding: EdgeInsetsDirectional.only(
                          start: w * 0.01),
                      decoration: BoxDecoration(
                          color: HexColor("#DCDCDC"),
                          border: Border.all(
                              width: 1, color: primaryColor),
                          borderRadius: BorderRadius.circular(25)),
                      child: DropdownButton(
                          key: ali,
                          isExpanded: true,
                          isDense: false,
                          value: blocCat.selectedProductCategory,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: primaryColor,
                            size: w * 0.1,
                          ),

                          elevation: 16,
                          hint: Text(
                            'Enter Product Category',
                            style: TextStyle(color: primaryColor),
                          ),
                          style: TextStyle(color: primaryColor),
                          underline: Container(
                            height: 0,
                          ),
                          onChanged: (String? newValue) {
                            blocCat.add(SelectedValueForProductCategoryEvent(
                                selectedProductCategory: newValue!));
                          },
                          items:blocCat.productCategory
                              .map((e) {
                                if(blocCat.productCategory.last==e){
                                  return DropdownMenuItem<String>(
                                    onTap: (){
                                      print('ok');
                                    },


                                      value: 'add new cat',
                                      child: Text('add new cat',textAlign: TextAlign.center,),
                                  );
                                }
                            return DropdownMenuItem<String>(


                              value: e,
                              child: Text(e),
                            );
                          }).toList()),
              )

              ],
              )
              ,
              );
            },
          );
        },
      ),

    );
  }
}
