
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/offers/domain/entity/offers_entity/get_all_offer_on_tender_entity.dart';
import 'package:be_to_be/features/offers/presentation/bloc/offer_bloc/offer_bloc.dart';
import 'package:be_to_be/features/offers/presentation/widget/offer_container_widget.dart';
import 'package:be_to_be/features/offers/presentation/widget/offer_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


class OfferWereSentWidget extends StatelessWidget {
   OfferWereSentWidget({Key? key,
  required this.deliveryTimePeriod,
  required this.maxTenderPeriod,
  required this.offerOnTenderEntity,
  required this.totalPrice,
  required this.offerId,
  required this.location,

  }) : super(key: key);
int offerId;
  String deliveryTimePeriod;
  String maxTenderPeriod;
   GetAllOfferOnTenderEntity offerOnTenderEntity;
   int totalPrice;
   String?location;


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocConsumer<OfferBloc,OfferState>(
        listener: (context,state){


        },
        builder: (context,state){
          var offerBloc=OfferBloc.get(context);
          return Container(
            width: w,
            // height: h * 0.8,
            color: HexColor('#D1D1D1'),
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h * 0.01,
                  ),

                  /// here for general info
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'General Info',
                          style: TextStyle(
                            fontSize: w * 0.05,
                          ),
                        ),
                        OfferRowWidget(
                          title: 'Include Delivery',
                          //${orderEntity.area}-${orderEntity.street}
                          data: offerOnTenderEntity.bIncludeDelivery==1? ' Yes':'No',
                          hasText: false,
                          hasBuilding: false,
                          hasRate: false,
                        ),
                        /// here for Delivery Address
                      //  offerOnTenderEntity.bIncludeDelivery!=1?Container():
                        SizedBox(
                          height: h * 0.01,
                        ),
                       // offerOnTenderEntity.bIncludeDelivery!=1?Container():
                        OfferRowWidget(
                          title: 'Delivery Address',
                          //${orderEntity.area}-${orderEntity.street}
                          data: offerOnTenderEntity.deliveryAddress.toString(),
                          hasText: false,
                          hasBuilding: false,
                          hasRate: false,
                        ),
                        /// here for Delivery Time Period
                        SizedBox(
                          height: h * 0.01,
                        ),
                        OfferRowWidget(
                            title: 'Delivery Time Period',
                            //${orderEntity.area}-${orderEntity.street}
                            data: '  $deliveryTimePeriod',
                            hasText: true,
                            hasRate: false,
                            hasBuilding: false),
                        /// here for Maximum Tender Period
                        SizedBox(
                          height: h * 0.01,
                        ),
                        OfferRowWidget(
                            title: 'Maximum Tender Period',
                            //${orderEntity.area}-${orderEntity.street}
                            data: '$maxTenderPeriod',
                            hasText: true,
                            hasRate: false,
                            hasBuilding: false),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        OfferRowWidget(
                            title: 'Quantity',
                            //${orderEntity.area}-${orderEntity.street}
                            data: ' ${offerOnTenderEntity.quantity.toString()}',
                            hasText: false,
                            hasRate: false,
                            hasBuilding: true),
                        /// here for location
                        location=='aliMo'?Container():
                        SizedBox(
                          height: h * 0.01,
                        ),
                        location=='aliMo'?Container():
                        OfferRowWidget(
                            title: 'Location',
                            //${orderEntity.area}-${orderEntity.street}
                            data: location!,
                            hasRate: false,
                            hasText: false,
                            hasBuilding: false),
                        /// here for rating
                        SizedBox(
                          height: h * 0.01,
                        ),
                        OfferRowWidget(
                            title: 'Rating',
                            //${orderEntity.area}-${orderEntity.street}
                            data: '   ${offerOnTenderEntity.rate.toString()}',
                            hasText: false,
                            hasRate: true,
                            hasBuilding: false),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),

                  /// here for Payment Info
                  OfferContainerWidget(
                    widget: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: w * 0.05, top: h * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment Info',
                            style: TextStyle(
                                fontSize: w * 0.04,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          OfferRowWidget(
                              title: 'Delivery Cost',
                              //${orderEntity.area}-${orderEntity.street}
                              data: ' \$ ${offerOnTenderEntity.deliveryCost.toString()}',
                              hasText: false,
                              hasRate: false,
                              hasBuilding: false),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          OfferRowWidget(
                              title: 'Include VAT/TAX',
                              //${orderEntity.area}-${orderEntity.street}
                              data:offerOnTenderEntity.tax!= null? '  Yes':'No',
                              hasText: false,
                              hasRate: false,
                              hasBuilding: false),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          OfferRowWidget(
                              title: 'VAT In Percent ',
                              //${orderEntity.area}-${orderEntity.street}
                              data:offerOnTenderEntity.tax!= null? '${offerOnTenderEntity.tax.toString()} %':'0 %',
                              hasText: false,
                              hasRate: false,
                              hasBuilding: false),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          OfferRowWidget(
                              title: 'Item Price',
                              //${orderEntity.area}-${orderEntity.street}
                              data: '  \$ ${offerOnTenderEntity.priceUSD.toString()}',
                              hasText: false,
                              hasRate: false,
                              hasBuilding: false),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          OfferRowWidget(
                              title: 'Total Price ',
                              //${orderEntity.area}-${orderEntity.street}
                              data: '  \$ ${totalPrice.toString()}',
                              hasText: false,
                              hasRate: false,
                              hasBuilding: false),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),

                  /// here for accepted and cancel the oofer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      state is LoadingAcceptedOfferState? const LoadingWidget():
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: HexColor('#0BC524'),
                        ),

                        /// here for accept button
                        child:


                        IconButton(
                          onPressed: (){
                            offerBloc.add(AcceptedOfferEvent(offerId: offerId));
                          },
                          icon: Icon(Icons.check),
                          iconSize: w * 0.08,
                          color: Colors.white,
                        ),
                      ),

                      /// here for cancel button
                      state is LoadingDeleteOfferState? const LoadingWidget():
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: HexColor('##D50000'),
                        ),
                        child:
                        state is LoadingDeleteOfferState?const LoadingWidget():
                        IconButton(
                          onPressed: (){
                            offerBloc.add(DeleteOfferEvent(offerId: offerId));
                          },
                          icon:state is LoadingDeleteOfferState? const LoadingWidget():
                         const Icon(Icons.clear),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.15,
                  ),
                ],
              ),
            ),
          );
        },

    );
  }
}
