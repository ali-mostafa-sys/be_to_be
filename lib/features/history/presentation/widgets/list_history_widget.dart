

import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/history/domain/entity/tender_h_entity/tender_h_entity.dart';
import 'package:be_to_be/features/history/presentation/bloc/history_bloc.dart';
import 'package:be_to_be/features/history/presentation/widgets/row_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:be_to_be/injection_container.dart'as di;


class ListHistoryWidget extends StatelessWidget {
   ListHistoryWidget({Key? key,required this.tenderList}) : super(key: key);

  List<TenderHEntity> tenderList;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocConsumer<HistoryBloc,HistoryState>(
        listener: (context,state){},
        builder: (context,state){
          if (state is LoadingGetTenderHState) {
            return const LoadingWidget();
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: h * 0.2,
                      width: w,
                      color: HexColor('#EEEEEE'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //TODO: HERE MAKE IT RIGHT AFTER BACKEND CORRECT THE ERROR
                          // Padding(
                          //   padding: EdgeInsetsDirectional.only(start: w * 0.03),
                          //   child: Image.network('${orderEntity.productImgUrl}'),
                          // ),
                          SizedBox(
                            width: w * 0.06,
                          ),

                          /// here data for
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tenderList[index].categoryName,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: w * 0.05,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                tenderList[index].brandName,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: w * 0.04,
                                ),
                              ),
                              Text(
                                tenderList[index].productName,
                                style: TextStyle(
                                  color: HexColor('#7B7B7B'),
                                  fontSize: w * 0.035,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Container(
                      width: w,
                      height: h * 0.38,
                      color: HexColor('#D1D1D1'),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          /// here for product name
                          SizedBox(
                            height: h * 0.019,
                          ),
                          RowHistoryWidget(
                              title: 'Name of product',
                              //${orderEntity.area}-${orderEntity.street}
                              data: ' ${tenderList[index].name} ',
                              hasText: false,
                              hasLocation: false,
                              hasBuilding: false),

                          /// here for Supplier Location
                          SizedBox(
                            height: h * 0.019,
                          ),
                          RowHistoryWidget(
                              title: 'Supplier Location',
                              //${orderEntity.area}-${orderEntity.street}
                              data:
                              ' ${tenderList[index].supplierLocation} ',
                              hasText: false,
                              hasLocation: true,
                              hasBuilding: false),

                          /// here for Supplier Location
                          SizedBox(
                            height: h * 0.019,
                          ),
                          RowHistoryWidget(
                              title: 'Delivery Address',
                              //${orderEntity.area}-${orderEntity.street}
                              data:
                              ' ${tenderList[index].area} - ${tenderList[index].street} ',
                              hasText: false,
                              hasLocation: true,
                              hasBuilding: false),

                          /// here for quantity
                          SizedBox(
                            height: h * 0.019,
                          ),
                          RowHistoryWidget(
                              title: 'Quantity',
                              //${orderEntity.area}-${orderEntity.street}
                              data:
                              ' ${tenderList[index].quantity}  ',
                              hasText: false,
                              hasLocation: false,
                              hasBuilding: true),

                          /// here for payMethod
                          SizedBox(
                            height: h * 0.019,
                          ),
                          RowHistoryWidget(
                              title: 'Pay Method',
                              //${orderEntity.area}-${orderEntity.street}
                              data:
                              ' ${tenderList[index].payMethod}  ',
                              hasText: false,
                              hasLocation: false,
                              hasBuilding: false),

                          /// here for statues
                          SizedBox(
                            height: h * 0.019,
                          ),
                          RowHistoryWidget(
                              title: 'Statues',
                              //${orderEntity.area}-${orderEntity.street}
                              data: 'Done  ',
                              hasText: false,
                              hasLocation: false,
                              hasBuilding: false),

                          /// here for accepted at
                          SizedBox(
                            height: h * 0.019,
                          ),
                          RowHistoryWidget(
                              title: 'Accepted At ',
                              data:
                              '${DateFormat.yMd().format(DateTime.parse(tenderList[index].closedAt!))}',
                              hasText: false,
                              hasLocation: false,
                              hasBuilding: false),
                        ],
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: primaryColor,
                indent: 30,
                endIndent: 30,
                thickness: 1,
              ),
              itemCount: tenderList.length);
        },
    ) ;
  }
}


