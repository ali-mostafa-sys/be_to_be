import 'package:auto_route/auto_route.dart';
import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/routs/routes.gr.dart';
import 'package:be_to_be/core/utils/snackbar_message.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/core/widgets/loading_widget.dart';
import 'package:be_to_be/features/auth/domain/entity/login_entity/login_entity.dart';
import 'package:be_to_be/features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/company_information/presentation/bloc/company_information/company_information_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:be_to_be/injection_container.dart'as di;

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
    return BlocProvider(
        create: (context)=>di.sl<LoginBloc>()..add(GetTokenEvent()),
      child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if(state is LoadedLoginState){
              SnackBarMessage().showSnackBar(
                  message: 'Your account has been approved, please login',
                  backgroundColor: Colors.green,
                  context: context);
              //AutoRouter.of(context).pushNamed('/main');
              AutoRouter.of(context).pushAndPopUntil(LoginPage(), predicate: (route) => false);

            }
            if(state is ErrorLoginState){

              if(state.error=='Your account is under review. It may take from an hour to a full day'){
                print(LoginBloc.get(context).notes.toString());
                print(LoginBloc.get(context).notes.toString());
                print(LoginBloc.get(context).notes.toString());
                print(LoginBloc.get(context).notes.toString());
                print(LoginBloc.get(context).notes.toString());
                SnackBarMessage().showSnackBar(
                    message: '${LoginBloc.get(context).notes.toString()}',
                    backgroundColor: Colors.redAccent,
                    context: context);
                AutoRouter.of(context).pushAndPopUntil(ProfilePage(), predicate: (route) => false);
              } else{
                SnackBarMessage().showSnackBar(
                    message: state.error,
                    backgroundColor: Colors.redAccent,
                    context: context);
              }
            }

          },
          builder: (context, state) {
            var bloc=LoginBloc.get(context);
            if(state is LoadingLoginState){
              return const LoadingWidget();
            }

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

                          final loginEntity=LoginEntity(
                            email:bloc. email.toString(),
                            password:bloc. password.toString(),
                            notificationToken: bloc.token.toString(),
                          );
                          print(loginEntity);
                          bloc.add(LoginButtonEvent(loginEntity: loginEntity));


                          // //TODO: here to register company info again
                          // AutoRouter.of(context).pushNamed('/login');
                        }),
                  )

                ],
              ),
            );
          }),
    );
  }
}
