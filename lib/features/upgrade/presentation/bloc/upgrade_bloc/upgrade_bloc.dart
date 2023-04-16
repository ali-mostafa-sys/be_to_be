import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:be_to_be/core/strings/const.dart';
import 'package:http/http.dart'as http;

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/upgrade/domain/entity/subscribe_entity/subscribe_entity.dart';
import 'package:be_to_be/features/upgrade/domain/entity/upgrade_entity/upgrade_entity.dart';
import 'package:be_to_be/features/upgrade/domain/usecase/get_all_package_use_case/get_all_package_use_case.dart';
import 'package:be_to_be/features/upgrade/domain/usecase/post_sub_usecase/post_sub_usecse.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'upgrade_event.dart';
part 'upgrade_state.dart';

class UpgradeBloc extends Bloc<UpgradeEvent, UpgradeState> {
  static UpgradeBloc get(context)=>BlocProvider.of(context);

  final GetAllPackageUseCase allPackageUseCase;
  final PostSubscribeUseCase postSubscribeUseCase;
  final SharedPreferences sharedPreferences;
 List <bool> isPop=[];

  bool isSelected=false;
  List<UpgradeEntity> allPackage=[];
  List<bool>isSelectedList=[];
  List<int>month=[];


  /// here for stipe

  Future<void> initPayment({required int subscriptionId}) async
  {
    try {
      final body={
        "subscriptionId":"$subscriptionId"
      };
      final cookies = sharedPreferences.getString('cookies');

      final response = await http.post(Uri.parse('http://b2back.net/api/user/e-pay'),
        headers: {
          "Accept": "application/json",
         // "Content-Type": "application/json",

          "Cookie": "$cookies"
        },
          body:<String, String>{
            "subscriptionId":"$subscriptionId"
          });

     final jsonResponse = jsonDecode(response.body);
      log(jsonResponse.toString());
      log(jsonResponse['token'].toString());
     //  var StripeResponse = await http.post(
     //    Uri.parse('https://api.stripe.com/v1/payment_intents'),
     //    headers: {
     //      'Authorization': 'Bearer sk_test_51MJxDgIlBqUPFzgUk0sAPWuSlhCZSjha7VkZP8yDE8IhTmZtwUvRnCq5dbmnqlCwQalN2RqKFOxb1Disenn84RhE00ScQ4TouK',
     //      'Content-Type': 'application/x-www-form-urlencoded'
     //    },
     //    body:{
     //      "amount":"5000",
     //      "currency":"usd"
     //      //"clientSecret":"${jsonResponse['token']}"
     //    }
     //  );
     // final data =json.decode(StripeResponse.body);
     //  print(data);
     //  print(data['clientSecret']);
    //  await Stripe.instance.;




      // print('${jsonResponse.toString()}');
       print('one');
      // 2. Initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: jsonResponse['token'].toString(),
          // customerId: data['id'],
           merchantDisplayName: 'ALI',
            testEnv: true,
          ),
      );
      print('tow');
    //  emit(LoadingPaymentState());


      await Stripe.instance.presentPaymentSheet().then((value) {
        emit(LoadedPaymentState());
      }).catchError((error){
        emit(ErrorPaymentState(error:'Something went wrong, please try again later' ));
        print(error);
      });
      print('three');


    } catch (errors) {
      emit(ErrorPaymentState(error:'Something went wrong, please try again later' ));

    }
  }





  UpgradeBloc({
    required this.allPackageUseCase,
    required this.postSubscribeUseCase,
    required this.sharedPreferences,
}) : super(UpgradeInitial()) {
    on<UpgradeEvent>((event, emit)async {

      ///
      /// here for is selected event
      ///
   if(event is IsSelectedContainerEvent){
     isSelectedList[event.index] = !isSelectedList[event.index];
     emit(IsSelectedContainerState(isSelected: isSelectedList[event.index]));
   }
   ///
      /// here for get all package event
      ///
   if(event is GetAllPackageEvent){
     emit(LoadingGetAllPackageState());
     final failureOrGetAllPackage=await allPackageUseCase();
     failureOrGetAllPackage.fold(
             (failure) {
               emit(ErrorGetAllPackageState(error: _mapFailureToMessage(failure)));
         },
             (allPackages) {
               allPackages.map((e) {
                 isPop.add(false);
                 final mi=e.validitySeconds/60;
                 final hou=mi/60;
                 final day=hou/24;
                 final moth=day/30;
                 month.add(moth.toInt());

                 isSelectedList.add(false);
               }).toList();
               print(month);

               allPackage=allPackages;
               print(allPackages);
               emit(LoadedGetAllPackageState());

             });
   }
   ///
      /// here for show Upgrade dialog
      ///
  if(event is ShowUpgradeDialogWidgetEvent){
    isPop[event.index]=!isPop[event.index];
    emit(OnShowUpgradeDialogState(isPop: isPop[event.index], subscriptionPackageId: allPackage[event.index].subscriptionPackageId));
  }
  ///
      /// here for post subscribe event
      ///
if(event is PostSubscribeEvent){
  emit(LoadingPostSubscribeState());

  final failureOrPostSubscribe=await postSubscribeUseCase(event.subscribeEntity);

  failureOrPostSubscribe.fold(
          (failure) {

            emit(ErrorPostSubscribeState(error: _mapFailureToMessage(failure)));
          },
          (postSubscribe) {
            emit(LoadedPostSubscribeState());
            initPayment(subscriptionId: postSubscribe);
          });


}



    });
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case OfflineFailure:
        return offlineFailureMessage;


      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
