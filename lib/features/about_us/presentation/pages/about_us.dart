import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/error_page_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/about_us/presentation/bloc/about_us_bloc.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:be_to_be/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (context) => di.sl<AboutUsBloc>()..add(GetAboutUsEvent()),
        child: BlocConsumer<AboutUsBloc, AboutUsState>(
          listener: (context, state) {
            print(state);
          },
          builder: (context, state) {
            var bloc=AboutUsBloc.get(context);
            if(state is LoadingGetAboutUsState){
              return const LoadingWidget();
            }
            if(state is ErrorGetAboutUsState){
              return ErrorPageWidget(
                  errorText: state.error,
                  onTap: (){
                    bloc.add(GetAboutUsEvent());

                  }
                  );
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
                      'About Us',
                      style: TextStyle(color: primaryColor, fontSize: w * 0.1),
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
                          /// here for company information
                          Text('Company Information',style: TextStyle(
                              fontSize: w*0.05
                          ),),
                          Text('${bloc.aboutUsList?.companyInfoEn} ')
                        ],
                      ),
                    ),
                    /// here for whoAreWeEn
                    bloc.aboutUsList?.whoAreWeEn==null?Container():
                    SizedBox(
                      height: h * 0.03,
                    ),
                    bloc.aboutUsList?.whoAreWeEn==null?Container():
                    Container(
                      width: w * 0.8,
                      // height: h * 0.25,
                      padding: EdgeInsets.all(w*0.02),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),

                      ),
                      child: Column(
                        children: [
                          Text('Who Are WeEn',style: TextStyle(
                              fontSize: w*0.05
                          ),),
                          Text('${bloc.aboutUsList?.whoAreWeEn}')
                        ],
                      ),
                    ),
                    /// here for viewEn
                    SizedBox(
                      height: h * 0.03,
                    ),
                    Container(
                      width: w * 0.8,
                      // height: h * 0.25,
                      padding: EdgeInsets.all(w*0.02),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),

                      ),
                      child: Column(
                        children: [
                          Text('View',style: TextStyle(
                              fontSize: w*0.05
                          ),),
                          Text('${bloc.aboutUsList?.viewEn}')
                        ],
                      ),
                    ),
                    /// here for targetEn
                    SizedBox(
                      height: h * 0.03,
                    ),
                    Container(
                      width: w * 0.8,
                      // height: h * 0.25,
                      padding: EdgeInsets.all(w*0.02),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),

                      ),
                      child: Column(
                        children: [
                          Text('Target',style: TextStyle(
                              fontSize: w*0.05
                          ),),
                          Text('${bloc.aboutUsList?.targetEn}')
                        ],
                      ),
                    ),
                    /// here for otherInfoEn
                    SizedBox(
                      height: h * 0.03,
                    ),
                    Container(
                      width: w * 0.8,
                      // height: h * 0.25,
                      padding: EdgeInsets.all(w*0.02),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),

                      ),
                      child: Column(
                        children: [
                          Text('Other Information',style: TextStyle(
                              fontSize: w*0.05
                          ),),
                          Text('${bloc.aboutUsList?.otherInfoEn}')
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
