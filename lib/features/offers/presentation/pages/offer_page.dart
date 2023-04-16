import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/error_page_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:be_to_be/features/offers/presentation/bloc/offer_bloc/offer_bloc.dart';
import 'package:be_to_be/features/offers/presentation/widget/main_offer_widget.dart';
import 'package:flutter/material.dart';
import 'package:be_to_be/injection_container.dart'as di;
import 'package:flutter_bloc/flutter_bloc.dart';




class OfferPage extends StatelessWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(

      body: BlocConsumer<MainPageBloc, MainPageState>(
        listener: (context,state){},
        builder: (context,state){
          var mainBloc = MainPageBloc.get(context);
          return BlocProvider(
            create: (context)=>di.sl<OfferBloc>()..add(GetAllCitiesOfferEvent())..add(const GetAllTenderEvent(sortValue: 'aliMo')),
            child: BlocConsumer<OfferBloc,OfferState>(
              listener: (context,state){
                print(state);
                /// here for get tender error
                if(state is ErrorGetAllTenderState){
                  SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
                }
                // if(state is LoadedGetAllTenderState){
                //   if(OfferBloc.get(context).allTenderGet.isEmpty){
                //     SnackBarMessage().showSnackBar(message: 'There is no  tender available for now', backgroundColor: Colors.redAccent, context: context);
                //   }
                //
                //
                // }

                /// here for get offer error
                if(state is ErrorGetOffersAndExpandedState){
                  SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
                }
                /// here for deleted offer
                if(state is LoadedDeleteOfferState){
                  SnackBarMessage().showSnackBar(message: 'Offer Deleted Successfully', backgroundColor: primaryColor, context: context);
                  OfferBloc.get(context).add(const GetAllTenderEvent(sortValue: 'aliMo'));

                }
                if(state is ErrorDeleteOfferState){
                  SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
                }
                ///here for accepted offer
                if(state is LoadedAcceptedOfferState){
                  SnackBarMessage().showSnackBar(message: 'Congratulations, the offer has been accepted successfully, now you have B2B', backgroundColor: primaryColor, context: context);
                  OfferBloc.get(context).add(const GetAllTenderEvent(sortValue: 'aliMo'));
                  mainBloc.add(ChangePremiumBottomNavigationBarEvent(currentPremiumIndexPage:  2));

                }
                if(state is ErrorAcceptedOfferState){
                  SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
                }


              },
              builder: (context,state){
                var offerBloc=OfferBloc.get(context);
                if(state is LoadingGetAllTenderState || state is LoadingGetCitiesOfferState ){
                  return const LoadingWidget();
                }
                if(state is ErrorGetAllTenderState){
                  return ErrorPageWidget(errorText: state.error, onTap: (){
                    offerBloc.add(GetAllTenderEvent(sortValue: 'aliMo'));

                  });
                }
                // if(state is LoadingGetCitiesOfferState){
                //   return const LoadingWidget();
                // }
                return BlocConsumer<MainPageBloc,MainPageState>(
                  listener: (context,state){
                    if(state is SortButtonState){
                      offerBloc.add(GetAllTenderEvent(sortValue: state.sortValue));
                    }
                  },
                  builder: (context,state){
                    return BackgroundWidget(
                      widgets: Container(
                        width: w,
                        height: h*0.9,
                        //color: Colors.red,
                        child: ListView.separated(
                            itemBuilder: (context,index)=>MainOfferWidget(
                                indexMainList: index,
                                tenderEntity: offerBloc.allTenderGet[index],
                                totalPrice: offerBloc.totalPrices,
                                location: offerBloc.location,
                                deliveryTimePeriod: offerBloc.deliveryTimePeriod[index],
                                maxTenderPeriod: offerBloc.maxTenderPeriod[index],
                                // closeExpand: (){
                                //   offerBloc.add(ExpandedAndGetOffersOnTenderEvent(index: index,tenderId: offerBloc.allTenderGet[index].tenderId.toInt()));
                                // },
                                onAccepted: (){
                                  offerBloc.add(ExpandedAndGetOffersOnTenderEvent(index: index,tenderId: offerBloc.allTenderGet[index].tenderId.toInt()));
                                }),
                            separatorBuilder: (context,index)=>Container(height: h*0.01,),
                            itemCount: offerBloc.allTenderGet.length),
                      ),
                    );
                  },
                );
              },
            ),

          );
        },
      ),
    );
  }
}
