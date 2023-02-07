import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/history/presentation/bloc/history_bloc.dart';
import 'package:be_to_be/features/history/presentation/widgets/list_history_widget.dart';
import 'package:be_to_be/features/history/presentation/widgets/list_order_widget.dart';
import 'package:be_to_be/features/history/presentation/widgets/row_button_widget.dart';
import 'package:be_to_be/features/history/presentation/widgets/row_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:be_to_be/injection_container.dart' as di;
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text('Your History with US'),
        backgroundColor: primaryColor,
      ),
      body: BlocProvider(
        create: (context) => di.sl<HistoryBloc>()..add(GetOrdersHEvent()),
        child: BlocConsumer<HistoryBloc, HistoryState>(
          listener: (context, state) {
            print(state);

            /// here for order
            if (state is LoadedGetOrdersHState) {
              if (state.orderList.isEmpty) {
                SnackBarMessage().showSnackBar(
                    message: 'You do not have orders with us',
                    backgroundColor: primaryColor,
                    context: context);
              }
            }
            if (state is ErrorGetOrdersHState) {
              SnackBarMessage().showSnackBar(
                  message: state.error,
                  backgroundColor: Colors.redAccent,
                  context: context);
            }

            /// here for tender
            if (state is LoadedGetTenderHState) {
              if (state.tenderList.isEmpty) {
                SnackBarMessage().showSnackBar(
                    message: 'You do not have tender with us',
                    backgroundColor: primaryColor,
                    context: context);
              }
            }
            if (state is ErrorGetTenderHState) {
              SnackBarMessage().showSnackBar(
                  message: state.error,
                  backgroundColor: Colors.redAccent,
                  context: context);
            }
          },
          builder: (context, state) {
            var hBloc = HistoryBloc.get(context);


            return BackgroundWidget(
                widgets: Column(
              children: [
                RowButtonWidget(
                  isOrder: hBloc.isOrder,
                  orderTap: () {
                    hBloc.add(GetOrdersHEvent());
                    hBloc.add(const TenderOrOrderEvent(isOrder: 'order'));
                  },
                  tenderTap: () {
                    hBloc.add(GetTenderHEvent());
                    hBloc.add(const TenderOrOrderEvent(isOrder: 'tender'));
                  },
                ),
                Container(
                  height:    h * 0.775,
                  width: w,
                  child:
                      hBloc.isOrder=='tender'?
                  ListHistoryWidget(
                    tenderList: hBloc.tenderList,
                  ):ListOrderHistoryWidget(
                        orderList:hBloc.orderList,
                      )
                  ,
                )
              ],
            ));
          },
        ),
      ),
    );
  }
}
