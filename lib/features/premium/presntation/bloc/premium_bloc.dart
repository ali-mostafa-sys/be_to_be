import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'premium_event.dart';
part 'premium_state.dart';

class PremiumBloc extends Bloc<PremiumEvent, PremiumState> {
  static PremiumBloc get(context)=>BlocProvider.of(context);
  PremiumBloc() : super(PremiumInitial()) {
    on<PremiumEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
