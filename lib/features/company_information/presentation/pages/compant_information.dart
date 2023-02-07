import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/strings/const.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/error_page_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/core/widgets/text_form_widget.dart';
import 'package:be_to_be/core/widgets/up_page_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_verification_company_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/company_information/domain/entity/country_entity/country_entity.dart';
import 'package:be_to_be/features/company_information/presentation/bloc/company_information/company_information_bloc.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:be_to_be/injection_container.dart' as di;
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class CompanyInformationPage extends StatelessWidget {
  CompanyInformationPage({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var companyId = GlobalKey();
  var countryId = GlobalKey();
  var cityId = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _buildBody(h: h, w: w),
    );
  }

  Widget _buildBody({required double h, required double w}) {
    return BlocConsumer<CompanyInformationBloc, CompanyInformationState>(
      listener: (context, state) {
        print(state);
        if(state is LoadedGetCountiesState ){
          if( state.countryId!=null ){
            CompanyInformationBloc.get(context).add(GetAllCitiesEvent(countryId: state.countryId!));

          }

        }
      },
      builder: (context, state) {
        var bloc = CompanyInformationBloc.get(context);
        if(state is LoadingGetCompanyTypeState){
          return const LoadingWidget();


        }
        if (state is LoadingGetCountiesState) {
          return const LoadingWidget();
        }
        if (state is LoadingUploadImageState) {
          return const LoadingWidget();
        }
        if (state is LoadingGetCitiesState) {
          return const LoadingWidget();
        }
        if (state is ErrorGetCitiesState) {
          return ErrorPageWidget(
              errorText: state.error,
              onTap: () {
                bloc.add(GetAllCitiesEvent(countryId: bloc.selectedCountryId!));
              });
        }

        if (state is ErrorUploadImageState) {
          return ErrorPageWidget(
              errorText: state.error,
              onTap: () {
                bloc.add(UploadImageEvent(imageFile: bloc.licenseImage!));
              });
        }
        if (state is ErrorGetCompanyTypeState) {
          return ErrorPageWidget(
              errorText: state.error,
              onTap: () {
                bloc.add(GetAllCompanyTypeEvent());
              });
        }

        return Padding(
          padding: EdgeInsets.only(top: h * 0.036),
          child: BackgroundWidget(
              widgets: Stack(
            children: [
              UpPageWidget(
                title: "Company Info ",
                text: "Please enter your company data.",
                textPadding: w * 0.05,
              ),
              Padding(
                padding: EdgeInsets.only(top: h * 0.26),
                child: BackgroundVerificationCompanyWidget(
                  widgets: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: h * 0.05,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                TextFormFieldWidget(
                                    controller: bloc.companyName,
                                    textInputType: TextInputType.text,
                                    obscureText: false,
                                    labelText: 'Company Name',
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Company Name shouldn\'t be empty';
                                      }
                                    }),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                TextFormFieldWidget(
                                    controller: bloc.establishDate,
                                    textInputType: TextInputType.none,
                                    obscureText: false,
                                    hintText: 'YYYY-MM-DD',
                                    labelText: 'Establish Date',
                                    onTap: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.parse(
                                                  "2020-08-27T19:00:00Z"),
                                              firstDate: DateTime.parse(
                                                  "2020-08-27T19:00:00Z"),
                                              lastDate: DateTime.now())
                                          .then((value) {
                                        bloc.establishDate.text =
                                            DateFormat.yMd().format(
                                          value!,
                                        );
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Establish Date shouldn\'t be empty';
                                      } else {
                                        return null;
                                      }
                                    }),
                                // TODO: DropDownButton
                                SizedBox(
                                  height: h * 0.02,
                                ),

                                /// here for company id
                                Container(
                                  padding: EdgeInsetsDirectional.only(
                                      start: w * 0.02),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          width: 1, color: primaryColor),
                                      color: HexColor('#DCDCDC')),
                                  child: DropdownButton(
                                      borderRadius: BorderRadius.circular(25),
                                      key: companyId,
                                     // alignment: Alignment.bottomCenter,
                                      underline: Container(
                                        width: 0,
                                        height: 0,
                                      ),
                                      dropdownColor: HexColor('#DCDCDC'),
                                      menuMaxHeight: h * 0.3,
                                      isExpanded: true,
                                      isDense: false,
                                      value: bloc.selectedCompanyType,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: primaryColor,
                                        size: w * 0.1,
                                      ),
                                      elevation: 16,
                                      hint: Text(
                                        'Company Type',
                                        style: TextStyle(color: primaryColor),
                                      ),
                                      style: TextStyle(color: primaryColor),
                                      onChanged: (String? newValue) {
                                        //newValue=cubits.countryLanguage;

                                        bloc.add(
                                            SelectedValueForDropDownButtonEvent(
                                                selectedValue: newValue!));
                                      },
                                      items: bloc.companyType
                                          .map<DropdownMenuItem<String>>((e) {
                                        return DropdownMenuItem<String>(
                                          value: e.companyType,
                                          child: Text(e.companyType),
                                        );
                                      }).toList()),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                ),

                                /// here for choose country
                                Container(
                                  padding: EdgeInsetsDirectional.only(
                                     start: w * 0.02,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          width: 1, color: primaryColor),
                                      color: HexColor('#DCDCDC')),
                                  child:
                                      ///hew/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                  // DropdownSearch(
                                  //   popupBackgroundColor: HexColor('#DCDCDC'),
                                  //
                                  //
                                  //
                                  //
                                  //   itemAsString: (CountryEntity? country)=>country!.nameEn,
                                  //
                                  //   dropdownSearchBaseStyle: TextStyle(
                                  //     color: primaryColor,
                                  //
                                  //   ),
                                  //
                                  //   dropdownSearchDecoration: InputDecoration(
                                  //     border: OutlineInputBorder(
                                  //       borderSide: BorderSide(width: 1,color: primaryColor),
                                  //       borderRadius: BorderRadius.all(Radius.circular(25)),
                                  //
                                  //     ),
                                  //     focusedBorder: OutlineInputBorder(
                                  //       borderSide: BorderSide(width: 1,color: primaryColor),
                                  //       borderRadius: BorderRadius.all(Radius.circular(25)),
                                  //
                                  //     ),
                                  //     enabledBorder: OutlineInputBorder(
                                  //       borderSide: BorderSide(width: 1,color: primaryColor),
                                  //       borderRadius: BorderRadius.all(Radius.circular(25)),
                                  //
                                  //     ),
                                  //     labelText: 'Country',
                                  //
                                  //     contentPadding: EdgeInsetsDirectional.only(start: w*0.03),
                                  //     labelStyle: TextStyle(
                                  //       fontSize: w*0.045,
                                  //       color: primaryColor
                                  //     ),
                                  //
                                  //   ),
                                  //
                                  //
                                  //
                                  //   mode: Mode.MENU,
                                  //   items: bloc.country,
                                  //  // showSearchBox: true,
                                  //   onChanged: (CountryEntity? country){
                                  //     print(country);
                                  //
                                  //   },
                                  // )
                                  DropdownButton(

                                      borderRadius: BorderRadius.circular(25),
                                      key: countryId,
                                     // alignment: Alignment.bottomCenter,
                                      underline: Container(
                                        width: 0,
                                        height: 0,
                                      ),
                                      dropdownColor: HexColor('#DCDCDC'),
                                      menuMaxHeight: h * 0.3,
                                      isExpanded: true,
                                      isDense: false,
                                      value: bloc.selectedCountry,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: primaryColor,
                                        size: w * 0.1,
                                      ),
                                      elevation: 16,
                                      hint: Text(
                                        'Country',
                                        style: TextStyle(color: primaryColor),
                                      ),
                                      style: TextStyle(color: primaryColor),
                                      onChanged: (String? newValue) {
                                        bloc.add(
                                            SelectedValueForCountriesDropDownButtonEvent(
                                                selectedValue: newValue!));

                                        Future.delayed(
                                            const Duration(
                                                 seconds:2 ,
                                              //  milliseconds: 500
                                            ), () {
                                          print(bloc.selectedCountryId);
                                          bloc.add(GetAllCitiesEvent(
                                              countryId:
                                                  bloc.selectedCountryId!));
                                        });
                                      },
                                      items: bloc.country
                                          .map<DropdownMenuItem<String>>((e) {
                                        return DropdownMenuItem<String>(
                                          value: e.nameEn,
                                          child: Row(
                                            children: [Text(e.nameEn)],
                                          ),
                                        );
                                      }).toList())
                                  ,
                                ),
                                bloc.selectedCountry != null
                                    ? SizedBox(
                                        height: h * 0.02,
                                      )
                                    : Container(),

                                /// here for choose city

                                bloc.selectedCountry != null
                                    ? Container(
                                        padding: EdgeInsetsDirectional.only(
                                            start: w * 0.02),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            border: Border.all(
                                                width: 1, color: primaryColor),
                                            color: HexColor('#DCDCDC')),
                                        child: DropdownButton(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            key: cityId,
                                           // alignment: Alignment.bottomCenter,
                                            underline: Container(
                                              width: 0,
                                              height: 0,
                                            ),
                                            dropdownColor: HexColor('#DCDCDC'),
                                            menuMaxHeight: h * 0.3,
                                            isExpanded: true,
                                            isDense: false,
                                            value: bloc.selectedCity,
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: primaryColor,
                                              size: w * 0.1,
                                            ),
                                            elevation: 16,
                                            hint: Text(
                                              'City',
                                              style: TextStyle(
                                                  color: primaryColor),
                                            ),
                                            style:
                                                TextStyle(color: primaryColor),
                                            // underline: Container(
                                            //   height: 0,
                                            // ),
                                            onChanged: (String? newValue) {
                                              //newValue=cubits.countryLanguage;

                                              bloc.add(
                                                  SelectedValueForCitiesDropDownButtonEvent(
                                                      selectedValue:
                                                          newValue!));
                                            },
                                            items: bloc.cities
                                                .map<DropdownMenuItem<String>>(
                                                    (e) {
                                              return DropdownMenuItem<String>(
                                                value: e.nameEn,
                                                child: Text(e.nameEn),
                                              );
                                            }).toList()),
                                      )
                                    : Container(),

                                SizedBox(
                                  height: h * 0.02,
                                ),
                                TextFormFieldWidget(
                                    controller: bloc.licenseNumber,
                                    textInputType: TextInputType.text,
                                    obscureText: false,
                                    labelText: 'License Number',
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'License Expire Date shouldn\'t be empty';
                                      } else {
                                        return null;
                                      }
                                    }),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                TextFormFieldWidget(
                                    controller: bloc.licenseExpireDate,
                                    textInputType: TextInputType.none,
                                    hintText: 'YYYY-MM-DD',
                                    obscureText: false,
                                    labelText: 'License Expire Date',
                                    onTap: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime.parse(
                                                  "2050-08-27T19:00:00Z"))
                                          .then((value) {
                                        bloc.licenseExpireDate.text =
                                            DateFormat.yMd().format(
                                          value!,
                                        );
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'License Expire Date shouldn\'t be empty';
                                      } else {
                                        return null;
                                      }
                                    }),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: h * 0.2,
                                  decoration: BoxDecoration(
                                      color: HexColor("#DCDCDC"),
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          color: primaryColor, width: 1)),
                                  child: Center(
                                    child: bloc.licenseImage == null
                                        ? bloc.imageUrl==null?

                                    InkWell(
                                            onTap: () {
                                              bloc.add(PickImageLicenseEvent());
                                            },
                                            child: Text(
                                              'Pick License Image',
                                              style: TextStyle(
                                                  color: primaryColor),
                                            ),
                                          )
                                        : Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              Image.network('${bloc.imageUrl}',width: double.infinity,height: h*0.2,)
                                              ,
                                              IconButton(
                                                onPressed: () {
                                                  bloc.add(
                                                      DeleteLicenseImageEvent());
                                                },
                                                icon: Icon(
                                                  Icons.clear,
                                                  color: primaryColor,
                                                ),
                                              ),
                                              // Align(
                                              //     alignment:
                                              //         Alignment.bottomRight,
                                              //     child: IconButton(
                                              //         onPressed: () {
                                              //           //TODO: FOR UPLOAD IMAGE
                                              //           bloc.add(UploadImageEvent(
                                              //               imageFile: bloc
                                              //                   .licenseImage!));
                                              //         },
                                              //         icon: Icon(
                                              //           Icons
                                              //               .cloud_upload_outlined,
                                              //           color: primaryColor,
                                              //         )))
                                            ],
                                          ):
                                    Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Image.file(
                                          bloc.licenseImage!,
                                          width: double.infinity,
                                        )
                                        ,
                                        IconButton(
                                          onPressed: () {
                                            bloc.add(
                                                DeleteLicenseImageEvent());
                                          },
                                          icon: Icon(
                                            Icons.clear,
                                            color: primaryColor,
                                          ),
                                        ),
                                        Align(
                                            alignment:
                                            Alignment.bottomRight,
                                            child: IconButton(
                                                onPressed: () {
                                                  //TODO: FOR UPLOAD IMAGE
                                                  bloc.add(UploadImageEvent(
                                                      imageFile: bloc
                                                          .licenseImage!));
                                                },
                                                icon: Icon(
                                                  Icons
                                                      .cloud_upload_outlined,
                                                  color: primaryColor,
                                                )))
                                      ],
                                    )
                                    ,
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                ButtonTextWidget(
                                    padding: h * 0.01,
                                    backgroundColor: primaryColor,
                                    text: 'Next',
                                    textColor: Colors.white,
                                    textSize: w * 0.06,
                                    onPressed: () {
                                      // bloc.add(GetCurrentLocationEvent());
                                      AutoRouter.of(context)
                                          .pushNamed('/companyPosition');
                                      print(bloc.imageUrl);

                                      if (formKey.currentState!.validate()) {
                                        if (bloc.selectedCompanyType != null) {
                                          if (bloc.licenseImage != null) {
                                            if (bloc.imageUrl != null) {
                                              if (bloc.selectedCountry !=
                                                  null) {
                                                if (bloc.selectedCity != null) {
                                                  bloc.add(
                                                      GetCurrentLocationEvent());
                                                  AutoRouter.of(context)
                                                      .pushNamed(
                                                          '/companyPosition');
                                                } else {
                                                  SnackBarMessage()
                                                      .showSnackBar(
                                                          message:
                                                              'Choose city',
                                                          backgroundColor:
                                                              Colors.redAccent,
                                                          context: context);
                                                }
                                              } else {
                                                SnackBarMessage().showSnackBar(
                                                    message: 'Choose  Country',
                                                    backgroundColor:
                                                        Colors.redAccent,
                                                    context: context);
                                              }
                                            } else {
                                              SnackBarMessage().showSnackBar(
                                                  message:
                                                      'Upload your License image',
                                                  backgroundColor:
                                                      Colors.redAccent,
                                                  context: context);
                                            }
                                          } else {
                                            SnackBarMessage().showSnackBar(
                                                message:
                                                    'Choose your License image',
                                                backgroundColor:
                                                    Colors.redAccent,
                                                context: context);
                                          }
                                        } else {
                                          SnackBarMessage().showSnackBar(
                                              message:
                                                  'Choose your company type ',
                                              backgroundColor: Colors.redAccent,
                                              context: context);
                                        }
                                      }
                                    }),
                                SizedBox(
                                  height: h * 0.1,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
        );
        ;
      },
    );
  }
}
