import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/core/widgets/text_button_widget.dart';
import 'package:be_to_be/core/widgets/text_form_widget.dart';
import 'package:be_to_be/features/order/domain/entity/order_entity/add_offer_entity.dart';
import 'package:be_to_be/features/order/presentation/widget/row_text_widget.dart';
import 'package:be_to_be/features/order/presentation/widget/switche_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../bloc/order_bloc.dart';

class ShowOfferDialogWidget extends StatelessWidget {
  ShowOfferDialogWidget({Key? key, required this.index,required this.tenderId}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  bool isPop = false;
  final int tenderId;
  int index;
  bool isSwitchedDelivery = true;
  double totalPrice=0;
  bool isSwitchedTax = false;

   final TextEditingController quantity = TextEditingController();
  final TextEditingController deliveryTime = TextEditingController();
  final TextEditingController deliveryCost = TextEditingController();
  final TextEditingController pricePerItem = TextEditingController();
  final TextEditingController vatInPercent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        print(state);
        if (state is IncludeDeliverySwitchButtonState) {
          isSwitchedDelivery = state.isInclude;
        }
        if(state is IncludeTaxSwitchButtonState){
          isSwitchedTax=state.isInclude;
        }
        if(state is TotalPriceState){
          totalPrice=state.totalPrice;
        }
        if(state is LoadedAddOfferState){
          isPop=true;
          AutoRouter.of(context).pop();
          SnackBarMessage().showSnackBar(message: 'Offer Added successfully', backgroundColor: primaryColor, context: context);
        }
        if(state is ErrorAddOfferState){
          isPop=true;
          AutoRouter.of(context).pop();
          SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
        }
      },
      builder: (context, state) {
        var bloc = OrderBloc.get(context);
        if(state is LoadingAddOfferState){
          return const LoadingWidget();
        }

        return WillPopScope(
          onWillPop: () async => isPop,
          child: SimpleDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            // backgroundColor: Colors.red,
            children: [
              SizedBox(
                height: h * 0.01,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RowTextWidget(
                        controller: quantity,
                        textInputType: TextInputType.number,
                        text: 'Quantity',
                        onTap: (){
                          print(quantity.runtimeType);
                        },
                        validate: (value){
                          if(value!.isEmpty){
                            print(value.runtimeType);
                            return 'Quantity required';
                          }else{
                            return null;
                          }
                        }),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    /// here for delivery
                    SwitchButtonWidget(
                        isSwitched: isSwitchedDelivery,
                        text: 'Include Delivery',
                        onChange: (value){
                          bloc.add(IncludeDeliverySwitchButtonEvent(isInclude: value));

                    },
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    RowTextWidget(
                        controller: deliveryTime,
                        textInputType: TextInputType.none,
                        text: 'Delivery Time Period',
                        imagePath: 'assets/images/calendar.png',
                        onTap: (){
                          showDatePicker(
                              context: context,
                              initialDate:DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.parse("2025-08-27T19:00:00Z")
                          ).then((value) {
                            final date=value!.difference(DateTime.now()).inDays;
                            print (date);
                            deliveryTime.text="${date.toString()} ";
                            print(deliveryTime.text);
                          });

                        },
                        validate: (value){
                          if(value!.isEmpty){
                            return 'Date required';
                          }else{
                            return null;
                          }
                        }),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    /// here for delivery cost
                    isSwitchedDelivery!=false? RowTextWidget(
                        controller: deliveryCost,
                        textInputType: TextInputType.number,
                        text: 'Delivery Cost',
                        //imagePath: 'assets/images/calendar.png',
                        onTap: (){
                        },
                        validate: (value){
                          if(isSwitchedDelivery!=false){
                            if(value!.isEmpty){
                              return 'Delivery Cost required';
                            }else{
                              return null;
                            }
                          }else{
                            return null;
                          }

                        }):Container(),
                    isSwitchedDelivery!=false? SizedBox(
                      height: h * 0.01,
                    ):Container(),
                    RowTextWidget(
                        controller: pricePerItem,
                        textInputType: TextInputType.number,
                        text: 'Price Per Item',
                        //imagePath: 'assets/images/calendar.png',
                        onTap: (){
                        },
                        validate: (value){
                          if(value!.isEmpty){
                            return 'Price required';
                          }else{
                            return null;
                          }
                        }),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    /// here for tax
                    SwitchButtonWidget(
                      isSwitched: isSwitchedTax,
                      text: 'Include VAT/ TAX',
                      onChange: (value){
                        bloc.add(IncludeTaxSwitchButtonEvent(isInclude: value));

                      },
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    isSwitchedTax!=false?
                    RowTextWidget(
                        controller: vatInPercent,
                        textInputType: TextInputType.number,
                        text: 'VAT In Percent',
                        validate: (value){
                          if(isSwitchedTax!=false){
                            if(value!.isEmpty){
                              return 'Vat required';
                            }else{
                              return null;
                            }
                          }else{
                            return null;
                          }

                        }):Container(),
                    isSwitchedTax!=false?
                    SizedBox(
                      height: h * 0.01,
                    ):Container(),
                    Text('Total Price \$$totalPrice',style: TextStyle(
                      fontSize: w*0.05,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Container(
                      height: h*0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         Container(
                           width:w*0.2,
                           child: ButtonTextWidget(
                             padding: 0,
                             onPressed: (){
                               isPop=true;
                               AutoRouter.of(context).pop();
                             },
                             backgroundColor: Colors.white,
                             textColor: primaryColor,
                             textSize: w*0.04,
                             text: 'Back',

                           ),
                         ),
                          Container(
                            width:w*0.3,
                            child: ButtonTextWidget(
                              padding: 0,
                              onPressed: (){
                                if(formKey.currentState!.validate()){
                                  print(quantity.text);
                                  final quantities=int.parse(quantity.text);
                                  final pricePerItems=double.parse(pricePerItem.text);


                                  if(isSwitchedTax==false){
                                    bloc.add(TotalPriceEvent(quantity: quantities ,
                                        pricePerItem: pricePerItems,
                                        ));
                                    Future.delayed(Duration(seconds: 4)).then((value) {
                                      if(isSwitchedDelivery==false){
                                        final addOfferEntity=AddOfferEntity(tenderId: tenderId,
                                            quantity: quantities,
                                            includeDelivery:isSwitchedDelivery,
                                            priceUSD: pricePerItems);
                                        bloc.add(AddOfferEvent(addOfferEntity: addOfferEntity));
                                      }else{
                                        final delivery=double.parse(deliveryCost.text);
                                        final addOfferEntity=AddOfferEntity(tenderId: tenderId,
                                          quantity: quantities,
                                          includeDelivery:isSwitchedDelivery,
                                          priceUSD: pricePerItems,
                                          deliveryCost: delivery,

                                        );
                                        bloc.add(AddOfferEvent(addOfferEntity: addOfferEntity));

                                      }


                                    });
                                  }else{
                                    final vats=double.parse(vatInPercent.text);

                                    bloc.add(TotalPriceEvent(quantity: quantities ,
                                        pricePerItem: pricePerItems ,
                                        vat: vats ));
                                    Future.delayed(Duration(seconds: 4)).then((value) {
                                      if(isSwitchedDelivery==false){
                                        final addOfferEntity=AddOfferEntity(tenderId: tenderId,
                                            quantity: quantities,
                                            includeDelivery:isSwitchedDelivery,
                                            priceUSD: pricePerItems);
                                        bloc.add(AddOfferEvent(addOfferEntity: addOfferEntity));
                                      }else{
                                        final delivery=double.parse(deliveryCost.text);
                                        final addOfferEntity=AddOfferEntity(tenderId: tenderId,
                                          quantity: quantities,
                                          includeDelivery:isSwitchedDelivery,
                                          priceUSD: pricePerItems,
                                          deliveryCost: delivery,

                                        );
                                        bloc.add(AddOfferEvent(addOfferEntity: addOfferEntity));

                                      }

                                    });
                                  }

                                }

                                final  x=quantity.text ;
                                print(quantity.text);





                              },
                              backgroundColor: primaryColor,
                              textColor: Colors.white,
                              textSize: w*0.04,
                              text: 'Create Offer',


                            ),
                          )
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
