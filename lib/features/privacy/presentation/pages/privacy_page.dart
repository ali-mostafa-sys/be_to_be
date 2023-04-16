import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/error_page_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/privacy/presentation/bloc/privacy_bloc.dart';
import 'package:flutter/material.dart';
import 'package:be_to_be/injection_container.dart'as di;
import 'package:flutter_bloc/flutter_bloc.dart';



class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (context)=>di.sl<PrivacyBloc>()..add(GetPrivacyEvent()),
        child: BlocConsumer<PrivacyBloc,PrivacyState>(
          listener: (context,state){},
          builder: (context,state){

            var bloc=PrivacyBloc.get(context);


            if(state is LoadingPrivacyState){
              return const LoadingWidget();

            }
            if(state is ErrorPrivacyState){
              return ErrorPageWidget(
                  errorText: state.error,
                  onTap: (){
                    bloc.add(GetPrivacyEvent());

                  });
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
                      'Privacy And policy',
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
                          /// here for privacy
                          // Text('Privacy And policy',style: TextStyle(
                          //     fontSize: w*0.05
                          // ),),
                          Text('${bloc.privacyEntity?.contentEn} ')

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
