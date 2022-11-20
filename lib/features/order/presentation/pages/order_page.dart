import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/error_page_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/order/presentation/bloc/order_bloc.dart';
import 'package:be_to_be/features/order/presentation/widget/order_main_widget.dart';
import 'package:be_to_be/features/order/presentation/widget/row_expanded_widget.dart';
import 'package:be_to_be/features/order/presentation/widget/show_offer_dialog_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is OnShowDialogState) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return ShowOfferDialogWidget(
                  index: state.index,
                  tenderId: state.tenderId,
                );
              });
        }
      },
      builder: (context, state) {
        var orderBloc = OrderBloc.get(context);
        if (orderBloc.onExpanded.isEmpty) {
          return LoadingWidget();
        }
        if (state is LoadingGetAllOrderState) {
          return const LoadingWidget();
        }
        if(state is ErrorGetAllOrderState){
          return ErrorPageWidget(
              errorText: state.error,
              onTap: (){
                orderBloc.add(GetAllOrderEvent());
              });
        }
        return BackgroundWidget(
          widgets: ListView.separated(
              itemBuilder: (context, index) => OrderMainWidget(
                    onExpanded: orderBloc.onExpanded[index],
                    orderEntity: orderBloc.orderedList[index],
                    onAccepted: () {
                      orderBloc.add(OnShowDialogEvent(index: index));
                    },
                    toExpand: () {
                      orderBloc.add(IsExpandedEvent(index: index));
                    },
                    closeExpand: () {
                      orderBloc.add(IsExpandedEvent(index: index));
                    },
                  ),
              separatorBuilder: (context, index) {
                return Container();
              },
              itemCount: orderBloc.orderedList.length),
        );
      },
    );
  }
}
