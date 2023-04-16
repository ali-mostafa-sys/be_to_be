import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/company_information/presentation/bloc/company_information/company_information_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class GoogleMapPage extends StatelessWidget {
   GoogleMapPage({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {



    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return BlocConsumer<CompanyInformationBloc,CompanyInformationState>(
      listener: (context,state){},
      builder: (context,state){
        var companyBloc=CompanyInformationBloc.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: Container(),
            backgroundColor: primaryColor,
            title: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white),
              ),
              onSubmitted: (value) {
                companyBloc.add(GoogleMapSearchEvent(text: value.toString()));
                //searchPlaces(value);
              },
            ),
          ),

          body: _buildBody(h: h,w: w),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: (){
              if(companyBloc.markerLocation!=null){
                companyBloc.add(GetCompanyLocationInfoEvent(position:companyBloc.markerLocation! ));
                AutoRouter.of(context).pop();
              }else{
                SnackBarMessage().showSnackBar(
                    message:'Choose your company location ',
                    backgroundColor: Colors.redAccent,
                    context: context);
              }
            },
            backgroundColor: primaryColor,
            label: Text('Ok'),
            //icon: Icon(Icons.directions_boat),
          ),
        );
      },


    );
  }
  Widget _buildBody({required double h,required double w}){
    return BlocConsumer<CompanyInformationBloc,CompanyInformationState>(
        listener: (context,state){},
        builder: (context,state){

          var bloc = CompanyInformationBloc.get(context);
          if (bloc.currentPosition == null) {
            return const LoadingWidget();
          }
          return GoogleMap(
            onTap: bloc.handleTap,



            /// her e to choose the type of the map//////////
            mapType: MapType.hybrid,
            markers: {bloc.myMarker!} ,

            initialCameraPosition: CameraPosition(

              target: LatLng(bloc.currentPosition!.latitude,
                  bloc.currentPosition!.longitude,
              ),
              zoom: 14.4746,

            ),
            onMapCreated: (GoogleMapController controller) {
              bloc.controller.complete(controller);
            },
          );
        },
    );
  }

}
