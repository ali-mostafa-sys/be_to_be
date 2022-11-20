import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/company_information/presentation/bloc/company_information/company_information_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class RefreshPage extends StatelessWidget {
  const RefreshPage({Key? key}) : super(key: key);

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
        listener: (context, state) {},
        builder: (context, state) {
          return BackgroundWidget(
              widgets: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h*0.1,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: w*0.01),
                child: Container(
                  width: w*0.7,
                  height: w*0.7,

                  child: Image.asset('assets/images/refresh.png'),
                ),
              ),
              SizedBox(
                height: h*0.1,
              ),

              Text('Please wait until',
                style: TextStyle(
                fontSize: w*0.1,
                  color: HexColor('#2E2E2E')
              ),
              ),
              Text('data be accepted ..',
                style: TextStyle(
                    fontSize: w*0.1,
                    color: HexColor('#2E2E2E')
                ),
              ),

              SizedBox(
                height: h*0.1,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: w*0.1),
                child: ButtonTextWidget(
                    padding: 0,
                    backgroundColor: primaryColor,
                    text: 'Refresh',
                    textColor: Colors.white,
                    textSize: w*0.09,
                    onPressed: (){
                      //TODO: here to register company info again
                      AutoRouter.of(context).pushNamed('/main');
                    }),
              )

            ],
          ),
          );
        });
  }
}
