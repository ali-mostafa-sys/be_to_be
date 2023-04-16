import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/error_page_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/be_to_be/prsentation/bloc/be_to_be_bloc.dart';
import 'package:be_to_be/features/be_to_be/prsentation/widget/main_be_to_be_widget.dart';
import 'package:be_to_be/features/profile/presentation/widget/button_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:be_to_be/injection_container.dart' as di;
import 'package:hexcolor/hexcolor.dart';

class BeToBePage extends StatelessWidget {
  const BeToBePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) =>
          di.sl<BeToBeBloc>()..add(GetAllDataEvent(isPending: true)),
      child: BlocConsumer<BeToBeBloc, BeToBeState>(
        listener: (context, state) {
          print(state);
          if (state is ErrorGetALLdDataState) {
            SnackBarMessage().showSnackBar(
                message: state.error,
                backgroundColor: Colors.redAccent,
                context: context);
          }
          if(state is ErrorGetOffersOnTenderState){
            SnackBarMessage().showSnackBar(
                message: state.error,
                backgroundColor: Colors.redAccent,
                context: context);
          }
        },
        builder: (context, state) {
          var beBloc = BeToBeBloc.get(context);
          if (state is LoadingGetALLdDataState) {
            return const LoadingWidget();
          }

          return Container(
              height: h,
              child: Column(
                children: [
                  Container(
                    height: h * 0.1,
                    child: Row(
                      children: [
                        Expanded(
                          child: ButtonProfiletWidget(
                              padding: h * 0.02,
                              backgroundColor: beBloc.isPending == true
                                  ? HexColor("#489F85")
                                  : HexColor('#9F9F9F'),
                              text: "Pending",
                              textSize: w * 0.05,
                              onPressed: () {
                                beBloc.add(const IsDeliveredEvent(
                                    isPending: true, isDelivered: false));
                                beBloc.add(GetAllDataEvent(isPending: true));
                              }),
                        ),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        Expanded(
                          child: ButtonProfiletWidget(
                              padding: h * 0.02,
                              backgroundColor: beBloc.isDelivered == true
                                  ? HexColor("#489F85")
                                  : HexColor('#9F9F9F'),
                              text: "Delivered",
                              textSize: w * 0.05,
                              onPressed: () {
                                beBloc.add(const IsDeliveredEvent(
                                    isPending: false, isDelivered: true));
                                beBloc.add(GetAllDataEvent(isPending: false));
                              }),
                        ),
                      ],
                    ),
                  ),
                  state is ErrorGetALLdDataState
                      ? Container(
                          height: h * 0.65,
                          child: ErrorPageWidget(
                              errorText: state.error,
                              onTap: () {
                                beBloc.add(GetAllDataEvent(
                                    isPending: beBloc.isPending == true
                                        ? true
                                        : false));
                              }),
                        )
                      : Container(),
                  state is ErrorGetALLdDataState
                      ? Container()
                      : Container(
                          height: h * 0.67,
                          child: beBloc.isPending == true
                              ? ListView.separated(
                                  itemBuilder: (context, indexs) =>
                                      MainBeToBeWidget(
                                          data: beBloc.dataList[indexs],
                                          loading: beBloc.loading[indexs],
                                          isPending: true,
                                          toExpand: () {
                                            beBloc.add(ExpandedEvent(
                                                index: indexs,
                                                tenderId: beBloc
                                                    .dataList[indexs].idTender,
                                                isExecuted: indexs));
                                          },
                                          closeExpand: () {
                                            beBloc.add(ExpandedEvent(
                                                index: indexs,
                                                tenderId: beBloc
                                                    .dataList[indexs].idTender,
                                                isExecuted: indexs));
                                          },
                                          onExpanded: beBloc.isExpanded[indexs],
                                          onAccepted: () {}),
                                  separatorBuilder: (context, indexs) => Divider(
                                      thickness: 1,
                                      endIndent: 20,
                                      indent: 20,
                                      color: primaryColor,
                                      height: 1),
                                  itemCount: beBloc.dataList.length)
                              : ListView.separated(
                                  itemBuilder: (context, index) =>
                                      MainBeToBeWidget(
                                          data: beBloc.dataList[index],
                                          loading: beBloc.loading[index],
                                          isPending: false,
                                          toExpand: () {
                                            beBloc.add(ExpandedEvent(
                                                index: index,
                                                tenderId: beBloc
                                                    .dataList[index].idTender,
                                                isExecuted: 1));
                                          },
                                          closeExpand: () {
                                            beBloc.add(ExpandedEvent(
                                                index: index,
                                                tenderId: beBloc
                                                    .dataList[index].idTender,
                                                isExecuted: 1));
                                          },
                                          onExpanded: beBloc.isExpanded[index],
                                          onAccepted: () {}),
                                  separatorBuilder: (context, index) => Divider(
                                      thickness: 1,
                                      endIndent: 20,
                                      indent: 20,
                                      color: primaryColor,
                                      height: 1),
                                  itemCount: beBloc.dataList.length),
                        ),
                ],
              ));
        },
      ),
    );
  }
}
