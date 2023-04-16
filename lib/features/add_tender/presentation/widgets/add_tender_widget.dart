
import 'package:auto_size_text/auto_size_text.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/core/widgets/text_form_widget.dart';
import 'package:be_to_be/features/add_tender/domain/entity/add_tender_entity/add_tender_entity.dart';
import 'package:be_to_be/features/add_tender/presentation/bloc/add_tender/add_tender_bloc.dart';
import 'package:be_to_be/features/add_tender/presentation/widgets/radio_button_tender_widger.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';



class AddTenderWidget extends StatelessWidget {
  AddTenderWidget({Key? key,}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var productId = GlobalKey();
  var countryId = GlobalKey();
  var cityId = GlobalKey();


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double containerHeight = w*0.1;
    double sizedBoxHeight = h*0.01;

    return BlocConsumer<AddTenderBloc,AddTenderState>(
      listener: (context,state){
        if(state is LoadedAddTenderState){
          SnackBarMessage().showSnackBar(message: 'Added TENDER Successfully', backgroundColor: primaryColor, context: context);
        }
        if(state is ErrorAddTenderState){
          SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
        }
        // print(state);
      },
      builder: (context,state){
        var addBloc=AddTenderBloc.get(context);
        if(state is LoadingAddTenderState){
          return const LoadingWidget();
        }
        if(state is LoadingGetProductListState){
          return const LoadingWidget();
        }
        if(state is LoadingGetAllCountriesState){
          return const LoadingWidget();
        }
        if(state is LoadingGetAllCitiesAddTenderState){
          return const LoadingWidget();
        }
        return BlocConsumer<MainPageBloc,MainPageState>(
            listener: (context,state){},
            builder: (context,state){
              var mainBloc=MainPageBloc.get(context);
              return Container(
                width: w,

                decoration: BoxDecoration(

                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))

                ),
                child: SingleChildScrollView(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Text('Create Tender',style: TextStyle(
                          color: primaryColor,
                          fontSize: w*0.07
                      ),),
                      SizedBox(
                        height: h*0.05,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            /// item name
                            Container(
                              width:w*0.8,
                              height: containerHeight,
                              child: TextFormFieldWidget(
                                  controller:addBloc. itemName,
                                  textInputType: TextInputType.text,
                                  obscureText: false,
                                  suffixPath: 'assets/images/delivery_tender.png',
                                  labelText: 'Tender name',

                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Field Shoudn\'t be Empty';
                                    }else{
                                      return null;
                                    }
                                  }),
                            ),
                            SizedBox(
                              height: sizedBoxHeight,
                            ),
                            /// here for quantity
                            Container(
                              width:w*0.8,
                              height: containerHeight,
                              child: TextFormFieldWidget(
                                  controller:addBloc. quantity,
                                  textInputType: TextInputType.number,
                                  obscureText: false,
                                  suffixPath: 'assets/images/building_row_order.png',
                                  labelText: 'Quantity',

                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Field Shoudn\'t be Empty';
                                    }else{
                                      addBloc.quantityInt=int.parse(value);
                                      return null;

                                    }
                                  }),
                            ),
                            SizedBox(
                              height: sizedBoxHeight,
                            ),

                            /// here for choose product
                            Container(
                              width:w*0.8,
                              height: containerHeight,
                              padding: EdgeInsetsDirectional.only(
                                  start: w * 0.02),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      width: 1, color: primaryColor),
                                  color: HexColor('#DCDCDC')),
                              child: DropdownButton(
                                  borderRadius: BorderRadius.circular(25),
                                  key: productId,
                                  underline: Container(
                                    width: 0,
                                    height: 0,
                                  ),
                                  dropdownColor: HexColor('#DCDCDC'),
                                  menuMaxHeight: h * 0.3,
                                  isExpanded: true,
                                  isDense: false,
                                  value: addBloc.selectedProduct,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: primaryColor,
                                    size: w * 0.1,
                                  ),
                                  elevation: 16,
                                  hint: Text(
                                    'Choose Product',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: primaryColor),
                                  ),
                                  style: TextStyle(color: primaryColor),
                                  onChanged: (String? newValue) {
                                    addBloc.add(SelectedProductEvent(product: newValue!));
                                  },
                                  items: addBloc.allProduct
                                      .map<DropdownMenuItem<String>>((e) {
                                    return DropdownMenuItem<String>(
                                      value: e.nameEn,
                                      child: Text(e.nameEn),
                                    );
                                  }).toList()),
                            ),
                            SizedBox(
                              height: sizedBoxHeight,
                            ),


                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: w*0.02),
                              child: Container(
                                width: w,
                                //height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: primaryColor.withOpacity(0.1)
                                ),
                                child: Column(

                                  children: [
                                  Text('Delivery info',style: TextStyle(color: primaryColor),),
                                    /// here frome
                                    Container(
                                      width:w*0.8,
                                      height: containerHeight,
                                      child: TextFormFieldWidget(
                                          controller:addBloc. maxTenderPeriod,
                                          textInputType: TextInputType.none,
                                          obscureText: false,
                                          onTap: (){
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate:DateTime.now().add(Duration(seconds: mainBloc.tenderDurationInSeconds)),
                                              // DateTime.parse(
                                              //     "2077-08-27T19:00:00Z")
                                            )
                                                .then((value) {
                                              addBloc.from=value.toString();
                                              // addBloc.to=value.toString();
                                              print(addBloc.from);


                                              addBloc.  maxTenderPeriod.text =
                                                  DateFormat.yMd().format(
                                                    value!,
                                                  );
                                            });
                                          },
                                          suffixPath: 'assets/images/calendar.png',
                                          labelText: 'From',

                                          validator: (value){
                                            if(value!.isEmpty){
                                              return 'This field is required';
                                            }else{
                                              return null;
                                            }
                                          }),
                                    ),
                                    SizedBox(
                                      height: sizedBoxHeight,
                                    ),
                                    /// here to
                                   // addBloc.maxTenderPeriod.text.isEmpty?Container():
                                    Container(
                                      width:w*0.8,
                                      height: containerHeight,
                                      child: TextFormFieldWidget(
                                          controller:addBloc. toDateText,
                                          textInputType: TextInputType.none,
                                          obscureText: false,
                                          onTap: (){
                                            showDatePicker(
                                              context: context,
                                              initialDate:DateTime.parse( addBloc.from),
                                              firstDate: DateTime.parse( addBloc.from),
                                              lastDate:DateTime.now().add(Duration(days: 90)),
                                              // DateTime.parse(
                                              //     "2077-08-27T19:00:00Z")
                                            )
                                                .then((value) {
                                              addBloc.to=value.toString();
                                              // addBloc.to=value.toString();
                                              print(addBloc.to);


                                              addBloc.  toDateText.text =
                                                  DateFormat.yMd().format(
                                                    value!,
                                                  );
                                            });
                                          },
                                          suffixPath: 'assets/images/calendar.png',
                                          labelText: 'To',

                                          validator: (value){
                                            if(value!.isEmpty){
                                              return 'This field is required';
                                            }else{
                                              return null;
                                            }
                                          }),
                                    ),
                                   // addBloc.from==''?Container():
                                    SizedBox(
                                      height: sizedBoxHeight,
                                    ),

                                    /// here for de period

                                  // addBloc.to==''?Container():
                                    Container(
                                      width:w*0.8,
                                      height: containerHeight,
                                      child: TextFormFieldWidget(
                                          controller:addBloc. deliveryTimePeriod,
                                          textInputType: TextInputType.none,
                                          obscureText: false,
                                          hintText: 'Delivery info',
                                          suffixPath: 'assets/images/calendar.png',
                                          labelText: 'Delivery Time Period',
                                          onTap: (){
                                            showDatePicker(
                                                context: context,
                                                initialDate: DateTime.parse( addBloc.to),
                                                firstDate: DateTime.parse( addBloc.to),
                                                lastDate: DateTime.now().add(const Duration(days: 90))

                                            )
                                                .then((value) {

                                              addBloc.deliverBefore=value.toString();


                                              addBloc.  deliveryTimePeriod.text =
                                                  DateFormat.yMd().format(
                                                    value!,
                                                  );
                                            });
                                          },

                                          validator: (value){
                                            if(value!.isEmpty){
                                              return 'This field is required';
                                            }else{
                                              return null;
                                            }
                                          }),
                                    ),
                                  //  addBloc.to==''?Container():

                                    SizedBox(
                                      height: sizedBoxHeight,
                                    ),

                                    /// here for area
                                    Container(
                                      width:w*0.8,
                                      height: containerHeight,
                                      child: TextFormFieldWidget(
                                          hintText: 'Delivery info',
                                          controller:addBloc. area,
                                          textInputType: TextInputType.text,
                                          obscureText: false,
                                          suffixPath: 'assets/images/location.png',
                                          labelText: 'Area',

                                          validator: (value){
                                            if(value!.isEmpty){
                                              return 'This field is required';
                                            }else{
                                              return null;
                                            }
                                          }),
                                    ),
                                    SizedBox(
                                      height: sizedBoxHeight,
                                    ),
                                    /// here for street
                                    Container(
                                      width:w*0.8,
                                      height: containerHeight,
                                      child: TextFormFieldWidget(
                                          hintText: 'Delivery info',
                                          controller:addBloc. street,
                                          textInputType: TextInputType.text,
                                          obscureText: false,
                                          suffixPath: 'assets/images/location.png',
                                          labelText: 'Street',

                                          validator: (value){
                                            if(value!.isEmpty){
                                              return 'This field is required';
                                            }else{
                                              return null;
                                            }
                                          }),
                                    ),
                                    SizedBox(
                                      height: sizedBoxHeight,
                                    ),
                                    /// here for building number
                                    Container(
                                      width:w*0.8,
                                      height: containerHeight,
                                      child: TextFormFieldWidget(
                                          hintText: 'Delivery info',
                                          controller:addBloc. buildingNumber,
                                          textInputType: TextInputType.text,
                                          obscureText: false,
                                          suffixPath: 'assets/images/location.png',
                                          labelText: 'Building Number',

                                          validator: (value){
                                            if(value!.isEmpty){
                                              return 'This field is required';
                                            }else{
                                              return null;
                                            }
                                          }),
                                    ),

                                    SizedBox(
                                      height: sizedBoxHeight,
                                    ),
                                    /// here for more Address Info
                                    Container(
                                      width:w*0.8,
                                      height: containerHeight,
                                      child: TextFormFieldWidget(
                                          hintText: 'Delivery info',
                                          controller:addBloc. moreAddressInfo,
                                          textInputType: TextInputType.text,
                                          obscureText: false,
                                          suffixPath: 'assets/images/location.png',
                                          labelText: ' More Address Info',

                                          validator: (value){
                                            if(value!.isEmpty){
                                              return 'This field is required';
                                            }else{
                                              return null;
                                            }
                                          }),
                                    ),
                                    SizedBox(
                                      height: sizedBoxHeight,
                                    ),
                                    /// here for country
                                    SizedBox(
                                      height: containerHeight,
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: w*0.1),
                                        child: DropDownTextField(
                                          dropDownItemCount: 6
                                          // addBloc.allCountry.length
                                          ,

                                          listTextStyle: TextStyle(color: primaryColor,),
                                          textStyle: TextStyle(color: primaryColor),
                                          dropdownRadius: 25,
                                          dropDownIconProperty: IconProperty(
                                            color: primaryColor,
                                            icon: Icons.keyboard_arrow_down_rounded,
                                            size: w * 0.1,
                                          ),
                                          textFieldDecoration: InputDecoration(

                                            hintText: 'Country',
                                            hintStyle: TextStyle(
                                              color: primaryColor,
                                            ),
                                            // contentPadding: EdgeInsets.symmetric(
                                            //     vertical: 0, horizontal: 3),
                                          ),
                                          enableSearch: true,
                                          clearIconProperty: IconProperty(color: Colors.green),
                                          clearOption: false,
                                          initialValue: addBloc.selectedCountry ?? '',


                                          searchDecoration:  InputDecoration(
                                            hintText: "Search .....",






                                          ),
                                          validator: (value) {
                                            print('++++++++++++++++++++++++++++');
                                            print(value);
                                            print("++++++++++++++++++++++++++++");
                                            if (value == null) {
                                              return "Required field";
                                            } else {
                                              return null;
                                            }
                                          },

                                          onChanged: ( newValue) {
                                            DropDownValueModel countryModel=newValue  ;
                                            String? country=countryModel!.name;

                                            addBloc.add(
                                                SelectedCountryAddTenderEvent(
                                                    country: country));


                                            Future.delayed(
                                                const Duration(
                                                  seconds:2 ,
                                                  //  milliseconds: 500
                                                ), () {
                                              print(addBloc.selectedCountryId);
                                              addBloc.add(GetAllCitiesAddTenderEvent());
                                              // bloc.add(GetAllCitiesEvent(
                                              //     countryId:
                                              //     bloc.selectedCountryId!));
                                            });


                                          },




                                          dropDownList: addBloc.allCountry.map((e) {
                                            return DropDownValueModel(
                                              value: e.nameEn, name: e.nameEn,);
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    // Container(
                                    //   width:w*0.8,
                                    //   height: containerHeight,
                                    //   padding: EdgeInsetsDirectional.only(
                                    //       start: w * 0.02),
                                    //   decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.circular(25),
                                    //       border: Border.all(
                                    //           width: 1, color: primaryColor),
                                    //       color: HexColor('#DCDCDC')),
                                    //   child: DropdownButton(
                                    //       borderRadius: BorderRadius.circular(25),
                                    //       key: countryId,
                                    //       underline: Container(
                                    //         width: 0,
                                    //         height: 0,
                                    //       ),
                                    //       dropdownColor: HexColor('#DCDCDC'),
                                    //       menuMaxHeight: h * 0.3,
                                    //       isExpanded: true,
                                    //       isDense: false,
                                    //       value: addBloc.selectedCountry,
                                    //       icon: Icon(
                                    //         Icons.keyboard_arrow_down_rounded,
                                    //         color: primaryColor,
                                    //         size: w * 0.1,
                                    //       ),
                                    //       elevation: 16,
                                    //       hint: Text(
                                    //         'Choose Country',
                                    //         textAlign: TextAlign.start,
                                    //         style: TextStyle(color: primaryColor),
                                    //       ),
                                    //       style: TextStyle(color: primaryColor),
                                    //       onChanged: (String? newValue) {
                                    //         addBloc.add(SelectedCountryAddTenderEvent(country: newValue!));
                                    //         Future.delayed(Duration(microseconds: 900)).then((value) {
                                    //           addBloc.add(GetAllCitiesAddTenderEvent());
                                    //         });
                                    //       },
                                    //       items: addBloc.allCountry
                                    //           .map<DropdownMenuItem<String>>((e) {
                                    //         return DropdownMenuItem<String>(
                                    //           value: e.nameEn,
                                    //           child: Text(e.nameEn),
                                    //         );
                                    //       }).toList()),
                                    // ),
                                    SizedBox(
                                      height: sizedBoxHeight,
                                    ),
                                    /// here for city
                                    addBloc.selectedCountry!=null?
                                    Container(
                                      width:w*0.8,
                                      height: containerHeight,
                                      padding: EdgeInsetsDirectional.only(
                                          start: w * 0.02),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(
                                              width: 1, color: primaryColor),
                                          color: HexColor('#DCDCDC')),
                                      child: DropdownButton(
                                          borderRadius: BorderRadius.circular(25),
                                          key: cityId,
                                          underline: Container(
                                            width: 0,
                                            height: 0,
                                          ),
                                          dropdownColor: HexColor('#DCDCDC'),
                                          menuMaxHeight: h * 0.3,
                                          isExpanded: true,
                                          isDense: false,
                                          value: addBloc.selectedCity,
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: primaryColor,
                                            size: w * 0.1,
                                          ),
                                          elevation: 16,
                                          hint: Text(
                                            'Choose City',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(color: primaryColor),
                                          ),
                                          style: TextStyle(color: primaryColor),
                                          onChanged: (String? newValue) {
                                            addBloc.add(SelectedCityAddTenderEvent(city: newValue!));
                                          },
                                          items: addBloc.allCities
                                              .map<DropdownMenuItem<String>>((e) {
                                            return DropdownMenuItem<String>(
                                              value: e.nameEn,
                                              child: Text(e.nameEn),
                                            );
                                          }).toList()),
                                    ):Container(),
                                    addBloc.selectedCountry!=null?
                                    SizedBox(
                                      height: sizedBoxHeight,
                                    ):Container(),
                                ],),
                              ),
                            ),

                            /// here for marker address
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AutoSizeText(
                                  'Market Address :',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: w*0.01,
                                      fontWeight: FontWeight.w500),
                                ),
                                RadioButtonTenderWidget(
                                    groupValue:addBloc.marketAddress ,
                                    textValue: "UAE",
                                    value: "UAE",
                                    onChanged: (value) {
                                      // bloc.add(ChooseGenderEvent(gender: value));
                                      addBloc.add(ChooseMarkerAddressEvent(markerAddress: value));
                                    }),
                                RadioButtonTenderWidget(
                                    groupValue:addBloc.marketAddress,
                                    textValue: "Local",
                                    value: "LOCAL",
                                    onChanged: (value) {
                                      // bloc.add(ChooseGenderEvent(gender: value));
                                      addBloc.add(ChooseMarkerAddressEvent(markerAddress: value));
                                    }),
                                RadioButtonTenderWidget(
                                    groupValue:addBloc.marketAddress,
                                    textValue: "Global",
                                    value: "GLOBAL",
                                    onChanged: (value) {
                                      // bloc.add(ChooseGenderEvent(gender: value));
                                      addBloc.add(ChooseMarkerAddressEvent(markerAddress: value));
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: sizedBoxHeight,
                            ),
                            /// here for payment type
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AutoSizeText(
                                  'Payment Type :',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: w*0.01,
                                      fontWeight: FontWeight.w500),
                                ),
                                RadioButtonTenderWidget(
                                    groupValue:addBloc.paymentType ,
                                    textValue: "COD",
                                    value: "CASH",
                                    onChanged: (value) {
                                      // bloc.add(ChooseGenderEvent(gender: value));
                                      addBloc.add(ChoosePaymentTypeEvent(paymentType: value));
                                    }),
                                RadioButtonTenderWidget(
                                    groupValue:addBloc.paymentType,
                                    textValue: "Credit Card",
                                    value: "E_PAY",
                                    onChanged: (value) {
                                      // bloc.add(ChooseGenderEvent(gender: value));
                                      addBloc.add(ChoosePaymentTypeEvent(paymentType: value));
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: sizedBoxHeight,
                            ),
                            Container(
                              width:w*0.8,
                              height: containerHeight,
                              child: ButtonTextWidget(
                                padding: 0,
                                backgroundColor: primaryColor,
                                text: 'Create',
                                textColor: Colors.white,
                                textSize: w*0.1,
                                onPressed: (){
                                  if(formKey.currentState!.validate()){
                                    if(addBloc.selectedProduct!=null){
                                      if(addBloc.selectedCountry!=null){
                                        if(addBloc.selectedCity!=null){

                                          final addTenderEntity=AddTenderEntity(
                                              name:addBloc. itemName.text,
                                              from: addBloc.from,
                                              to:  addBloc.to,
                                              deliverBefore: addBloc. deliverBefore,
                                              area:addBloc. area.text,
                                              street:addBloc. street.text,
                                              buildingNumber:addBloc. buildingNumber.text,
                                              moreAddressInfo:addBloc. moreAddressInfo.text,
                                              supplierLocation:addBloc.marketAddress,
                                              payMethod:addBloc. paymentType,
                                              productId: addBloc.selectedProductId!,
                                              quantity:int.parse(addBloc. quantity.text) ,
                                              cityId: addBloc.selectedCityId!);
                                          addBloc.add(PostAddTenderEvent(addTenderEntity: addTenderEntity));






                                        }else{
                                          SnackBarMessage().showSnackBar(
                                              message: 'Please select city',
                                              backgroundColor: Colors.redAccent
                                              , context: context);
                                        }

                                      }else{
                                        SnackBarMessage().showSnackBar(
                                            message: 'Please select country',
                                            backgroundColor: Colors.redAccent
                                            , context: context);
                                      }

                                    }else{
                                      SnackBarMessage().showSnackBar(
                                          message: 'Please select product',
                                          backgroundColor: Colors.redAccent
                                          , context: context);
                                    }
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: sizedBoxHeight,
                            ),


                          ],
                        ),
                      ),





                    ],
                  ),
                ),
              );
            },
        );
      },

    );
  }
}