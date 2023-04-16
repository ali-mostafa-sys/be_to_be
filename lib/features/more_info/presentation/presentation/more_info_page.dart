

import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/error_page_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/be_to_be/domain/entity/offers_on_tender_b2b_entity/offer_on_tender_b2b_entity.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:be_to_be/features/more_info/presentation/bloc/more_info_b2b_bloc.dart';
import 'package:be_to_be/features/more_info/presentation/widgets/more_info_container_widget.dart';
import 'package:be_to_be/features/more_info/presentation/widgets/offer_information_widget.dart';
import 'package:be_to_be/features/more_info/presentation/widgets/row_more_info_widget.dart';
import 'package:be_to_be/features/profile/presentation/widget/button_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:be_to_be/injection_container.dart'as di;
import 'package:hexcolor/hexcolor.dart';



class MoreInfoB2BPage extends StatelessWidget {
   MoreInfoB2BPage({Key? key,required this.offersOnTendersB2BEntity,required this.isPending,required this.userTenderId}) : super(key: key);


   OffersOnTendersB2BEntity offersOnTendersB2BEntity;
   bool isPending;
   int userTenderId;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return  Scaffold(
      body: BlocConsumer<MainPageBloc,MainPageState>(
        listener: (context,state){},
        builder: (context,state){
          var mainBloc=MainPageBloc.get(context);

          return BlocProvider(
            create: (context)=>di.sl<MoreInfoB2bBloc>()..add(GetTenderOwnerInfoEvent(tenderId: offersOnTendersB2BEntity.tenderId))
              ..add(GetOfferOwnerInfoEvent(offerId: offersOnTendersB2BEntity.idOffer)),
            child: BlocConsumer<MoreInfoB2bBloc,MoreInfoB2bState>(
              listener: (context,state){
                print(state);

              },
              builder: (context,state){
                var mBloc=MoreInfoB2bBloc.get(context);

                return  BackgroundWidget(
                  widgets: SingleChildScrollView(
                    child: Column(

                      children: [
                        SizedBox(
                          height: h*0.05,
                        ),
                        Text('Offer Info',style: TextStyle(
                            color: primaryColor,
                            fontSize: w*0.1
                        ),),
                        SizedBox(
                          height: h*0.05,
                        ),
                        /// here for offer
                        OfferInformationWidget(
                          deliveryCost:offersOnTendersB2BEntity.deliveryCost ,
                          includeDelivery:offersOnTendersB2BEntity.bIncludeDelivery ,
                          itemPrice:offersOnTendersB2BEntity.priceUSD ,
                          quantity:offersOnTendersB2BEntity.quantity ,
                          tax: offersOnTendersB2BEntity.tax,
                        ),
                        SizedBox(
                          height: h*0.05,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1,vertical: 0),
                          child: Container(
                            height: h*0.1,
                            child: Row(
                              children: [
                                Expanded(

                                  child: ButtonProfiletWidget(
                                      padding: h*0.02,
                                      backgroundColor: mBloc.offerOwner==true?
                                      HexColor("#489F85"):HexColor('#9F9F9F'),
                                      text: "Offer owner Info",
                                      textSize: w*0.05,
                                      onPressed: (){
                                        mBloc.add(ShowInfoEvent(offerOwner: true, tenderOwner: false));
                                       // proBloc.add(SelectedButtonEvent(isProfile:true ,isCompany:false ));
                                      }),
                                ),
                                SizedBox(
                                  width: w*0.01,
                                ),
                                Expanded(

                                  child: ButtonProfiletWidget(
                                      padding: h*0.02,
                                      backgroundColor:mBloc.tenderOwner==true?
                                      HexColor("#489F85"):HexColor('#9F9F9F'),
                                      text: "Tender Owner Info",
                                      textSize: w*0.05,
                                      onPressed: (){
                                        mBloc.add(ShowInfoEvent(offerOwner: false, tenderOwner: true));
                                      //  proBloc.add(SelectedButtonEvent(isProfile:false ,isCompany:true ));
                                      }),
                                ),

                              ],
                            ),
                          ),


                        ),



                        ///here Tender owner info
                      mBloc.tenderOwner==true?
                        state is LoadingGetTenderOwnerInfoState?const LoadingWidget():
                        MoreInfoContainerWidget(
                          widget: Column(
                              children: [
                                SizedBox(
                                  height: h*0.05,
                                ),
                                Text('Tender owner info',style: TextStyle(
                                    color: primaryColor
                                ),),
                                SizedBox(
                                  height: h*0.01,
                                ),
                                /// companyName
                                MoreInfoRowWidget(
                                  title: 'Company name ',
                                  data:mBloc.tenderOwnerInfoEntity?.companyName==null?"": '${mBloc.tenderOwnerInfoEntity?.companyName}',
                                  hasBuilding: false,
                                  hasText: false,
                                  address: false,
                                ),
                                SizedBox(
                                  height: h*0.01,
                                ),
                                MoreInfoRowWidget(
                                  title: 'Tender Country ',
                                  data:mBloc.tenderOwnerInfoEntity?.tenderCountryName==null?"": '${mBloc.tenderOwnerInfoEntity?.tenderCountryName}',
                                  hasBuilding: false,
                                  hasText: false,
                                  address: false,
                                ),
                                SizedBox(
                                  height: h*0.01,
                                ),
                                MoreInfoRowWidget(
                                  title: 'Tender City ',
                                  data:mBloc.tenderOwnerInfoEntity?.tenderCityName==null?"":'${mBloc.tenderOwnerInfoEntity?.tenderCityName}',
                                  hasBuilding: false,
                                  hasText: false,
                                  address: false,
                                ),
                                SizedBox(
                                  height: h*0.01,
                                ),
                                MoreInfoRowWidget(
                                  title: 'Company Country ',
                                  data:mBloc.tenderOwnerInfoEntity?.companyCountryName==null?"":'${mBloc.tenderOwnerInfoEntity?.companyCountryName}',
                                  hasBuilding: false,
                                  hasText: false,
                                  address: false,
                                ),
                                SizedBox(
                                  height: h*0.01,
                                ),
                                MoreInfoRowWidget(
                                  title: 'Company City ',
                                  data:mBloc.tenderOwnerInfoEntity?.companyCityName==null?"":'${mBloc.tenderOwnerInfoEntity?.companyCityName}',
                                  hasBuilding: false,
                                  hasText: false,
                                  address: false,
                                ),
                                SizedBox(
                                  height: h*0.01,
                                ),
                                MoreInfoRowWidget(
                                  title: ' Phone ',
                                  data:mBloc.tenderOwnerInfoEntity?.mobile==null?"":'${mBloc.tenderOwnerInfoEntity?.mobile}',
                                  hasBuilding: false,
                                  hasText: false,
                                  address: false,
                                ),
                                SizedBox(
                                  height: h*0.01,
                                ),
                                MoreInfoRowWidget(
                                  title: ' Has Whatsapp ',
                                  data:mBloc.tenderOwnerInfoEntity?.hasMobileWhatsapp==1?'Yes':'No',

                                  hasBuilding: false,
                                  hasText: false,
                                  address: false,
                                ),
                                SizedBox(
                                  height: h*0.05,
                                ),
                              ]),
                        ):Container(),

                        state is ErrorGetTenderOwnerInfoState? ErrorPageWidget(errorText: state.error, onTap: (){
                          mBloc.add(GetTenderOwnerInfoEvent(tenderId: offersOnTendersB2BEntity.tenderId));
                        }):Container(),
                        SizedBox(
                          height: h*0.05,
                        ),
                        /// here offer owner info
                        mBloc.offerOwner==true?
                        state is LoadingGetOfferOwnerInfoState ?
                        const LoadingWidget():
                        MoreInfoContainerWidget(
                          widget: Column(
                              children: [
                                SizedBox(
                                  height: h*0.05,
                                ),
                                Text('Offer owner info',style: TextStyle(
                                    color: primaryColor
                                ),),
                                SizedBox(
                                  height: h*0.01,
                                ),
                                MoreInfoRowWidget(
                                  title: 'Company name ',
                                  data:mBloc.offerOwnerInfoEntity?.companyName==null?"": '${mBloc.offerOwnerInfoEntity?.companyName}',
                                  hasBuilding: false,
                                  hasText: false,
                                  address: false,
                                ),
                                SizedBox(
                                  height: h*0.01,
                                ),


                                MoreInfoRowWidget(
                                  title: 'Company Country ',
                                  data:'${mBloc.offerOwnerInfoEntity?.companyCountryName}',
                                  hasBuilding: false,
                                  hasText: false,
                                  address: false,
                                ),
                                SizedBox(
                                  height: h*0.01,
                                ),
                                MoreInfoRowWidget(
                                  title: 'Company City ',
                                  data:'${mBloc.offerOwnerInfoEntity?.companyCityName}',
                                  hasBuilding: false,
                                  hasText: false,
                                  address: false,
                                ),
                                SizedBox(
                                  height: h*0.01,
                                ),
                                MoreInfoRowWidget(
                                  title: ' Phone ',
                                  data:'${mBloc.offerOwnerInfoEntity?.mobile}',
                                  hasBuilding: false,
                                  hasText: false,
                                  address: false,
                                ),
                                SizedBox(
                                  height: h*0.01,
                                ),
                                MoreInfoRowWidget(
                                  title: ' Has Whatsapp ',
                                  data:mBloc.offerOwnerInfoEntity?.hasMobileWhatsapp==1?'Yes':'No',

                                  hasBuilding: false,
                                  hasText: false,
                                  address: false,
                                ),






                                SizedBox(
                                  height: h*0.05,
                                ),



                              ]),
                        ):Container(),
                        state is ErrorGetOfferOwnerInfoState? ErrorPageWidget(errorText: state.error, onTap: (){
                          mBloc.add(GetOfferOwnerInfoEvent(offerId: offersOnTendersB2BEntity.idOffer));
                        }):Container(),
                        SizedBox(
                          height: h*0.05,
                        ),
                        /// here for delivered button

                        state is LoadingPostOfferExecutedState?const LoadingWidget():
                        isPending==false?Container():
                            mainBloc.isLoggedEntity!.idUser==userTenderId?
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: w*0.3),
                          child: ButtonTextWidget(
                              padding: 0,
                              backgroundColor: primaryColor,
                              text: 'Delivered',
                              textColor: Colors.white,
                              textSize: w*0.04,
                              onPressed: (){
                                mBloc.add(PostOfferExecutedEvent(offerId: offersOnTendersB2BEntity.idOffer));

                              }),
                        ):Container()
                        ,
                        SizedBox(
                          height: h*0.05,
                        ),


                      ],
                    ),
                  ),
                );

              },
            ),
          );
        },
      ),
    );
  }
}
