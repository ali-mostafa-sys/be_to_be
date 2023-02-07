import 'package:be_to_be/features/chooase_tender/domain/entity/care_entity/care_entity.dart';


class DataModel extends DataEntity{

 const  DataModel({
     List<int>? categories,
     List<int>?  brands,
     List<int>?  products,
}):super(categoryEntity: categories,productEntity: products,brandEntity: brands);


  Map<String,dynamic>toJson(){
    return {
      "cares":[
        if(categoryEntity!=null)
        for(int i=0;i<categoryEntity!.length;i++){"categoryId":"${categoryEntity![i].toString()}"},
        if(brandEntity!=null)
        for(int i=0;i<brandEntity!.length;i++){"brandId":"${brandEntity![i].toString()}"},
        if(productEntity!=null)
        for(int i=0;i<productEntity!.length;i++){"productId":"${productEntity![i].toString()}"},



]


    };
  }


}
// categoryEntity!.map((e) => {"categoryId":"$e"}).toList().toString(),
// brandEntity?.map((e) => {"brandId":e.toString()}).toList(),
// productEntity?.map((e) => {"productId":e.toString()}).toList(),