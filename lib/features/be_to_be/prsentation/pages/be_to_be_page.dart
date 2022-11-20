import 'package:be_to_be/features/be_to_be/prsentation/bloc/be_to_be_bloc.dart';
import 'package:be_to_be/features/be_to_be/prsentation/widget/main_be_to_be_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:be_to_be/injection_container.dart'as di;


class BeToBePage extends StatelessWidget {
  const BeToBePage({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>di.sl<BeToBeBloc>(),
      child: BlocConsumer<BeToBeBloc,BeToBeState>(
        listener: (context,state){},
        builder: (context,state){
          var beBloc=BeToBeBloc.get(context);
          return MainBeToBeWidget(
              toExpand: (){
                beBloc.add(ExpandedEvent(isExpanded: true));
              },
              closeExpand: (){
                beBloc.add(ExpandedEvent(isExpanded: false));
              },
              onExpanded: beBloc.isExpanded,
              onAccepted: (){});
        },
      ),
    );
  }
}
