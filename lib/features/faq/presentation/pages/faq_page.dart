import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/error_page_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/faq/presentation/bloc/faq_bloc.dart';
import 'package:flutter/material.dart';
import 'package:be_to_be/injection_container.dart'as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (context)=>di.sl<FaqBloc>()..add(GetFQAEvent()),
        child: BlocConsumer<FaqBloc,FaqState>(
          listener: (context,state){
            print(state);

          },
          builder: (context,state){
            var bloc =FaqBloc.get(context);

            if(state is LoadingFQAState){
              return const LoadingWidget();

            }
            if(state is ErrorFQAState){
              return ErrorPageWidget(errorText: state.error, onTap: (){
                bloc.add(GetFQAEvent());

              });
            }
            if(state is LoadedFQAState){
              return BackgroundWidget(
                widgets: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: h * 0.03,
                      ),

                      Text(
                        'FQA',
                        style: TextStyle(color: primaryColor, fontSize: w * 0.07),
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      Container(
                        width: w*0.8,
                        height: h*0.85,
                        child: ListView.separated(
                            itemBuilder: (context,index){
                              return Container(
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
                                    Text(bloc.fqaList[index].questionEn,style: TextStyle(
                                        fontSize: w*0.05
                                    ),),
                                    SizedBox(
                                      height: h*0.02,
                                    ),
                                    Text('${bloc.fqaList[index].answerEn} ')
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context,index){
                              return SizedBox(
                                height: h * 0.03,
                              );
                            },
                            itemCount: bloc.fqaList.length),
                      ),

                      SizedBox(
                        height: h * 0.03,
                      ),
                    ],
                  ),
                ),
              );

            }
            return Container();



          },
        ),
      ),
    );
  }
}
