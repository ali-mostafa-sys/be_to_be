import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/terms/presentation/bloc/terms_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:be_to_be/injection_container.dart' as di;


class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body:BlocProvider(
        create: (context)=>di.sl<TermsBloc>()..add(GetTermsEvent()),
        child: BlocConsumer<TermsBloc,TermsState>(
          listener: (context,state){},
          builder: (context,state){

            var bloc=TermsBloc.get(context);


            if(state is LoadingTermsState){
              return const LoadingWidget();

            }
            return BackgroundWidget(
              widgets: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: h * 0.03,
                    ),

                    Text(
                      'Terms And Conditions',
                      style: TextStyle(color: primaryColor, fontSize: w * 0.07),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    Container(
                      width: w * 0.8,
                      // height: h * 0.5,
                      padding: EdgeInsets.all(w*0.02),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),

                      ),
                      child: Column(
                        children: [
                          /// here for terms
                          // Text('Terms',style: TextStyle(
                          //     fontSize: w*0.05
                          // ),),
                          Text('${bloc.termsEntity?.contentEn} ')
                        ],
                      ),
                    ),

                    SizedBox(
                      height: h * 0.03,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
