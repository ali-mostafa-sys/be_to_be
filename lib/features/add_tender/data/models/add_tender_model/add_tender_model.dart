

import 'package:be_to_be/features/add_tender/domain/entity/add_tender_entity/add_tender_entity.dart';

class AddTenderModel extends AddTenderEntity{

  // final String ;
  // final String ;
  // final String ;
  // final String ;
  // final String ;
  // final String ;
  // final String ;
  // final String ;
  // final String ;
  //
  // final;
  // final int quantity;
  // final int ;

  const AddTenderModel({
    required String name,
    required String from,
    required String to,
    required String deliverBefore,
    required String area,
    required String street,
    required String buildingNumber,
    required String moreAddressInfo,
    required String supplierLocation,
    required String payMethod,
    required  int productId,
    required  int quantity,
    required  int cityId,
}):super(name: name,from: from,to: to,deliverBefore: deliverBefore,area: area,street: street,buildingNumber: buildingNumber,
  moreAddressInfo: moreAddressInfo,supplierLocation: supplierLocation,payMethod: payMethod,productId: productId,quantity: quantity,cityId: cityId);

  Map<String,dynamic>toJson(){

    return {
      "name":name.toString(),
      "productId":productId.toString(),
      "quantity":quantity.toString(),
      "from":from.toString(),
      "to":to.toString(),
      "deliverBefore":deliverBefore.toString(),
      "cityId":cityId.toString(),
      "area":area.toString(),
      "street":street.toString(),
      "buildingNumber":buildingNumber.toString(),
      "moreAddressInfo":moreAddressInfo.toString(),
      "supplierLocation":supplierLocation.toString(),
      "payMethod":payMethod.toString(),
    };
  }
  // "supplierLocation":"LOCAL",//ENUM('LOCAL', 'UAE', 'GLOBAL')
  // "payMethod":"CASH"  // ENUM('CASH', 'E_PAY')

}