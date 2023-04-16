
import 'package:be_to_be/features/more_info/presentation/widgets/more_info_container_widget.dart';
import 'package:be_to_be/features/more_info/presentation/widgets/row_more_info_widget.dart';
import 'package:flutter/material.dart';



class OfferInformationWidget extends StatelessWidget {
   OfferInformationWidget({Key? key,required this.includeDelivery,required this.deliveryCost,
   required this.tax,required this.itemPrice,required this.quantity}) : super(key: key);


   int includeDelivery;
   int? deliveryCost;
   int itemPrice;
   int quantity;
   String? tax;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return MoreInfoContainerWidget(
      widget: Column(
        children: [
          SizedBox(
            height: h*0.05,
          ),
          MoreInfoRowWidget(
            title: 'Include Delivery',
            data:includeDelivery==1? 'Yes':'No',
            hasBuilding: false,
            hasText: false,
            address: false,
          ),
          includeDelivery==1?
          SizedBox(
            height: h*0.01,
          ):Container(),
          includeDelivery==1?
          MoreInfoRowWidget(
            title: 'Delivery Cost',
            data:'$deliveryCost \$',
            hasBuilding: false,
            hasText: false,
            address: false,
          ):Container(),
          SizedBox(
            height: h*0.01,
          ),
          MoreInfoRowWidget(
            title: 'Include VAT/TAX',
            data:tax==null?'No':'Yes',
            hasBuilding: false,
            hasText: false,
            address: false,
          ),
          tax==null?Container():
          SizedBox(
            height: h*0.01,
          ),
          tax==null?Container():
          MoreInfoRowWidget(
            title: 'VAT In Percent ',
            data:'$tax %',
            hasBuilding: false,
            hasText: false,
            address: false,
          ),
          SizedBox(
            height: h*0.01,
          ),
          MoreInfoRowWidget(
            title: 'Item Price',
            data:'$itemPrice \$',
            hasBuilding: false,
            hasText: false,
            address: false,
          ),
          SizedBox(
            height: h*0.01,
          ),
          MoreInfoRowWidget(
            title: 'Quantity',
            data:'$quantity ',
            hasBuilding: true,
            hasText: false,
            address: false,
          ),


          SizedBox(
            height: h*0.05,
          ),
        ],
      ),
    );
  }
}
