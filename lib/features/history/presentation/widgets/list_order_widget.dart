

import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/history/domain/entity/order_h_entity/order_h_entity.dart';
import 'package:be_to_be/features/history/presentation/bloc/history_bloc.dart';
import 'package:be_to_be/features/history/presentation/widgets/row_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';



class ListOrderHistoryWidget extends StatelessWidget {
  ListOrderHistoryWidget({Key? key,required this.orderList}) : super(key: key);

  List<OrderHEntity> orderList;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocConsumer<HistoryBloc,HistoryState>(
        listener: (context,state){},
        builder: (context,state){
          if (state is LoadingGetOrdersHState ) {

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
                                orderList[index].categoryName,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: w * 0.05,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                orderList[index].brandName,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: w * 0.04,
                                ),
                              ),
                              Text(
                                orderList[index].productName,
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
                      height: h * 0.6,
                      color: HexColor('#D1D1D1'),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          /// here for Tender quantity
                          SizedBox(
                            height: h * 0.019,
                          ),
                          RowHistoryWidget(
                              title: 'Tender quantity',
                              //${orderEntity.area}-${orderEntity.street}
                              data: ' ${orderList[index].tenderQuantity} ',
                              hasText: false,
                              hasLocation: false,
                              hasBuilding: false),
                          /// here for quantity
                          SizedBox(
                            height: h * 0.019,
                          ),
                          RowHistoryWidget(
                              title: 'Quantity',
                              //${orderEntity.area}-${orderEntity.street}
                              data:
                              ' ${orderList[index].quantity}  ',
                              hasText: false,
                              hasLocation: false,
                              hasBuilding: true),

                          /// here for bIncludeDelivery
                          SizedBox(
                            height: h * 0.019,
                          ),
                          RowHistoryWidget(
                              title: 'Include Delivery',
                              //${orderEntity.area}-${orderEntity.street}
                              data:
                              orderList[index].bIncludeDelivery==1?'Yes':'No',
                              hasText: false,
                              hasLocation: false,
                              hasBuilding: false),
                          /// here for delivery cost

                          orderList[index].bIncludeDelivery==1? SizedBox(
                            height: h * 0.019,
                          ):Container(),
                          orderList[index].bIncludeDelivery==1? RowHistoryWidget(
                              title: ' Delivery cost',
                              //${orderEntity.area}-${orderEntity.street}
                              data:
                              orderList[index].bIncludeDelivery==1?'${orderList[index].deliveryCost} \$':'0',
                              hasText: false,
                              hasLocation: false,
                              hasBuilding: false):Container(),
                          /// here for tax
                          SizedBox(
                            height: h * 0.019,
                          ),
                          RowHistoryWidget(
                              title: 'Tax/VAT',
                              //${orderEntity.area}-${orderEntity.street}
                              data:
                              orderList[index].tax!=null?'Yes':'No',
                              hasText: false,
                              hasLocation: false,
                              hasBuilding: false),
                          /// HERE FOR TAX VALUE



                          orderList[index].tax!=null? SizedBox(
                            height: h * 0.019,
                          ):Container(),
                          orderList[index].tax!=null?RowHistoryWidget(
                              title: 'Tax/VAT value',
                              //${orderEntity.area}-${orderEntity.street}
                              data:
                              orderList[index].tax!=null?'${orderList[index].tax}%':'0%',
                              hasText: false,
                              hasLocation: false,
                              hasBuilding: false):Container(),
                          /// here for price
                          SizedBox(
                            height: h * 0.019,
                          ),
                          RowHistoryWidget(
                              title: 'Price per item',

                              data:
                              '${orderList[index].priceUSD} \$',
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
                              data: '${orderList[index].status}  ',
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
                              '${DateFormat.yMd().format(DateTime.parse(orderList[index].acceptedAt!))}',
                              hasText: false,
                              hasLocation: false,
                              hasBuilding: false),
                          /// here for create At
                          SizedBox(
                            height: h * 0.019,
                          ),
                          RowHistoryWidget(
                              title: 'Create At ',
                              data:
                              '${DateFormat.yMd().format(DateTime.parse(orderList[index].creatAt!))}',
                              hasText: false,
                              hasLocation: false,
                              hasBuilding: false),
                          /// here for executed At
                          orderList[index].excutedAt!=null?
                          SizedBox(
                            height: h * 0.019,
                          ):Container(),
                          orderList[index].excutedAt!=null?
                          RowHistoryWidget(
                              title: 'Executed At ',
                              data:
                              '${DateFormat.yMd().format(DateTime.parse(orderList[index].excutedAt!))}',
                              hasText: false,
                              hasLocation: false,
                              hasBuilding: false):Container(),

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
              itemCount: orderList.length);
        },
    );
  }
}
