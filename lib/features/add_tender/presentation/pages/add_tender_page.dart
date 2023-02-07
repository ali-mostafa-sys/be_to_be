


import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/features/add_tender/presentation/bloc/add_tender/add_tender_bloc.dart';
import 'package:be_to_be/features/add_tender/presentation/widgets/add_tender_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:be_to_be/injection_container.dart'as di;

class AddTenderPage extends StatelessWidget {
  const AddTenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>di.sl<AddTenderBloc>()..add(GetProductListEvent())..add(GetAllCountriesAddTenderEvent()),
      child: BlocConsumer<AddTenderBloc,AddTenderState>(
        listener: (context,state){
          if(state is LoadedAddTenderState){
            SnackBarMessage().showSnackBar(message: 'Added TENDER Successfully', backgroundColor: primaryColor, context: context);
          }
          if(state is ErrorAddTenderState){
            SnackBarMessage().showSnackBar(message: state.error, backgroundColor: Colors.redAccent, context: context);
          }
          print(state);


          // if(state is LoadedGetAllCountriesState){
          //   AddTenderBloc.get(context).add(event);
          // }

        },
        builder: (context,state){
          return AddTenderWidget();
        },
      ),

    );
  }
}
