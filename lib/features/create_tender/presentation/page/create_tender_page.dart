import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/core/widgets/text_form_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/create_tender/domain/entity/add_brand_entity/add_brand_entity.dart';
import 'package:be_to_be/features/create_tender/domain/entity/add_product_entity/add_product_entity.dart';
import 'package:be_to_be/features/create_tender/domain/entity/upload_ct_image_entity/upload_ct_image_entity.dart';
import 'package:be_to_be/features/create_tender/presentation/bloc/create_tender_bloc.dart';
import 'package:be_to_be/features/create_tender/presentation/widget/drop_down_button_create_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:be_to_be/injection_container.dart' as di;
import 'package:hexcolor/hexcolor.dart';

class CreateTenderPage extends StatelessWidget {
  CreateTenderPage({Key? key}) : super(key: key);
  var brandKey = GlobalKey<FormState>();
  var productKey = GlobalKey<FormState>();
  TextEditingController brand = TextEditingController();
  TextEditingController brandDes = TextEditingController();
  TextEditingController product = TextEditingController();
  TextEditingController productDes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<CreateTenderBloc>()
        ..add(GetCategoriesCreateTenderEvent())
        ..add(GetBrandCreateTenderEvent()),
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text(
            'Create tender',
          ),
          backgroundColor: primaryColor,
        ),
        body: BlocConsumer<CreateTenderBloc, CreateTenderState>(
          listener: (context, state) {
            print(state);

            ///here for add brand
            if (state is LoadedAddBrandState) {
              brand.text = '';
              brandDes.text = '';
              CreateTenderBloc.get(context).selectedCategoryId = null;
              CreateTenderBloc.get(context).add(GetBrandCreateTenderEvent());
              SnackBarMessage().showSnackBar(
                  message: "Added new brand successfully",
                  backgroundColor: primaryColor,
                  context: context);
            }
            if (state is ErrorAddBrandState) {
              SnackBarMessage().showSnackBar(
                  message: state.error,
                  backgroundColor: Colors.redAccent,
                  context: context);
            }

            /// HERE FOR UPLOAD IMAGE
            if (state is LoadedUploadCTImageState) {
              SnackBarMessage().showSnackBar(
                  message: "Uploaded image successfully",
                  backgroundColor: primaryColor,
                  context: context);
            }
            if (state is ErrorUploadCTImageState) {
              SnackBarMessage().showSnackBar(
                  message: state.error,
                  backgroundColor: Colors.redAccent,
                  context: context);
            }

            /// here for add product
            if (state is LoadedAddProductState) {
              product.text = '';
              productDes.text = '';
              CreateTenderBloc.get(context).selectedBrandId = null;
              CreateTenderBloc.get(context).productImage = null;
              CreateTenderBloc.get(context).imageUrl = null;


              SnackBarMessage().showSnackBar(
                  message: "Added new product successfully",
                  backgroundColor: primaryColor,
                  context: context);
            }
            if (state is ErrorAddProductState) {
              SnackBarMessage().showSnackBar(
                  message: state.error,
                  backgroundColor: Colors.redAccent,
                  context: context);
            }
          },
          builder: (context, state) {
            var ctBloc = CreateTenderBloc.get(context);
            final w = MediaQuery.of(context).size.width;
            final h = MediaQuery.of(context).size.height;

            // if (state is LoadingGetCategoriesCreateTenderState) {
            //   return const LoadingWidget();
            // }
            if (state is LoadingGetBrandsCreateTenderState) {
              return const LoadingWidget();
            }

            return BackgroundWidget(
                widgets: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.05,
                  ),

                  /// here for brand
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Form(
                        key: brandKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: h * 0.02,
                            ),
                            Text(
                              'Create Brand ',
                              style: TextStyle(
                                  color: primaryColor, fontSize: w * 0.07),
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            DropDownButtonCreateWidget(
                              selected: ctBloc.selectedCategory,
                              hintText: "Choose Category",
                              items: ctBloc.categoriesList
                                  .map<DropdownMenuItem<String>>((e) {
                                return DropdownMenuItem<String>(
                                  value: e.nameEn,
                                  child: Text('${e.nameEn}'),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                ctBloc.add(SelectedCategoryCreateTenderEvent(
                                    selectedCat: newValue!));
                              },
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            TextFormFieldWidget(
                                controller: brand,
                                textInputType: TextInputType.text,
                                obscureText: false,
                                labelText: 'Brand Name',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Brand name should not be empty  ';
                                  } else {
                                    return null;
                                  }
                                }),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            TextFormFieldWidget(
                                controller: brandDes,
                                textInputType: TextInputType.text,
                                obscureText: false,
                                labelText: 'Brand Description',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Brand Description should not be empty  ';
                                  } else {
                                    return null;
                                  }
                                }),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            state is LoadingAddBrandState
                                ? const LoadingWidget()
                                : Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.1),
                                    child: ButtonTextWidget(
                                        padding: 0,
                                        backgroundColor: primaryColor,
                                        text: "Add",
                                        textColor: Colors.white,
                                        textSize: w * 0.05,
                                        onPressed: () {
                                          if (brandKey.currentState!
                                              .validate()) {
                                            if (ctBloc.selectedCategory ==
                                                null) {
                                              SnackBarMessage().showSnackBar(
                                                  message:
                                                      'Please select category',
                                                  backgroundColor:
                                                      Colors.redAccent,
                                                  context: context);
                                            } else {
                                              final addBrandEntity =
                                                  AddBrandEntity(
                                                      nameEn:
                                                          brand.text.toString(),
                                                      descriptionEn: brandDes
                                                          .text
                                                          .toString(),
                                                      categoryId: ctBloc
                                                          .selectedCategoryId!);
                                              ctBloc.add(AddBrandEvent(
                                                  addBrandEntity:
                                                      addBrandEntity));
                                            }
                                          }
                                        }),
                                  ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),

                  /// here for Divider
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                    child: const Divider(
                      height: 1,
                      color: Colors.green,
                      thickness: 1,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),

                  /// here for product
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Form(
                        key: productKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: h * 0.02,
                            ),
                            Text(
                              'Create Product ',
                              style: TextStyle(
                                  color: primaryColor, fontSize: w * 0.07),
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            SizedBox(
                              height: h*0.08,
                              child: TextFormField(
                                controller: ctBloc.brandCat,
                                keyboardType: TextInputType.none,
                                decoration: InputDecoration(
                                    hintText: 'Select Brand',

                                    hintStyle: TextStyle(color: primaryColor),
                                    suffixIcon: Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: primaryColor,
                                      size: 30,
                                    ),

                                ),
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Brand should not be empty  ';
                                  }else{
                                    return null;
                                  }
                                },
                                onTap: () {
                                  ctBloc.add(ShowDropdownButtonCreateTenderEvent());

                                 // choBloc.add(TextBrandTap());
                                },
                              ),
                            ),
                            ctBloc.choBrand==true?
                            Container(
                              width: w * 0.8,
                              height: h * 0.3,
                              padding: EdgeInsets.symmetric(
                                  horizontal: w * 0.01, vertical: w * 0.01),
                              decoration: BoxDecoration(
                                  color: HexColor("#DCDCDC"),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                              child: SingleChildScrollView(
                                child: Column(

                                  children: ctBloc.categoriesList.map((cat) {

                                    int index = ctBloc.categoriesList.indexOf(cat);

                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                '${ctBloc.categoriesList[index].nameEn}'),
                                            Spacer(),
                                            InkWell(
                                              onTap: () {
                                                ctBloc.add(ExpandedCatCTEvent(index:index ));

                                               // choBloc.add(CheckBoxBrandSelected(index: index));
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
                                        /// here init list
                                        ctBloc.expandedCatList[index] == false
                                            ? Container()
                                            : Column(
                                            children: [
                                              Column(
                                                children: ctBloc.brandsList.map((brand) {
                                                  int indexs = ctBloc.brandsList.indexOf(brand);
                                                  return ctBloc.categoriesList[index].idCategory == ctBloc.brandsList[indexs].categoryId
                                                      ? Container(
                                                    width: w * 0.5,
                                                    child: Row(
                                                      children: [
                                                        InkWell(
                                                          onTap:(){
                                                            ctBloc.add(ChooseBrandCTEvent(brand:ctBloc.brandsList[indexs] ));

                                                          },
                                                            child: Text('${ctBloc.brandsList[indexs].nameEn}')),
                                                       // Spacer(),
                                                        // Checkbox(
                                                        //   /// here init list
                                                        //     value: ctBloc.checkBoxProductOfBrandtList[indexs],
                                                        //     onChanged: (onChanged) {
                                                        //       print(indexs);
                                                        //      // choBloc.add(CheckBoxProductOfBrandSelectedEvent(index: indexs, productChooseTenderEntity: choBloc.productEntity[indexs]));
                                                        //     })
                                                      ],
                                                    ),
                                                  )
                                                      : Container();
                                                }).toList(),
                                              ),
                                            ])
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ):Container(),

                            // DropDownButtonCreateWidget(
                            //   selected: ctBloc.selectedBrand,
                            //   hintText: "Choose Brand",
                            //   items: ctBloc.brandsList
                            //       .map<DropdownMenuItem<String>>((e) {
                            //     return DropdownMenuItem<String>(
                            //       value: e.nameEn,
                            //       child: Text('${e.nameEn}'),
                            //     );
                            //   }).toList(),
                            //   onChanged: (String? newValue) {
                            //     ctBloc.add(SelectedBrandCreateTenderEvent(
                            //         selectedBrand: newValue!));
                            //   },
                            // ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            TextFormFieldWidget(
                                controller: product,
                                textInputType: TextInputType.text,
                                obscureText: false,
                                labelText: 'Product Name',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Product name should not be empty  ';
                                  } else {
                                    return null;
                                  }
                                }),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            TextFormFieldWidget(
                                controller: productDes,
                                textInputType: TextInputType.text,
                                obscureText: false,
                                labelText: 'Product Description',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Product Description should not be empty  ';
                                  } else {
                                    return null;
                                  }
                                }),
                            SizedBox(
                              height: h * 0.02,
                            ),

                            /// here for image
                            Container(
                              width: double.infinity,
                              height: h * 0.2,
                              decoration: BoxDecoration(
                                  color: HexColor("#DCDCDC"),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: primaryColor, width: 1)),
                              child: Center(
                                child: ctBloc.productImage == null
                                    ? InkWell(
                                        onTap: () {
                                          ctBloc.add(PickProductImageEvent());
                                        },
                                        child: Text(
                                          'Pick Product Image',
                                          style: TextStyle(color: primaryColor),
                                        ),
                                      )
                                    : Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Center(
                                            child: Image.file(
                                              ctBloc.productImage!,
                                              width: w*0.5,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              /// here for delete
                                              ctBloc.add(
                                                  DeleteProductImageEvent());
                                            },
                                            icon: Icon(
                                              Icons.clear,
                                              color: primaryColor,
                                            ),
                                          ),
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child:state is LoadingUploadCTImageState?const LoadingWidget():
                                              IconButton(
                                                  onPressed: () {
                                                    final uploadCTImageEntity =
                                                        UploadCTImageEntity(
                                                            imageFile: ctBloc
                                                                .productImage!);
                                                    //TODO: FOR UPLOAD IMAGE
                                                    ctBloc.add(UploadCTImageEvent(
                                                        uploadCTImageEntity:
                                                            uploadCTImageEntity));
                                                    // bloc.add(UploadImageEvent(imageFile: bloc.licenseImage!));
                                                  },
                                                  icon: Icon(
                                                    Icons.cloud_upload_outlined,
                                                    color: primaryColor,
                                                  )))
                                        ],
                                      ),
                              ),
                            ),

                            SizedBox(
                              height: h * 0.02,
                            ),
                            /// here the button
                            state is LoadingAddProductState?const LoadingWidget():
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 0.1),
                              child: ButtonTextWidget(
                                  padding: 0,
                                  backgroundColor: primaryColor,
                                  text: "Add",
                                  textColor: Colors.white,
                                  textSize: w * 0.05,
                                  onPressed: () {
                                    if (productKey.currentState!.validate()) {
                                      if (ctBloc.selectedBrandId != null) {
                                        if (ctBloc.productImage != null) {
                                          if (ctBloc.imageUrl != null) {
                                            final addProductEntity =
                                                AddProductEntity(
                                                    nameEn:
                                                        product.text.toString(),
                                                    descriptionEn: productDes
                                                        .text
                                                        .toString(),
                                                    imgUrl: ctBloc.imageUrl
                                                        .toString(),
                                                    brandId: ctBloc
                                                        .selectedBrandId!);
                                            ctBloc.add(AddNewProductEvent(
                                                addProductEntity:
                                                    addProductEntity));
                                          } else {
                                            SnackBarMessage().showSnackBar(
                                                message:
                                                    'Please upload product image',
                                                backgroundColor:
                                                    Colors.redAccent,
                                                context: context);
                                          }
                                        } else {
                                          SnackBarMessage().showSnackBar(
                                              message: 'Please select image',
                                              backgroundColor: Colors.redAccent,
                                              context: context);
                                        }
                                      } else {
                                        SnackBarMessage().showSnackBar(
                                            message: 'Please select brand',
                                            backgroundColor: Colors.redAccent,
                                            context: context);
                                      }
                                    }
                                  }),
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.1,
                  ),
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
