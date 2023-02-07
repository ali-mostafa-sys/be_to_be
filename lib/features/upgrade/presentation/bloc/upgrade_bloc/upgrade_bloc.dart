import 'dart:async';

import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/core/strings/failures_message.dart';
import 'package:be_to_be/features/upgrade/domain/entity/subscribe_entity/subscribe_entity.dart';
import 'package:be_to_be/features/upgrade/domain/entity/upgrade_entity/upgrade_entity.dart';
import 'package:be_to_be/features/upgrade/domain/usecase/get_all_package_use_case/get_all_package_use_case.dart';
import 'package:be_to_be/features/upgrade/domain/usecase/post_sub_usecase/post_sub_usecse.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upgrade_event.dart';
part 'upgrade_state.dart';

class UpgradeBloc extends Bloc<UpgradeEvent, UpgradeState> {
  static UpgradeBloc get(context)=>BlocProvider.of(context);

  final GetAllPackageUseCase allPackageUseCase;
  final PostSubscribeUseCase postSubscribeUseCase;
 List <bool> isPop=[];

  bool isSelected=false;
  List<UpgradeEntity> allPackage=[];
  List<bool>isSelectedList=[];
  List<int>month=[];


  UpgradeBloc({
    required this.allPackageUseCase,
    required this.postSubscribeUseCase,
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
