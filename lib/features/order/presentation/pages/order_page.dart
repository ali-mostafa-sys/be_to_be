import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/error_page_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/home/presntation/bloc/main_bloc/main_page_bloc.dart';
import 'package:be_to_be/features/order/presentation/bloc/order_bloc.dart';
import 'package:be_to_be/features/order/presentation/widget/order_main_widget.dart';
import 'package:be_to_be/features/order/presentation/widget/row_expanded_widget.dart';
import 'package:be_to_be/features/order/presentation/widget/show_offer_dialog_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:be_to_be/injection_container.dart'as di;

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (context)=>di.sl<OrderBloc>()..add(GetAllOrderEvent(sortValue: 'ali')),
        child: BlocConsumer<OrderBloc, OrderState>(
          listener: (context, state) {
            if(state is ErrorGetMyOfferState){
              SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);

            }


            if(state is LoadedGetAllOrderState){
              if (OrderBloc.get(context).onExpanded.isEmpty) {
                SnackBarMessage().showSnackBar(message: 'There is no Order', backgroundColor: primaryColor, context: context);
              }
            }
            /// here for show dialog offer

            if (state is OnShowDialogState) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ShowOfferDialogWidget(
                      index: state.index,
                      orderLise: state.orderList,
                      tenderId: state.tenderId,
                    );
                  });
            }
            /// here for delete offer
         if(state is LoadedDeleteOfferOrderState){
           SnackBarMessage().showSnackBar(message: 'Deleted Successfully',
               backgroundColor: primaryColor,
               context: context);
           OrderBloc.get(context).add(GetAllOrderEvent(sortValue: 'ali'));
         }



          },
          builder: (context, state) {
            var orderBloc = OrderBloc.get(context);

            if (state is LoadingGetAllOrderState) {
              return const LoadingWidget();
            }
            if(state is ErrorGetAllOrderState){
              return ErrorPageWidget(
                  errorText: state.error,
                  onTap: (){
                    orderBloc.add(GetAllOrderEvent(sortValue: 'ali'));
                  });
            }
            return BlocConsumer<MainPageBloc,MainPageState>(
              listener: (context,state){
                if(state is SortButtonState){
                  orderBloc.add(GetAllOrderEvent(sortValue: state.sortValue));
                }
              },
              builder: (context,state){
                return BackgroundWidget(
                  widgets: ListView.separated(

                      itemBuilder: (context, index) => OrderMainWidget(
                        loadingWidget: orderBloc.loadingWidget[index],
                        myOfferEntity:orderBloc.myOfferEntity ,
                        deliveryTimePeriod: orderBloc.deliveryTimePeriod[index],
                        maxTenderPeriod: orderBloc.maxTenderPeriod[index],
                        onExpanded: orderBloc.onExpanded[index],
                        orderEntity: orderBloc.orderedList[index],
                        onAccepted: () {
                          orderBloc.add(OnShowDialogEvent(index: index));
                        },
                        toExpand: () {
                          orderBloc.add(GetMyOfferEvent(index: index,tenderId:orderBloc.orderedList[index].tenderId,
                              userId: MainPageBloc.get(context).isLoggedEntity!.idUser
                          ));
                        },
                        closeExpand: () {
                          orderBloc.add(GetMyOfferEvent(index: index,tenderId:orderBloc.orderedList[index].tenderId,
                              userId: MainPageBloc.get(context).isLoggedEntity!.idUser
                          ));
                          //orderBloc.add(IsExpandedEvent(index: index));
                        },
                      ),
                      separatorBuilder: (context, index) {
                        return Container();
                      },
                      itemCount: orderBloc.orderedList.length),
                );
              },

            );
          },
        ),
      ),
    );
  }
}
