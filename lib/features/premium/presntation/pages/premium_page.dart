import 'package:be_to_be/core/app_theme.dart';
import 'package:be_to_be/core/widgets/button_text_widget.dart';
import 'package:be_to_be/features/auth/presentation/widgets/background_widget.dart';
import 'package:be_to_be/features/premium/presntation/bloc/premium_bloc.dart';
import 'package:be_to_be/features/premium/presntation/widget/row_text_premium_widget.dart';
import 'package:flutter/material.dart';
import 'package:be_to_be/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';


class PremiumPage extends StatelessWidget {
  const PremiumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (context)=>di.sl<PremiumBloc>(),
      child: BlocConsumer<PremiumBloc,PremiumState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BackgroundWidget(
              widgets: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width:w ,
                    height: h*0.25,
                    //color: Colors.red,
                    child: Image.asset('assets/images/diamond.png'),
                  ),
                  Text('Get  Premium',style: TextStyle(
                    fontSize: w*0.08,
                    fontWeight: FontWeight.bold,
                    color: primaryColor
                  ),),
                  SizedBox(
                    height: h*0.1,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: w*0.1),

                    child: Column(
                      children: [
                        RowTextPremiumWidget(text: "Enjoy full application features ."),
                        SizedBox(
                          height: h*0.01,
                        ),
                        RowTextPremiumWidget(text: "Create Tenders and receive offers ."),
                        SizedBox(
                          height: h*0.1,
                        ),
                        ButtonTextWidget(
                            padding: h*0.02
                            , backgroundColor: primaryColor,
                            text: "Get  Premium",
                            textColor: Colors.white,
                            textSize: w*0.05,
                            onPressed: (){}),
                      ],
                    ),

                  )

          ],),);
        },



      ),
    );
  }
}
