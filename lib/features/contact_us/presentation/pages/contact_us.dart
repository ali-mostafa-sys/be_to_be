import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/contact_us/presentation/bloc/contact_us_bloc.dart';
import 'package:flutter/material.dart';
import 'package:be_to_be/injection_container.dart'as di;
import 'package:flutter_bloc/flutter_bloc.dart';


class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocProvider(
        create: (context)=>di.sl<ContactUsBloc>()..add(GetContactUsEvent()),
      child: BlocConsumer<ContactUsBloc,ContactUsState>(
        listener: (context,state){},
        builder: (context,state){
          var bloc= ContactUsBloc.get(context);
          // if(state is LoadingGetContactUsState){
          //   return const LoadingWidget();
          //
          // }

          return Scaffold(
            body:
            state is LoadingGetContactUsState?const LoadingWidget():


            BackgroundWidget(
              widgets: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: h * 0.03,
                    ),

                    Text(
                      'Contact Us',
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
                          /// here for address
                          Text('Address',style: TextStyle(
                              fontSize: w*0.05
                          ),),
                          Text('${bloc.contactUsEntity?.address} ')
                        ],
                      ),
                    ),
                    /// here for phone
                    bloc.contactUsEntity?.phone==null?Container():
                    SizedBox(
                      height: h * 0.03,
                    ),
                    bloc.contactUsEntity?.phone==null?Container():
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
                          Text('Phone',style: TextStyle(
                              fontSize: w*0.05
                          ),),
                          Text('${bloc.contactUsEntity!.phone}')
                        ],
                      ),
                    ),
                    /// here for mobile
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
                          Text('Mobile',style: TextStyle(
                              fontSize: w*0.05
                          ),),
                          Text('${bloc.contactUsEntity?.mobile}')
                        ],
                      ),
                    ),
                    /// here for email
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
                          Text('Email',style: TextStyle(
                              fontSize: w*0.05
                          ),),
                          Text('${bloc.contactUsEntity?.email}')
                        ],
                      ),
                    ),
                    /// here for more info
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
                          Text('More Information',style: TextStyle(
                              fontSize: w*0.05
                          ),),
                          Text('${bloc.contactUsEntity?.moreInfo}')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

