import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/offers/domain/entity/offers_entity/get_all_tender_entity.dart';
import 'package:be_to_be/features/offers/presentation/bloc/offer_bloc/offer_bloc.dart';
import 'package:be_to_be/features/offers/presentation/widget/offer_container_widget.dart';
import 'package:be_to_be/features/offers/presentation/widget/offer_row_widget.dart';
import 'package:be_to_be/features/offers/presentation/widget/offer_were_sent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class MainOfferWidget extends StatelessWidget {
  MainOfferWidget(
      {Key? key,
    //  required this.closeExpand,
      required this.indexMainList,
      required this.tenderEntity,
      required this.onAccepted,
        required this.deliveryTimePeriod,
        required this.maxTenderPeriod,
        required this.totalPrice,
        required this.location,

      })
      : super(key: key);

 // void Function()? closeExpand;
  void Function()? onAccepted;
  int indexMainList;
  GetAllTenderEntity tenderEntity;
  String deliveryTimePeriod;
  String maxTenderPeriod;
  List<int>totalPrice;
  List<String?>location;


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocConsumer<OfferBloc, OfferState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var offerBloc = OfferBloc.get(context);
        return Column(
          children: [
            Container(
              height: h * 0.2,
              width: w,
              color: HexColor('#EEEEEE'),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Padding(
                  //   padding: EdgeInsetsDirectional.only(start: w * 0.03),
                  //   child: Image.network('${tenderEntity.productImgUrl.toString()}'),
                  // ),
                  SizedBox(
                    width: w * 0.06,
                  ),

                  /// here data for
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tenderEntity.categoryName.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: w * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        tenderEntity.brandName.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: w * 0.04,
                        ),
                      ),
                      Text(
                        tenderEntity.productName.toString(),
                        style: TextStyle(
                          color: HexColor('#7B7B7B'),
                          fontSize: w * 0.035,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),

                  /// here for expanded the widget just implemented
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: w * 0.02),
                    child: InkWell(
                      onTap: () {
                        offerBloc.add(ExpandedAndGetOffersOnTenderEvent(
                            index: indexMainList,
                            tenderId: tenderEntity.tenderId));
                      },
                      child:
                          offerBloc.loadingWidget[indexMainList]==false ?const LoadingWidget():

                      Image.asset(
                        'assets/images/dotes.png',
                        width: w * 0.1,
                      ),
                    ),
                  )
                ],
              ),
            ),
            offerBloc.isExpandedList[indexMainList] == true
                ?

            Container(
              width: w,
              height: h*0.5,
             // color: Colors.green,
              child: ListView.separated(
                      itemBuilder: (context, index) => OfferWereSentWidget(
                        deliveryTimePeriod: deliveryTimePeriod,
                        totalPrice: totalPrice[index],
                        location: location[index],
                        offerId: offerBloc.offers[index].idOffer,
                        offerOnTenderEntity: offerBloc.offers[index],
                        maxTenderPeriod: maxTenderPeriod,
                      ),
                      separatorBuilder: (context, index) => Container(
                        height: h*0.01,
                      ),
                      itemCount: offerBloc.offers.length),
            )
               : Container(),
          ],
        );
      },
    );
  }
}
