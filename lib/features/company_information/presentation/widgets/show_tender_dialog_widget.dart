import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/company_information/domain/entity/add_company_entity/add_company_entity.dart';
import 'package:be_to_be/features/company_information/presentation/bloc/company_information/company_information_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowTenderDialogWidget extends StatelessWidget {
  ShowTenderDialogWidget({Key? key}) : super(key: key);
  bool isPop = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocConsumer<CompanyInformationBloc, CompanyInformationState>(
      listener: (context, state) {
        if(state is ErrorAddCompanyState){
          SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
        }
        if(state is LoadedAddCompanyState){
          isPop = true;
          AutoRouter.of(context).pushNamed('/refresh');

        }

      },
      builder: (context, state) {
        var bloc = CompanyInformationBloc.get(context);
        if(state is LoadingAddCompanyState){
          return const  LoadingWidget();

        }
        return WillPopScope(
          onWillPop: () async => isPop,
          child: SimpleDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: AutoSizeText(
              'Do you want to receive tenders?',
              style: TextStyle(
                  color: primaryColor,
                  fontSize: w * 0.04,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            children: [
              SizedBox(
                height: h * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: w * 0.25,
                    child: ButtonTextWidget(
                        padding: 0,
                        backgroundColor: Colors.white,
                        text: 'No',
                        textColor: primaryColor,
                        textSize: 14,
                        onPressed: () {
                          isPop = true;
                          AutoRouter.of(context).pop();
                          // final addCompanyEntity =AddCompanyEntity(
                          //     nameEn: bloc.companyName.text.toString(),
                          //     companyTypeId: bloc.selectedCompanyId!,
                          //     licenseNumber: bloc.licenseNumber.text.toString(),
                          //     establishAt: bloc.establishDate.text.toString(),
                          //     licenseImgUrl: bloc.imageUrl.toString(),
                          //     cityId: bloc.selectedCityId!,
                          //     area: bloc.area.text.toString(),
                          //     street: bloc.street.text.toString(),
                          //     buildingNumber: bloc.buildingNumber.text.toString(),
                          //     addressLatitude: bloc.markerLocation!.latitude.toString(),
                          //     addressLongitude: bloc.markerLocation!.longitude.toString(),
                          //     moreAddressInfo: bloc.moreAddressInfo.text.toString(),
                          //     licenseExpirAt: bloc.licenseExpireDate.text.toString()
                          // );
                          // bloc.add(AddCompanyEvent(addCompanyEntity: addCompanyEntity));
                        // AutoRouter.of(context).pushNamed('/refresh');
                        }),
                  ),
                  Container(
                    width: w * 0.25,
                    child: ButtonTextWidget(
                        padding: 0,
                        backgroundColor: primaryColor,
                        text: 'Yes',
                        textColor: Colors.white,
                        textSize: 14,
                        onPressed: () {
                           AutoRouter.of(context).pushNamed('/refresh');
                          // final addCompanyEntity =AddCompanyEntity(
                          //     nameEn: bloc.companyName.text.toString(),
                          //     companyTypeId: bloc.selectedCompanyId!,
                          //     licenseNumber: bloc.licenseNumber.text.toString(),
                          //     establishAt: bloc.establishDate.text.toString(),
                          //     licenseImgUrl: bloc.imageUrl.toString(),
                          //     cityId: bloc.selectedCityId!,
                          //     area: bloc.area.text.toString(),
                          //     street: bloc.street.text.toString(),
                          //     buildingNumber: bloc.buildingNumber.text.toString(),
                          //     addressLatitude: bloc.markerLocation!.latitude.toString(),
                          //     addressLongitude: bloc.markerLocation!.longitude.toString(),
                          //     moreAddressInfo: bloc.moreAddressInfo.text.toString(),
                          //     licenseExpirAt: bloc.licenseExpireDate.text.toString()
                          // );
                          // bloc.add(AddCompanyEvent(addCompanyEntity: addCompanyEntity));
                        }),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
