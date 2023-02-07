import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/features/be_to_be/prsentation/bloc/be_to_be_bloc.dart';
import 'package:be_to_be/features/be_to_be/prsentation/widget/main_be_to_be_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:be_to_be/injection_container.dart'as di;


class BeToBePage extends StatelessWidget {
  const BeToBePage({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    return BlocProvider(
        create: (context)=>di.sl<BeToBeBloc>()..add(GetAllDataEvent()),
      child: BlocConsumer<BeToBeBloc,BeToBeState>(
        listener: (context,state){},
        builder: (context,state){
          var beBloc=BeToBeBloc.get(context);
          return Container(
            height: h,
            child: ListView.separated(
                itemBuilder: (context,index)=>MainBeToBeWidget(
                  data:beBloc.dataList[index] ,
                    toExpand: (){
                      beBloc.add(ExpandedEvent(index: 0));
                    },
                    closeExpand: (){
                      beBloc.add(ExpandedEvent(index: 0));
                    },
                    onExpanded: beBloc.isExpanded[0],
                    onAccepted: (){}),
                separatorBuilder: (context,index)=>Divider(thickness: 1,endIndent: 20,indent: 20,color: primaryColor,height: 1),
                itemCount: beBloc.dataList.length),
          );
        },
      ),
    );
  }
}
